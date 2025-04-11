import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  Future<void> registerUser({required String email, required String password}) async {
    try {
      emit(RegisterLoading());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailure(errorMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(errorMessage: 'The account already exists for that email.'));
      } else if (e.code == "invalid-email") {
        emit(RegisterFailure(errorMessage: 'invalid-email.'));
      }
    } on Exception catch (e) {
      emit(RegisterFailure(errorMessage: 'Unexpected error: $e'));
    }
  }
}
