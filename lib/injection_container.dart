import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import 'feature/data/remote/data_sources/firebase_remote_data_sources.dart';
import 'feature/data/remote/data_sources/frebase_remote_data_sources_impl.dart';
import 'feature/data/repositories/firebase_repository_impl.dart';
import 'feature/domain/repositories/fireabase_repository.dart';
import 'feature/domain/use_cases/get_create_current_user.dart';
import 'feature/domain/use_cases/get_current_uid_usecase.dart';
import 'feature/domain/use_cases/is_signin_usecase.dart';
import 'feature/domain/use_cases/signin_usecase.dart';
import 'feature/domain/use_cases/signout_usecase.dart';
import 'feature/domain/use_cases/signup_usecase.dart';
import 'feature/presentation/bloc/auth/auth_cubit.dart';
import 'feature/presentation/bloc/user/user_cubit.dart';

GetIt getIt = GetIt.instance;

Future<void> init() async {
// CUBIT/BLOC
  getIt.registerFactory(() => AuthCubit(
      getCurrentUIdUsecase: getIt.call(),
      isSigninUseCase: getIt.call(),
      signoutUseCase: getIt.call()));

  getIt.registerFactory(() => UserCubit(
      signinUseCase: getIt.call(),
      signupUseCase: getIt.call(),
      signoutUseCase: getIt.call(),
      getCreateCurrentUser: getIt.call()));

// USECASE
  getIt.registerLazySingleton<GetCreateCurrentUser>(
      () => GetCreateCurrentUser(repository: getIt.call()));
  getIt.registerLazySingleton<GetCurrentUIdUsecase>(
      () => GetCurrentUIdUsecase(repository: getIt.call()));
  getIt.registerLazySingleton<IsSigninUseCase>(
      () => IsSigninUseCase(repository: getIt.call()));
  getIt.registerLazySingleton<SigninUseCase>(
      () => SigninUseCase(repository: getIt.call()));
  getIt.registerLazySingleton<SignoutUseCase>(
      () => SignoutUseCase(repository: getIt.call()));
  getIt.registerLazySingleton<SignupUseCase>(
      () => SignupUseCase(repository: getIt.call()));

// REPOSITORY
  getIt.registerLazySingleton<FirebaseRepository>(
      () => FirebaseRepositoryImpl(firebaseRemoteDataSource: getIt.call()));
// DATA SOURCE
  getIt.registerLazySingleton<FirebaseRemoteDataSource>(() =>
      FirebaseRemoteDataSourcesImpl(
          auth: getIt.call(), firestore: getIt.call()));

// EXTERNAL
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  getIt.registerLazySingleton(() => auth);
  getIt.registerLazySingleton(() => firestore);
}
