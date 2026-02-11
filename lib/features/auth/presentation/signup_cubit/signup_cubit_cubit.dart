import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_app/features/auth/domain/repositories/auth_repos.dart';
part 'signup_cubit_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepos) : super(SignupInitial());
  final AuthRepos authRepos;

  Future<void> createUserWithEmailAndPassword(
    String name,
    String email,
    String password,
  ) async {
    emit(SignupLoading());

    await authRepos
        .createUserWithEmailAndPassword(
          name: name,
          email: email,
          password: password,
        )
        .then((response) {
          response.fold(
            (failure) => emit(SignupFailure(failure.message)),
            (userEntity) => emit(SignupSuccess(userEntity: userEntity)),
          );
        });
  }
}
