import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:fruits_app/core/errors/failure.dart';
import 'package:fruits_app/core/services/database_services.dart';
import 'package:fruits_app/core/services/firebase_auth_server.dart';
import 'package:fruits_app/core/utils/backend_endpoint.dart';
import 'package:fruits_app/features/auth/data/models/user_model.dart';
import 'package:fruits_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_app/features/auth/domain/repositories/auth_repos.dart';

class AuthReposImpl implements AuthRepos {
  final FirebaseAuthServer firebaseAuthServer;
  final DatabaseServices databaseServices;

  AuthReposImpl({
    required this.firebaseAuthServer,
    required this.databaseServices,
  });

  // createUserWithEmailAndPassword
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final user = await firebaseAuthServer.createUserWithEmailAndPassword(
        email,
        password,
      );
      var userEntity = UserEntity(id: user.uid, name: name, email: email);
      await addUserData(userEntity: userEntity);
      return Right(userEntity);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  // signInWithEmailAndPassword
  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await firebaseAuthServer.signInWithEmailAndPassword(
        email,
        password,
      );

      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  // signInWithGoogle
  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      final user = await firebaseAuthServer.signInWithGoogle();
      return Right(UserModel.fromFirebaseUser(user));
    } on FirebaseAuthException catch (e) {
      return Left(
        ServerFailure(message: e.message ?? 'حدث خطأ أثناء تسجيل الدخول'),
      );
    } catch (e) {
      return Left(ServerFailure(message: 'خطأ غير متوقع'));
    }
  }

  // signInWithFacebook
  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      final user = await firebaseAuthServer.signInWithFacebook();
      return Right(UserModel.fromFirebaseUser(user));
    } on FirebaseAuthException catch (e) {
      return Left(
        ServerFailure(message: e.message ?? 'حدث خطأ أثناء تسجيل الدخول'),
      );
    } catch (e) {
      return Left(ServerFailure(message: 'خطأ غير متوقع'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithApple() async {
    try {
      final user = await firebaseAuthServer.signInWithApple();
      return Right(UserModel.fromFirebaseUser(user));
    } on FirebaseAuthException catch (e) {
      return Left(
        ServerFailure(message: e.message ?? 'حدث خطأ أثناء تسجيل الدخول'),
      );
    } catch (e) {
      return Left(ServerFailure(message: 'خطأ غير متوقع'));
    }
  }

  @override
  Future<dynamic> addUserData({required UserEntity userEntity}) async {
    await databaseServices.addData(
      path: BackendEndpoint.users,
      data: userEntity.toMap(),
    );
  }
}
