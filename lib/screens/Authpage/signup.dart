import 'package:astu_hub/screens/Homescreens/personaldatas.dart';
import 'package:astu_hub/widgets/Custom_Text_field.dart';
import 'package:astu_hub/widgets/custom_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var DBBox = Hive.box('Astu Hub');
  List<String> security_questions = [
    'What is Your Name ?',
    'What is Your Mother\'s Name ?',
    'Who is Your Best Friend ?',
    'What is Your Sister Name ?',
  ];
  var error_text = '';
  String Selected_question = 'What is Your Name ?';

  @override
  Widget build(BuildContext context) {
    var appcolor = Theme.of(context).colorScheme;
    TextEditingController namecontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    TextEditingController answercontroller = TextEditingController();
    Color appcolor2 = Theme.of(context).colorScheme.secondary;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    void Signup(name, password, securityanswer) {
      try {
        if (name != null && password != null && securityanswer != null) {
          DBBox.put('gpa', null);
          DBBox.put('cgpa', null);
          Hive.box<Task>('tasks').clear();
          DBBox.put('name', name.toString());
          DBBox.put('password', password.toString());
          DBBox.put('question', Selected_question);
          DBBox.put('answer', securityanswer);

          showDialog(
              context: context,
              builder: (BuildContextcontext) {
                return Padding(
                  padding: EdgeInsets.only(top: height / 3, bottom: height / 3),
                  child: AlertDialog(
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.done, size: height / 10),
                        Center(
                            child: Text(
                          'You Have successfully Singnes up',
                          style: TextStyle(
                              fontSize: height / 45,
                              fontWeight: FontWeight.bold),
                        )),
                      ],
                    ),
                    actions: [
                      InkWell(
                        child: Text('ok'),
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                      )
                    ],
                  ),
                );
              });
        }
      } catch (e) {
        setState(() {
          error_text = e.toString();
        });
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(height / 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height / 15,
              ),
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  height: height / 5,
                ),
              ),
              SizedBox(
                height: height / 50,
              ),
              Text(
                'SIGNUP',
                style: TextStyle(
                    fontSize: height / 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height / 15,
              ),
              CustomTextField(
                prifixicon: Icon(
                  Icons.person_2_outlined,
                  color: appcolor.primary,
                ),
                placeholder: 'Enter Your Fullname',
                controller: namecontroller,
                height: height / 18,
              ),
              SizedBox(
                height: height / 60,
              ),
              CustomTextField(
                suffixicon: Icon(
                  Icons.visibility,
                  color: appcolor.primary,
                ),
                prifixicon: Icon(
                  Icons.key_outlined,
                  color: appcolor.primary,
                ),
                placeholder: 'Enter Your Password',
                controller: passwordcontroller,
                height: height / 18,
              ),
              SizedBox(
                height: height / 60,
              ),
              Container(
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                child: Padding(
                  padding: EdgeInsets.only(left: width / 20, right: width / 50),
                  child: DropdownButton(
                      iconEnabledColor: appcolor.primary,
                      isExpanded: true,
                      dropdownColor: Theme.of(context).colorScheme.tertiary,
                      icon: Icon(Icons.arrow_drop_down_circle_outlined),
                      underline: SizedBox(
                        height: 0,
                      ),
                      value: Selected_question,
                      onChanged: (newvalue) {
                        setState(() {
                          Selected_question = newvalue!;
                        });
                      },
                      items: security_questions.map((valueitem) {
                        return DropdownMenuItem(
                            value: valueitem, child: Text(valueitem));
                      }).toList()),
                ),
              ),
              SizedBox(
                height: height / 60,
              ),
              CustomTextField(
                prifixicon: Icon(
                  Icons.question_answer,
                  color: appcolor.primary,
                ),
                placeholder: 'Your Answer',
                controller: answercontroller,
                height: height / 18,
              ),
              SizedBox(
                height: height / 60,
              ),
              CustomBUtton(
                  width: width,
                  color: appcolor2,
                  text: Center(
                    child: Text(
                      'SIGNUP',
                      style: TextStyle(
                          color: appcolor.primary, fontWeight: FontWeight.bold),
                    ),
                  ),
                  height: height / 18,
                  OnClicked: () {
                    Signup(
                        namecontroller.text.trim(),
                        passwordcontroller.text.trim(),
                        answercontroller.text.trim());
                  }),
              SizedBox(
                height: height / 30,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      'I Have an Account',
                      style: TextStyle(color: appcolor2),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height / 30),
              Row(
                children: [
                  Text(error_text,
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: height / 30),
              Text(
                '@Developed By ABEL',
                style: TextStyle(color: appcolor.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
