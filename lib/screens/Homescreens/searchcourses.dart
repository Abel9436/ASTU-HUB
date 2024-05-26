import 'package:astu_hub/models/coursemodel.dart';
import 'package:astu_hub/screens/Homescreens/detailcourse.dart';
import 'package:astu_hub/widgets/Custom_Text_field.dart';
import 'package:astu_hub/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class Courses extends StatefulWidget {
  const Courses({super.key});

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  void SearchCourse(String coursename) {
    setState(() {
      DisplayCourse = AllCourses.where((element) =>
          element.CourseName.toLowerCase()
              .contains(coursename.toLowerCase())).toList();
    });
  }

  static List<CourseModel> AllCourses = [
    CourseModel(
        CourseName: 'CourseName',
        CourseCode: 'CourseCode',
        CreditHr: 3,
        CourseDescription: 'CourseDescription'),
    CourseModel(
        CourseName: 'chemistry',
        CourseCode: 'ch101',
        CreditHr: 3,
        CourseDescription: 'CourseDescription'),
    CourseModel(
        CourseName: 'Math',
        CourseCode: 'Ma101',
        CreditHr: 4,
        CourseDescription: 'CourseDescription'),
    CourseModel(
        CourseName: 'Java',
        CourseCode: 'seng101',
        CreditHr: 3,
        CourseDescription: 'CourseDescription'),
  ];
  List<CourseModel> DisplayCourse = List.from(AllCourses);
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var appcolor = Theme.of(context).colorScheme;
    return Container(
      child: Padding(
        padding: EdgeInsets.all(width / 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height / 15,
            ),
            Row(
              children: [
                Expanded(
                    child: CustomTextField(
                        fillcolor: Theme.of(context).colorScheme.tertiary,
                        OnChanged: (value) {
                          SearchCourse(value);
                        },
                        placeholder: 'search course',
                        height: height / 15,
                        width: width,
                        controller: controller)),
                SizedBox(
                  width: width / 30,
                ),
                CustomBUtton(
                    color: appcolor.secondary,
                    text: Container(
                      height: height / 15,
                      width: width / 6,
                      child: Center(
                        child: Image.asset('assets/images/slider.png',
                            height: height / 40),
                      ),
                    ),
                    OnClicked: () {}),
              ],
            ),
            SizedBox(
              height: height / 15,
            ),
            Expanded(
              child: DisplayCourse.isEmpty
                  ? Column(
                      children: [
                        Image.asset('assets/images/nocourse.png'),
                        Text(
                          '"${controller.text.toString()}" Course Not Found!',
                          style: TextStyle(
                              fontSize: height / 45,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  : ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        height: height / 100,
                      ),
                      scrollDirection: Axis.vertical,
                      itemCount: DisplayCourse.length,
                      itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CourseDescriptionPage(
                                  course: DisplayCourse[index],
                                ),
                              ),
                            );
                          },
                          minVerticalPadding: 10,
                          enabled: true,
                          tileColor: Theme.of(context).colorScheme.tertiary,
                          title: Text(DisplayCourse[index].CourseName),
                          trailing: Text(
                              style: TextStyle(fontWeight: FontWeight.bold),
                              DisplayCourse[index].CreditHr.toString()),
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
