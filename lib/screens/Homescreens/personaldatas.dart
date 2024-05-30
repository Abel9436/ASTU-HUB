import 'package:astu_hub/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:math';

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final int typeId = 0;

  @override
  Task read(BinaryReader reader) {
    return Task(
      id: reader.readString(),
      title: reader.readString(),
      description: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.title);
    writer.writeString(obj.description);
  }
}

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  late Box<Task> _taskBox;

  @override
  void initState() {
    super.initState();
    _taskBox = Hive.box<Task>('tasks');
  }

  void addTask(String title, String description) {
    final now = DateTime.now().millisecondsSinceEpoch;
    final random = Random().nextInt(1000);
    final id = '$now$random';
    final task = Task(
      id: id,
      title: title,
      description: description,
    );
    _taskBox.add(task);
  }

  void editTask(String id, String title, String description) {
    final taskIndex =
        _taskBox.values.toList().indexWhere((task) => task.id == id);
    if (taskIndex != -1) {
      final task = _taskBox.getAt(taskIndex);
      if (task != null) {
        task.title = title;
        task.description = description;
        _taskBox.putAt(taskIndex, task);
      }
    }
  }

  void deleteTask(String id) {
    print('Deleting task with id: $id');
    print('Keys in _taskBox: ${_taskBox.keys}');
    int index = -1;
    for (int i = 0; i < _taskBox.keys.length; i++) {
      if (_taskBox.getAt(i)?.id == id) {
        index = i;
        break;
      }
    }
    if (index != -1) {
      _taskBox.deleteAt(index);
      print('Task deleted successfully');
    } else {
      print('Task with id $id does not exist');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text(
          'Schedule Your Task Here',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: _taskBox.listenable(),
        builder: (context, Box<Task> tasksBox, _) {
          final tasks = tasksBox.values.toList();
          return tasks.isEmpty
              ? Center(
                  child: Image.asset('assets/images/nocourse.png'),
                )
              : ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    return Card(
                      margin: EdgeInsets.all(8),
                      child: ListTile(
                        title: Text(task.title),
                        subtitle: Text(task.description),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => TaskFormScreen(
                                      task: task,
                                      onSave: editTask,
                                    ),
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () => deleteTask(task.id),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          child: Icon(Icons.add, color: Theme.of(context).colorScheme.primary),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TaskFormScreen(
                  onSave: (id, title, description) =>
                      addTask(title, description),
                ),
              ),
            );
          }),
    );
  }
}

class Task {
  String id;
  String title;
  String description;

  Task({required this.id, required this.title, this.description = ''});
}

class TaskFormScreen extends StatefulWidget {
  final Task? task;
  final void Function(String id, String title, String description) onSave;

  TaskFormScreen({this.task, required this.onSave});

  @override
  _TaskFormScreenState createState() => _TaskFormScreenState();
}

class _TaskFormScreenState extends State<TaskFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _description;

  @override
  void initState() {
    super.initState();
    _title = widget.task?.title ?? '';
    _description = widget.task?.description ?? '';
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      final taskId = widget.task?.id ?? Random().nextInt(1000).toString();
      widget.onSave(taskId, _title, _description);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.task == null ? 'Add Task' : 'Edit Task'),
      ),
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height / 15),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _title,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.tertiary,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
                onSaved: (value) {
                  _title = value!;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 100,
              ),
              TextFormField(
                initialValue: _description,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.tertiary,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Description'),
                onSaved: (value) {
                  _description = value!;
                },
              ),
              SizedBox(height: 20),
              CustomBUtton(
                width: 1000,
                height: MediaQuery.of(context).size.height / 15,
                color: Theme.of(context).colorScheme.secondary,
                text: Center(
                  child: Text(
                    'Schedule',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                OnClicked: _submit,
              )
            ],
          ),
        ),
      ),
    );
  }
}
