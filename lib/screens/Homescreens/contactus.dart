import 'package:astu_hub/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lottie/lottie.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back))
              ],
            ),
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 0,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child:
                            Lottie.asset('assets/images/lottie/contactus.json'),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomBUtton(
                        color: Theme.of(context).colorScheme.secondary,
                        text: Center(
                            child: Text(
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.height / 45,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                'Contact Us')),
                        height: MediaQuery.of(context).size.height / 15,
                        width: MediaQuery.of(context).size.height,
                        OnClicked: () {
                          launchUrl(Uri.parse('mailto:abelbk06@gmail.com'));
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
