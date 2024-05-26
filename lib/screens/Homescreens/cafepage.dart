import 'package:astu_hub/models/CafeModels.dart';
import 'package:astu_hub/models/Keylocations.dart';
import 'package:astu_hub/screens/Homescreens/cafedetail.dart';
import 'package:astu_hub/screens/keylocationsdescriptionpage.dart';
import 'package:astu_hub/widgets/CustomDrawer.dart';

import 'package:flutter/material.dart';

class CafePage extends StatelessWidget {
  CafePage({Key? key}) : super(key: key);

  final List<CafeModel> cafe = [
    CafeModel(
        CafeName: 'General KeyLocationss',
        CafeAdress: '''ASTU''',
        imgurl: '',
        CafeDescription:
            '''1. Academic Calendar: ASTU operates on a semester system with a detailed academic calendar outlining important dates and deadlines for each semester.2. Admission Requirements:• Undergraduate Programs: High school completion with a minimum grade point average as specified by the university.• Postgraduate Programs: A relevant bachelor's degree and fulfillment of specificprogramrequirements.3. Registration:
   • Students must register for courses at the beginning of each semester.
   • Late registration is subject to additional fees and must be completed within the designated period.'''),
    CafeModel(
        CafeName: 'General KeyLocationss',
        CafeAdress: '''ASTU''',
        imgurl: '',
        CafeDescription: ''),
    CafeModel(
        CafeName: 'General KeyLocationss',
        CafeAdress: '''ASTU''',
        imgurl: '',
        CafeDescription:
            '''1. Academic Calendar: ASTU operates on a semester system with a detailed academic calendar outlining important dates and deadlines for each semester.2. Admission Requirements:• Undergraduate Programs: High school completion with a minimum grade point average as specified by the university.• Postgraduate Programs: A relevant bachelor's degree and fulfillment of specificprogramrequirements.3. Registration:
   • Students must register for courses at the beginning of each semester.
   • Late registration is subject to additional fees and must be completed within the designated period.'''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avaliable Cafes In ASTU'),
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: cafe.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ListTile(
                tileColor: Theme.of(context).colorScheme.tertiary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                title: Text(cafe[index].CafeName),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CafeDetail(
                        cafe: cafe[index],
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
