import 'package:edspertid/src/blocs/course/course_bloc.dart';
import 'package:edspertid/src/ui/pages/course_screen.dart';
import 'package:edspertid/src/ui/widgets/partials/course_item.dart';
import 'package:edspertid/src/values/strings.dart';
import 'package:edspertid/src/values/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseSection extends StatelessWidget {
  const CourseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              CustomString.courseTitle,
              style: CustomTextStyle.sectionTitle,
            ),
            BlocBuilder<CourseBloc, CourseState>(
              builder: (context, state) {
                if (state is CourseSuccess) {
                  return TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CourseScreen(
                                  title: CustomString.courseTitle,
                                  courseList: state.courseList)));
                    },
                    child: Text(
                      CustomString.courseAll,
                      style: const TextStyle(
                          fontSize: 10, fontWeight: FontWeight.w500),
                    ),
                  );
                }

                return TextButton(
                  onPressed: null,
                  child: Text(
                    CustomString.courseAll,
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w500),
                  ),
                );
              },
            )
          ],
        ),
        BlocBuilder<CourseBloc, CourseState>(
            builder: (context, state) {
              if (state is CourseSuccess) {
                return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    separatorBuilder: (context, i) =>
                    const SizedBox(height: 8),
                    itemBuilder: (context, i) =>
                        CourseItem(course: state.courseList[i]));
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            })
      ],
    );
  }
}
