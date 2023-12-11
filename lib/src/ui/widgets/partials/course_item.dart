import 'package:edspertid/src/blocs/exercise/exercise_bloc.dart';
import 'package:edspertid/src/models/course_model.dart';
import 'package:edspertid/src/ui/pages/exercise_screen.dart';
import 'package:edspertid/src/values/strings.dart';
import 'package:edspertid/src/values/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseItem extends StatelessWidget {
  const CourseItem({super.key, required this.course});

  final CourseData course;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseBloc, ExerciseState>(
      builder: (context, state) {
        return InkWell(
          onTap: (){
            context.read<ExerciseBloc>().add(GetExerciseListEvent(courseId: course.courseId));
            Navigator.push(context, MaterialPageRoute(builder: (context) => ExerciseScreen(title: course.courseName)));
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(vertical: 21, horizontal: 18),
            child: Row(
              children: [
                Container(
                  width: 53,
                  height: 53,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(13),
                  child: Image.network(
                    course.urlCover,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Text(
                          'No Img',
                          textAlign: TextAlign.center,
                          style: CustomTextStyle.noImage
                      );
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(course.courseName),
                      Text('${course.jumlahDone}/${course.jumlahMateri} ${CustomString.courseCardTextContent}'),
                      const SizedBox(height: 11),
                      const LinearProgressIndicator(
                        value: 0.5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
