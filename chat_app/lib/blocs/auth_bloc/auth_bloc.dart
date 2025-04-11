import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoginLoading());
        try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(email: event.email, password: event.password);
          emit(LoginSuccess());
        } on FirebaseAuthException catch (ex) {
          if (ex.code == 'user-not-found') {
            emit(LoginFailure(errorMessage: 'User not found'));
          } else if (ex.code == 'wrong-password') {
            emit(LoginFailure(errorMessage: 'Wrong password'));
          } else if (ex.code == 'invalid-email') {
            emit(LoginFailure(errorMessage: 'Invalid email'));
          } else if (ex.code == 'invalid-credential') {
            emit(LoginFailure(errorMessage: 'Invalid credential'));
          }
        } catch (e) {
          emit(LoginFailure(errorMessage: 'Unexpected error: $e'));
        }
      }
    });
  }
}
