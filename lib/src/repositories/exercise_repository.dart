import 'package:dio/dio.dart';
import 'package:edspertid/src/models/exercise_model.dart';

class ExerciseRepository {
  Future<List<ExerciseData>> getExerciseList(String courseId) async {
    try {
      const url = 'https://edspert.widyaedu.com/exercise/data_exercise';
      final response = await Dio().get(url,
          queryParameters: {
            "course_id": courseId,
            "user_email": "testerngbayu@gmail.com"
          },
          options: Options(headers: {
            'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0',
          }));

      final exerciseResponse = ExerciseResponse.fromJson(response.data);

      return exerciseResponse.data;
    } catch (e) {
      rethrow;
    }
  }
}
