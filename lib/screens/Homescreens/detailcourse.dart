import 'package:flutter/material.dart';
import 'package:astu_hub/models/coursemodel.dart';

class CourseDescriptionPage extends StatelessWidget {
  final CourseModel course;

  const CourseDescriptionPage({Key? key, required this.course})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gpa = 0;
    //function to calculate GPA
    void CalculateGPA(double grade, int chr) {}
    var appcolor = Theme.of(context).colorScheme;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Expanded(
            child: Text(course.CourseName,
                style: TextStyle(
                    fontSize: height / 40, fontWeight: FontWeight.bold))),
      ),
      body: Padding(
        padding: EdgeInsets.all(height / 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height / 15,
            ),
            Container(
              decoration: BoxDecoration(
                  color: appcolor.tertiary,
                  borderRadius: BorderRadius.circular(8)),
              height: height / 20,
              child: Center(
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: height / 30),
                      child: Text(
                        'Course Code: ${course.CourseCode}',
                        style: TextStyle(
                            fontSize: height / 45, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height / 15,
            ),
            Container(
              width: height,
              height: height / 20,
              decoration: BoxDecoration(
                  color: appcolor.tertiary,
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: EdgeInsets.only(left: height / 30),
                child: Center(
                  child: Row(
                    children: [
                      Text(
                        'Credit Hours: ${course.CreditHr}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: height / 50),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height / 15,
            ),
            Container(
              width: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.tertiary,
              ),
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height / 30),
                child: Text(
                  course.CourseDescription,
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
    );
  }
}
