import 'dart:async';

import 'package:edspertid/src/repositories/exercise_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edspertid/src/models/exercise_model.dart';
import 'package:meta/meta.dart';

part 'exercise_event.dart';
part 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final ExerciseRepository exerciseRepository;

  ExerciseBloc({required this.exerciseRepository}) : super(ExerciseInitial()) {
    on<ExerciseEvent>((events, emit) async {
      // TODO: implement event handler
      if (events is GetExerciseListEvent) {
        emit(ExerciseLoading());
        try {
          final data = await exerciseRepository.getExerciseList(events.courseId);
          emit(ExerciseSuccess(exerciseList: data));
        } catch (e){
          emit(ExerciseFailed(errorMessage: 'Data Not Found'));
        }
      }
    });
  }
}
