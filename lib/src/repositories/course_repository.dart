import 'package:dio/dio.dart';
import 'package:edspertid/src/models/course_model.dart';

class CourseRepository {
  Future<List<CourseData>> getCourseList(String majorName) async {
    try {
      const url = 'https://edspert.widyaedu.com/exercise/data_course';
      final response = await Dio().get(url,
          queryParameters: {
            "major_name": majorName,
            "user_email": "testerngbayu@gmail.com"
          },
          options: Options(headers: {
            'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0',
          }));

      final courseResponse = CourseResponse.fromJson(response.data);
      return courseResponse.data;
    } catch (e) {
      rethrow;
    }
  }
}