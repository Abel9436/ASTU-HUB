import 'package:astu_hub/screens/Authpage/Login.dart';
import 'package:astu_hub/screens/Authpage/forgotpasswordd.dart';
import 'package:astu_hub/screens/Authpage/signup.dart';
import 'package:astu_hub/screens/Homescreens/MainHomePage.dart';
import 'package:astu_hub/screens/Homescreens/cafedetail.dart';
import 'package:astu_hub/screens/Homescreens/cafepage.dart';
import 'package:astu_hub/screens/Homescreens/contactus.dart';
import 'package:astu_hub/screens/Homescreens/homepage.dart';
import 'package:astu_hub/screens/Homescreens/homepage1.dart';
import 'package:astu_hub/screens/Homescreens/personaldatas.dart';
import 'package:astu_hub/screens/Homescreens/searchcourses.dart';
import 'package:astu_hub/screens/Regulationpage.dart';
import 'package:astu_hub/screens/keylocationspage.dart';
import 'package:astu_hub/screens/onboarding.dart';
import 'package:astu_hub/screens/privacy.dart';
import 'package:astu_hub/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>('tasks');
  await Hive.openBox('Astu Hub');
  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: OnBoarding()),
      theme: LightMode,
      darkTheme: DarkMode,
      initialRoute: '/',
      routes: {
        // '/': (context) => OnBoarding(),
        '/mainhome': (context) => HomeScreen(),
        '/home': (context) => HomePage(),
        '/privacy': (context) => Privacy(),
        '/forgotpassword': (context) => ForgotPassword(),
        '/login': (context) => const Login(),
        '/signup': (context) => const Signup(),
        '/contact': (context) => const Contact(),
        '/cafe': (context) => CafePage(),
        '/rules': (context) => RegulationsPage(),
        '/locations': (context) => KeyLocationssPage()
      },
    );
  }
}
