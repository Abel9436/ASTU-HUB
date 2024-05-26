import 'package:astu_hub/widgets/Custom_Text_field.dart';
import 'package:astu_hub/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class GPA_CGPA_Calculator extends StatefulWidget {
  @override
  _GPA_CGPA_CalculatorState createState() => _GPA_CGPA_CalculatorState();
}

class _GPA_CGPA_CalculatorState extends State<GPA_CGPA_Calculator> {
  List<CourseField> courseFields = [CourseField()];
  List<CourseFieldCGPA> courseFieldsCGA = [CourseFieldCGPA()];
  double gpa = 0.0;
  double cgpa = 0.0;
  int totalCreditHours = 0;

  TextEditingController gradeController = TextEditingController();
  TextEditingController creditHourController = TextEditingController();
  TextEditingController CGPAgradeController = TextEditingController();
  TextEditingController CGPAcreditHourController = TextEditingController();

  void calculateCGPA() {
    double totalPoints = 0;
    int totalCredits = 0;

    for (var courseField in courseFieldsCGA) {
      String gradeText = courseField.gradeController.text;
      String creditHourText = courseField.creditHourController.text;

      if (gradeText.isNotEmpty && creditHourText.isNotEmpty) {
        double? grade = double.tryParse(gradeText);
        int? creditHours = int.tryParse(creditHourText);

        if (grade != null && creditHours != null) {
          totalPoints += grade * creditHours;
          totalCredits += creditHours;
        }
      }
    }

    String CGPAGradeText = CGPAgradeController.text;
    String CGPACreditHourText = CGPAcreditHourController.text;

    if (CGPAGradeText.isNotEmpty && CGPACreditHourText.isNotEmpty) {
      double? grade = double.tryParse(CGPAGradeText);
      int? creditHours = int.tryParse(CGPACreditHourText);

      if (grade != null && creditHours != null) {
        totalPoints += grade * creditHours;
        totalCredits += creditHours;
      }
    }

    setState(() {
      cgpa = totalCredits > 0 ? totalPoints / totalCredits : 0.0;
      totalCreditHours = totalCredits;
    });
  }

  void calculateGPA() {
    double totalPoints = 0;
    int totalCredits = 0;

    for (var courseField in courseFields) {
      String gradeText = courseField.gradeController.text;
      String creditHourText = courseField.creditHourController.text;

      if (gradeText.isNotEmpty && creditHourText.isNotEmpty) {
        double? grade = double.tryParse(gradeText);
        int? creditHours = int.tryParse(creditHourText);

        if (grade != null && creditHours != null) {
          totalPoints += grade * creditHours;
          totalCredits += creditHours;
        }
      }
    }

    setState(() {
      gpa = totalCredits > 0 ? totalPoints / totalCredits : 0.0;
      totalCreditHours = totalCredits;
    });
  }

  String selectedSemester = 'Semester 1';
  List<String> semesters = ['Semester 1', 'Semester 2', 'Semester 3'];
  String selectedOption = 'GPA';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Center(
          child: Text(
            'GPA/CGPA Calculator',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: height / 20),
            ToggleButtons(
              tapTargetSize: MaterialTapTargetSize.padded,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                      width: selectedOption == 'GPA' ? width / 2.5 : width / 7,
                      child: Center(
                          child: Text('GPA',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 45,
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold)))),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                      width: selectedOption == 'CGPA' ? width / 2.5 : width / 7,
                      child: Center(
                          child: Text(
                        'CGPA',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 45,
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold),
                      ))),
                ),
              ],
              isSelected: [selectedOption == 'GPA', selectedOption == 'CGPA'],
              onPressed: (index) {
                setState(() {
                  selectedOption = index == 0 ? 'GPA' : 'CGPA';
                });
              },
              selectedColor: Colors.white,
              fillColor: Colors.purple[100],
              borderColor: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            SizedBox(height: height * 0.03),
            if (selectedOption == 'GPA') ...[
              SizedBox(height: height * 0.03),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: height / 25, right: height / 25),
                  child: ListView.builder(
                    itemCount: courseFields.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: courseFields[index],
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: height / 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        courseFields.add(CourseField());
                      });
                    },
                    child: Container(
                      width: height / 25,
                      height: height / 25,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.03),
              Text(
                'You Have',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 40,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '${gpa.toStringAsFixed(2)} GPA',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 40,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$totalCreditHours C. HR',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 40,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Spacer(),
              CustomBUtton(
                height: height / 15,
                width: width,
                color: Theme.of(context).colorScheme.secondary,
                text: Center(
                  child: Text(
                    'Calculate GPA',
                    style: TextStyle(
                      fontSize: height / 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                OnClicked: () async {
                  calculateGPA(); // Call the function to calculate GPA
                  var DBBox = await Hive.box('Astu Hub');
                  await DBBox.put(
                      'gpa', gpa.toStringAsFixed(2).trim().toString());
                },
              ),
            ] else if (selectedOption == 'CGPA') ...[
              SizedBox(height: height * 0.03),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: height / 25, right: height / 25),
                  child: ListView.builder(
                    itemCount: courseFieldsCGA.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: courseFieldsCGA[index],
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: height / 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        courseFieldsCGA.add(CourseFieldCGPA());
                      });
                    },
                    child: Container(
                      width: height / 25,
                      height: height / 25,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.tertiary,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Icon(Icons.add,
                            color: Theme.of(context)
                                .colorScheme
                                .primary), // Use appropriate color for the plus icon
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: height * 0.03),
              Text(
                'You Have',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 40,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '${cgpa.toStringAsFixed(2)} CGPA', //
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 40,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$totalCreditHours C. HR',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 40,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Spacer(),
              CustomBUtton(
                height: height / 15,
                width: width,
                color: Theme.of(context).colorScheme.secondary,
                text: Center(
                  child: Text(
                    'Calculate CGPA',
                    style: TextStyle(
                      fontSize: height / 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                OnClicked: () async {
                  calculateCGPA(); // Call the function to calculate CGPA
                  var DBBox = await Hive.box('Astu Hub');
                  await DBBox.put(
                      'cgpa', cgpa.toStringAsFixed(2).trim().toString());
                },
              ),
// Changed to calculate CGPA
            ],
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class CourseField extends StatelessWidget {
  final TextEditingController courseController = TextEditingController();
  final TextEditingController gradeController = TextEditingController();
  final TextEditingController creditHourController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CustomTextField(
            height: height / 15,
            placeholder: 'Course..',
            controller: courseController,
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: CustomTextField(
            height: height / 15,
            placeholder: 'Grade..',
            controller: gradeController,
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: CustomTextField(
            height: height / 15,
            placeholder: 'C.Hr..',
            controller: creditHourController,
          ),
        ),
      ],
    );
  }
}

class CourseFieldCGPA extends StatelessWidget {
  final TextEditingController gradeController = TextEditingController();
  final TextEditingController creditHourController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 8),
        Expanded(
          child: CustomTextField(
            height: height / 15,
            placeholder: 'Grade..',
            controller: gradeController,
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: CustomTextField(
            height: height / 15,
            placeholder: 'C.Hr..',
            controller: creditHourController,
          ),
        ),
      ],
    );
  }
}
