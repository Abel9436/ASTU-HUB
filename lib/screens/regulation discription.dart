import 'package:astu_hub/models/RegulationModel.dart';
import 'package:flutter/material.dart';

class RegulationDescriptionPage extends StatelessWidget {
  final Regulation regulation;

  const RegulationDescriptionPage({Key? key, required this.regulation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          regulation.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height / 30),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                child: Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.height / 30),
                  child: Text(
                    regulation.description,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 45,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
