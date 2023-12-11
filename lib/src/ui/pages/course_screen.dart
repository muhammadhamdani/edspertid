import 'package:edspertid/src/models/course_model.dart';
import 'package:edspertid/src/ui/widgets/partials/course_item.dart';
import 'package:edspertid/src/values/colors.dart';
import 'package:edspertid/src/values/strings.dart';
import 'package:edspertid/src/values/styles.dart';
import 'package:flutter/material.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen(
      {super.key, required this.title, required this.courseList});

  final String title;
  final List<CourseData> courseList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: CustomColor.primary,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(CustomString.courseTitle, style: CustomTextStyle.appTitle),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 12),
          child: ListView.separated(
              shrinkWrap: true,
              itemCount: courseList.length,
              separatorBuilder: (context, i) => const SizedBox(height: 8),
              itemBuilder: (context, i) => CourseItem(course: courseList[i])
          )
      ),
    );
  }
}
