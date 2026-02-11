part of 'signup_cubit_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final UserEntity userEntity;

  SignupSuccess({required this.userEntity});
}

class SignupFailure extends SignupState {
  final String message;

  SignupFailure(this.message);
}
