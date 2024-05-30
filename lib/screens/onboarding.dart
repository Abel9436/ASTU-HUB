import 'package:astu_hub/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  void initState() {
    Hive.box('settings').put('is_onboarded', true);
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    var appcolor = Theme.of(context).colorScheme;
    ;
    PageController controller = PageController();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    Widget OnBoards(Widget title, Widget subtitle, discription) {
      return Container(
          child: Padding(
        padding: EdgeInsets.all(height / 20),
        child: Center(
          child: Column(children: [
            SizedBox(
              height: height / 15,
            ),
            title,
            SizedBox(
              height: height / 20,
            ),
            Image.asset('assets/images/logo.png'),
            SizedBox(
              height: height / 20,
            ),
            subtitle,
            SizedBox(
              height: height / 20,
            ),
            Text(discription),
            SizedBox(
              height: height / 10,
            ),
            CustomBUtton(
                color: Theme.of(context).colorScheme.secondary,
                text: Center(
                    child: Text('Get Started',
                        style: TextStyle(
                            color: appcolor.primary,
                            fontWeight: FontWeight.bold))),
                width: width / 1.2,
                height: height / 15,
                OnClicked: () {
                  Navigator.pushNamed(context, '/login');
                })
          ]),
        ),
      ));
    }

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              scrollDirection: Axis.horizontal,
              children: [
                OnBoards(
                    Row(
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: 'Welcome To ',
                              style: TextStyle(
                                  color: appcolor.primary,
                                  fontSize: height / 40,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: 'ASTU HUB',
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontSize: height / 40,
                                  fontWeight: FontWeight.bold))
                        ])),
                      ],
                    ),
                    Row(
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: 'Your  ',
                              style: TextStyle(
                                  color: appcolor.primary,
                                  fontSize: height / 50,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: 'Ultimate ',
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontSize: height / 50,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: 'Campus ',
                              style: TextStyle(
                                  color: appcolor.primary,
                                  fontSize: height / 50,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: 'Champion ',
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontSize: height / 50,
                                  fontWeight: FontWeight.bold))
                        ])),
                      ],
                    ),
                    'From tracking your GPA to finding the best campus spots, we\'ve got you covered.'),

                // The second On boarding Page

                OnBoards(
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Track Your ',
                          style: TextStyle(
                              color: appcolor.primary,
                              fontSize: height / 40,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: 'Academic ',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: height / 40,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: 'Performance',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: height / 40,
                              fontWeight: FontWeight.bold))
                    ])),
                    Row(
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: 'GPA  ',
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontSize: height / 50,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: 'And ',
                              style: TextStyle(
                                  color: appcolor.primary,
                                  fontSize: height / 50,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: 'CGPA ',
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontSize: height / 50,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: 'Calculator ',
                              style: TextStyle(
                                  fontSize: height / 50,
                                  fontWeight: FontWeight.bold))
                        ])),
                      ],
                    ),
                    'Stay on top of your academic progress with clear and concise visual representations.'),

                // Third ON boaarding

                OnBoards(
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Comprehensive ',
                          style: TextStyle(
                              color: appcolor.primary,
                              fontSize: height / 40,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: 'Course ',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: height / 40,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: 'Information',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: height / 40,
                              fontWeight: FontWeight.bold))
                    ])),
                    Row(
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: 'Stay  ',
                              style: TextStyle(
                                  color: appcolor.primary,
                                  fontSize: height / 50,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: 'Informed ',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: height / 50,
                              ))
                        ])),
                      ],
                    ),
                    'Stay on top of your academic progress with clear and concise visual representations.'),

                // Fourth On Boarding
                OnBoards(
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Track Anything In ',
                          style: TextStyle(
                              color: appcolor.primary,
                              fontSize: height / 40,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: 'Astu ',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: height / 40,
                              fontWeight: FontWeight.bold)),
                    ])),
                    Row(
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: 'Be  ',
                              style: TextStyle(
                                  color: appcolor.primary,
                                  fontSize: height / 50,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: 'Awared ',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: height / 50,
                              ))
                        ])),
                      ],
                    ),
                    'Access detailed curriculum information for your courses, including descriptions, credit hours, and prerequisites.')
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: SmoothPageIndicator(
              effect: SwapEffect(
                  dotHeight: height / 100,
                  dotWidth: width / 10,
                  activeDotColor: Theme.of(context).colorScheme.secondary,
                  dotColor: Color.fromARGB(255, 223, 223, 223)),
              count: 4,
              controller: controller,
            ),
          )
        ],
      ),
    );
  }
}
