part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}


final class RegisterSuccess extends AuthState {}

final class RegisterLoading extends AuthState {}

final class RegisterFailure extends AuthState {
  final String errorMessage;

  RegisterFailure({required this.errorMessage});
}
