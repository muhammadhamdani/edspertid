import 'package:edspertid/src/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<SignInWithGoogleEvent>((event, emit) async {
      emit(AuthLoading());
      try {
         await authRepository.signInWithGoogle();
        emit(AuthSuccess());
      } catch (e) {
        emit(AuthFailed(errorMessage: e.toString()));
        emit(AuthFailed(errorMessage: 'Unauthorized'));
      }
    });
    // When User Presses the SignOut Button, we will send the SignOutRequested Event to the AuthBloc to handle it and emit the UnAuthenticated State
    on<SignOutEvent>((event, emit) async {
      emit(AuthLoading());
      await authRepository.signOut();
      emit(AuthFailed(errorMessage: 'Unauthorized'));
    });
    on<AuthEvent>((events, emit) async {
      // TODO: implement event handler
      // if(events is SignInWithGoogleEvent)  {
      //   emit(AuthLoading());
      //   try{
      //     final response = await authRepository.signInWithGoogle();
      //     print('message: $response');
      //     // if(response != null){
      //       // emit(AuthSuccess(user: response));
      //     // } else {
      //         // emit(AuthFailed(errorMessage: 'Error Sign In Google'));
      //     // }
      //   } catch(e){
      //     emit(AuthFailed(errorMessage: e.toString()));
      //   }
      //   // try {
      //   //   if(response != null){
      //   //     log(response.toString());
      //   //     emit(AuthSuccess(user: response));
      //   //   } else {
      //   //     emit(AuthFailed(errorMessage: 'Error Sign In Google'));
      //   //   }
      //   // } catch(e){
      //   //   emit(AuthFailed(errorMessage: e.toString()));
      //   // }
      // } else if(events is SignOutEvent){
      //   await authRepository.signOut();
      //   emit(AuthFailed(errorMessage: 'Sign Out'));
      // }
    });
  }
}
