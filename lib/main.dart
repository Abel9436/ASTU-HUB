import 'package:astu_hub/screens/Authpage/Login.dart';
import 'package:astu_hub/screens/Authpage/forgotpasswordd.dart';
import 'package:astu_hub/screens/Authpage/signup.dart';
import 'package:astu_hub/screens/Homescreens/MainHomePage.dart';
import 'package:astu_hub/screens/Homescreens/cafepage.dart';
import 'package:astu_hub/screens/Homescreens/contactus.dart';
import 'package:astu_hub/screens/Homescreens/homepage1.dart';
import 'package:astu_hub/screens/Homescreens/personaldatas.dart';
import 'package:astu_hub/screens/Regulationpage.dart';
import 'package:astu_hub/screens/keylocationspage.dart';
import 'package:astu_hub/screens/onboarding.dart';
import 'package:astu_hub/screens/privacy.dart';
import 'package:astu_hub/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox('Astu Hub');
  await Hive.openBox<Task>('tasks');
  var settingsBox = await Hive.openBox('settings');

  runApp(
      Main(isOnboarded: settingsBox.get('is_onboarded', defaultValue: false)));
}

class Main extends StatefulWidget {
  final bool isOnboarded;
  const Main({Key? key, required this.isOnboarded}) : super(key: key);
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Main.themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: widget.isOnboarded ? Login() : OnBoarding(),
            theme: LightMode,
            themeMode: currentMode,
            darkTheme: DarkMode,
            initialRoute: '/',
            routes: {
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
        });
  }
}
