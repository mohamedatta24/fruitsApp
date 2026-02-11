import 'package:fruits_app/core/services/database_services.dart';
import 'package:fruits_app/core/services/firebase_auth_server.dart';
import 'package:fruits_app/core/services/firestore_service.dart';
import 'package:fruits_app/features/auth/data/repositories/auth_repos_impl.dart';
import 'package:fruits_app/features/auth/domain/repositories/auth_repos.dart';
import 'package:fruits_app/features/auth/presentation/login/login_cubit.dart';
import 'package:fruits_app/features/auth/presentation/signup_cubit/signup_cubit_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<FirebaseAuthServer>(() => FirebaseAuthServer());
  getIt.registerLazySingleton<DatabaseServices>(() => FirestoreService());
  getIt.registerLazySingleton<AuthRepos>(
    () => AuthReposImpl(
      databaseServices: getIt<DatabaseServices>(),
      firebaseAuthServer: getIt<FirebaseAuthServer>(),
    ),
  );
  getIt.registerLazySingleton<SignupCubit>(
    () => SignupCubit(getIt<AuthRepos>()),
  );
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt<AuthRepos>()));
}
