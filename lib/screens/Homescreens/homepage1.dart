import 'package:astu_hub/widgets/c.dart';
import 'package:astu_hub/widgets/custom_button.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var DBBox = Hive.box('Astu Hub');
  var gpa = '';
  var cgpa = '';
  var username = '';
  final navbarcontroller = PageController();
  bool _showGPA = false;
  bool _showCGPA = false;
  @override
  void initState() {
    gpa = DBBox.get('gpa').toString();
    cgpa = DBBox.get('cgpa').toString();
    username = DBBox.get('name').toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var appcolor = Theme.of(context).colorScheme;
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(width / 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      maxRadius: width / 12,
                      backgroundImage: AssetImage(
                        'assets/images/logo.png',
                      ),
                    ),
                    Text(
                      '  Good Morning $username !',
                      style: TextStyle(
                          fontSize: height / 45, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height / 30,
              ),
              Card(
                color: appcolor.tertiary,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 0.2, color: appcolor.tertiary),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Your Grade Summary',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: height / 40),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: '3rd ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: height / 40,
                                    color: appcolor.primary)),
                            TextSpan(children: [
                              TextSpan(
                                  text: 'Semister',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: appcolor.tertiary))
                            ]),
                          ])),
                          IconButton(
                            icon: Icon(
                              _showGPA
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: appcolor.primary,
                            ),
                            onPressed: () {
                              setState(() {
                                _showGPA = !_showGPA;
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _showGPA ? gpa : '****',
                            style: TextStyle(
                              color: appcolor.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            'GPA',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: height / 45,
                                color: appcolor.primary),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Your Have',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: height / 45)),
                          IconButton(
                            icon: Icon(
                              _showCGPA
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _showCGPA = !_showCGPA;
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _showCGPA ? cgpa : '****',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: height / 40,
                                color: appcolor.primary),
                          ),
                          Text(
                            'CGPA',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: height / 45,
                                color: appcolor.primary),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height / 40,
              ),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                width: width,
                height: height / 5,
                child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/images/graph.jpeg',
                    )),
              ),
              SizedBox(
                height: height / 20,
              ),
              CustomBUtton(
                  width: width,
                  height: height / 15,
                  color: appcolor.secondary,
                  text: Center(
                    child: Text(
                      'Update Data',
                      style: TextStyle(
                        color: appcolor.primary,
                        fontSize: height / 45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  OnClicked: () {})
            ],
          ),
        ),
      ),
    );
  }
}
