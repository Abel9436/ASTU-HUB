import 'package:astu_hub/screens/Homescreens/homepage.dart';
import 'package:astu_hub/screens/Homescreens/homepage1.dart';
import 'package:astu_hub/screens/Homescreens/personaldatas.dart';
import 'package:astu_hub/screens/Homescreens/searchcourses.dart';
import 'package:astu_hub/widgets/CustomDrawer.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    GPA_CGPA_Calculator(),
    TaskListScreen(),
    Courses(),
  ];

  @override
  Widget build(BuildContext context) {
    var appcolor = Theme.of(context).colorScheme;
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(),
      body: _pages[_pageIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor:
            (appcolor.primary == const Color.fromARGB(255, 255, 255, 255))
                ? Colors.transparent
                : const Color.fromARGB(255, 255, 255, 255),
        color: appcolor.secondary,
        buttonBackgroundColor: appcolor.secondary,
        height: 60,
        index: 0,
        items: <Widget>[
          Icon(Icons.home, color: appcolor.primary),
          Icon(
            Icons.calculate_outlined,
            size: 30,
            color: appcolor.primary,
          ),
          Icon(Icons.task, color: appcolor.primary),
          Icon(Icons.search, color: appcolor.primary),
        ],
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
    );
  }
}
