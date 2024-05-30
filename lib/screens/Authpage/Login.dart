import 'package:astu_hub/widgets/Custom_Text_field.dart';
import 'package:astu_hub/widgets/custom_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController passwordcontroller = TextEditingController();
  bool is_obscured = true;
  var error_text = '';
  var DbBox = Hive.box('Astu Hub');
  void login(password) {
    var pass = DbBox.get('password').toString();

    try {
      if (pass == password) {
        Navigator.pushNamed(context, '/mainhome');
      } else {
        setState(() {
          error_text = 'Incorrect Password';
        });
      }
    } catch (e) {
      setState(() {
        error_text = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var appcolor = Theme.of(context).colorScheme;
    Color appcolor2 = Theme.of(context).colorScheme.secondary;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(height / 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height / 15,
              ),
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  height: height / 5,
                ),
              ),
              SizedBox(
                height: height / 50,
              ),
              Text(
                'LOGIN',
                style: TextStyle(
                    fontSize: height / 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height / 15,
              ),
              CustomTextField(
                is_obscures: is_obscured,
                prifixicon: Icon(
                  Icons.key_outlined,
                  color: appcolor.primary,
                ),
                placeholder: 'Enter Your Password',
                controller: passwordcontroller,
                suffixicon: InkWell(
                  child: Icon(
                    is_obscured ? Icons.visibility : Icons.visibility_off,
                    color: appcolor.primary,
                  ),
                  onTap: () {
                    setState(() {
                      is_obscured = !is_obscured;
                    });
                  },
                ),
                height: height / 15,
              ),
              SizedBox(
                height: height / 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/forgotpassword');
                    },
                    child: Text(
                      'Forgot Password ?',
                      style: TextStyle(color: appcolor2),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height / 60,
              ),
              CustomBUtton(
                  width: width,
                  color: appcolor2,
                  text: Center(
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: appcolor.primary,
                      ),
                    ),
                  ),
                  height: height / 15,
                  OnClicked: () {
                    login(passwordcontroller.text.trim());
                  }),
              SizedBox(
                height: height / 30,
              ),
              Row(
                children: [
                  Text(error_text,
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(
                height: height / 30,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text(
                      'I Don\'t Have an Account',
                      style: TextStyle(color: appcolor2),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height / 5),
              Text(
                '@Developed By ABEL',
                style: TextStyle(color: appcolor.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
