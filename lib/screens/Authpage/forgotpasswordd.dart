import 'package:astu_hub/widgets/Custom_Text_field.dart';
import 'package:astu_hub/widgets/custom_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  var DBBox = Hive.box('Astu Hub');
  List<String> security_questions = [
    'What is Your Name ?',
    'What is Your Mother\'s Name ?',
    'Who is Your Best Friend ?',
    'What is Your Sister Name ?',
  ];
  var error_text = '';
  String Selected_question = 'What is Your Name ?';
  void validate(String question, String answer) {
    try {
      var storedQuestion = DBBox.get('question');
      var storedAnswer = DBBox.get('answer');
      print(storedAnswer.toString() + answer);
      print(storedQuestion.toString() + question);
      if (storedQuestion == question && storedAnswer == answer) {
        Navigator.pushNamed(context, '/mainhome');
      } else {
        setState(() {
          error_text = "Incorrect Answer";
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
    TextEditingController passwordcontroller = TextEditingController();
    TextEditingController answercontroller = TextEditingController();
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
                height: height / 50,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                ],
              ),
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
                'Reset Password',
                style: TextStyle(
                    fontSize: height / 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height / 15,
              ),
              SizedBox(
                height: height / 60,
              ),
              Container(
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                child: Padding(
                  padding: EdgeInsets.only(left: width / 20, right: width / 50),
                  child: DropdownButton(
                      iconEnabledColor: Theme.of(context).colorScheme.tertiary,
                      isExpanded: true,
                      dropdownColor: Theme.of(context).colorScheme.tertiary,
                      icon: Icon(Icons.arrow_drop_down_circle_outlined),
                      underline: SizedBox(
                        height: 0,
                      ),
                      value: Selected_question,
                      onChanged: (newvalue) {
                        setState(() {
                          Selected_question = newvalue!;
                        });
                      },
                      items: security_questions.map((valueitem) {
                        return DropdownMenuItem(
                            value: valueitem, child: Text(valueitem));
                      }).toList()),
                ),
              ),
              SizedBox(
                height: height / 60,
              ),
              CustomTextField(
                prifixicon: Icon(Icons.question_answer,
                    color: Theme.of(context).colorScheme.tertiary),
                placeholder: 'Your Answer',
                controller: answercontroller,
                height: height / 18,
              ),
              SizedBox(
                height: height / 60,
              ),
              CustomBUtton(
                  width: width,
                  color: appcolor2,
                  text: Center(
                    child: Text(
                      'Reset Password',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  height: height / 18,
                  OnClicked: () {
                    validate(
                        Selected_question.toString(), answercontroller.text);
                  }),
              SizedBox(
                height: height / 30,
              ),
              SizedBox(height: height / 30),
              Row(
                children: [
                  Text(error_text,
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: height / 30),
              Text(
                '@Developed By ABEL',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
