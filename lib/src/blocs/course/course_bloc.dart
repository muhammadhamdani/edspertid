import 'package:edspertid/src/repositories/course_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edspertid/src/models/course_model.dart';
import 'package:meta/meta.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CourseRepository courseRepository;

  CourseBloc({required this.courseRepository}) : super(CourseInitial()) {
    on<CourseEvent>((events, emit) async {
      // TODO: implement event handler
      if (events is GetCourseListEvent) {
        emit(CourseLoading());
        final data = await courseRepository.getCourseList(events.majorName);
        emit(CourseSuccess(courseList: data));
      }
    });
  }
}
