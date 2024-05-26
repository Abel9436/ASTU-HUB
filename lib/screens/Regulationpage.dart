import 'package:astu_hub/models/RegulationModel.dart';
import 'package:astu_hub/widgets/CustomDrawer.dart';
import 'package:astu_hub/screens/regulation%20discription.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ASTU Rules and Regulations',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: RegulationsPage(),
    );
  }
}

class RegulationsPage extends StatelessWidget {
  RegulationsPage({Key? key}) : super(key: key);

  final List<Regulation> regulations = [
    Regulation(
        title: 'General Regulations',
        description:
            '''1. Academic Calendar: ASTU operates on a semester system with a detailed academic calendar outlining important dates and deadlines for each semester.2. Admission Requirements:• Undergraduate Programs: High school completion with a minimum grade point average as specified by the university.• Postgraduate Programs: A relevant bachelor's degree and fulfillment of specificprogramrequirements.3. Registration:
   • Students must register for courses at the beginning of each semester.
   • Late registration is subject to additional fees and must be completed within the designated period.'''),
    Regulation(
      title: 'Academic Progress and Assessment',
      description:
          '''Details on academic progress and assessment criteria will go here.''',
    ),
    Regulation(
      title: 'Curriculum and Programs',
      description:
          '''Details on curriculum and programs offered by ASTU will go here.''',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ASTU Rules and Regulations'),
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: regulations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ListTile(
                tileColor: Theme.of(context).colorScheme.tertiary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                title: Text(regulations[index].title),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegulationDescriptionPage(
                        regulation: regulations[index],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
