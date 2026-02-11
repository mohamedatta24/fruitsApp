import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_app/features/auth/domain/repositories/auth_repos.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepos) : super(LoginInitial());
  final AuthRepos authRepos;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    emit(LoginLoading());
    await authRepos
        .signInWithEmailAndPassword(email: email, password: password)
        .then((response) {
          response.fold(
            (failure) => emit(LoginFailure(failure.message)),
            (userEntity) => emit(LoginSuccess(userEntity: userEntity)),
          );
        });
  }

  Future<void> signInWithGoogle() async {
    emit(LoginLoading());
    await authRepos.signInWithGoogle().then((response) {
      response.fold(
        (failure) => emit(LoginFailure(failure.message)),
        (userEntity) => emit(LoginSuccess(userEntity: userEntity)),
      );
    });
  }

  Future<void> signInWithFacebook() async {
    emit(LoginLoading());
    await authRepos.signInWithFacebook().then((response) {
      response.fold(
        (failure) => emit(LoginFailure(failure.message)),
        (userEntity) => emit(LoginSuccess(userEntity: userEntity)),
      );
    });
  }

  Future<void> signInWithApple() async {
    emit(LoginLoading());
    await authRepos.signInWithApple().then((response) {
      response.fold(
        (failure) => emit(LoginFailure(failure.message)),
        (userEntity) => emit(LoginSuccess(userEntity: userEntity)),
      );
    });
  }
}
