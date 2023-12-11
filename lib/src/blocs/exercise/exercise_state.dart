part of 'exercise_bloc.dart';

@immutable
abstract class ExerciseState {}

class ExerciseInitial extends ExerciseState {}

class ExerciseLoading extends ExerciseState {}

class ExerciseSuccess extends ExerciseState {
  final List<ExerciseData> exerciseList;

  ExerciseSuccess({required this.exerciseList});
}

class ExerciseFailed extends ExerciseState {
  final String errorMessage;

  ExerciseFailed({required this.errorMessage});
}