import 'package:astu_hub/models/Keylocations.dart';
import 'package:flutter/material.dart';

class KeyLocationDescriptionPage extends StatelessWidget {
  final KeyLocations KeyLocation;

  const KeyLocationDescriptionPage({Key? key, required this.KeyLocation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          KeyLocation.PlaceName,
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
                width: 1000,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                child: Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.height / 45),
                  child: Text(
                    'Location : ${KeyLocation.PlaceAdress}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height / 40,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              Image.asset('assets/images/stadium.jpeg'),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
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
                    KeyLocation.Placedescription,
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
