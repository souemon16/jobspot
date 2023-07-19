import 'package:jobspot/features/user/data/data_sources/remote/user_remote_data_source.dart';
import 'package:jobspot/features/user/data/data_sources/remote/user_remote_data_source_impl.dart';
import 'package:jobspot/features/user/data/repositories/user_repository_impl.dart';
import 'package:jobspot/features/user/domain/repositories/user_repository.dart';
import 'package:jobspot/features/user/domain/usecases/forgot_password_usecase.dart';
import 'package:jobspot/features/user/domain/usecases/get_current_uid_usecase.dart';
import 'package:jobspot/features/user/domain/usecases/get_current_user_usecase.dart';
import 'package:jobspot/features/user/domain/usecases/google_auth_usecase.dart';
import 'package:jobspot/features/user/domain/usecases/is_sign_in_usecase.dart';
import 'package:jobspot/features/user/domain/usecases/sign_in_usecase.dart';
import 'package:jobspot/features/user/domain/usecases/sign_out_usecase.dart';
import 'package:jobspot/features/user/domain/usecases/sign_up_usecase.dart';
import 'package:jobspot/features/user/domain/usecases/update_user_usecase.dart';
import 'package:jobspot/features/user/presentation/cubit/auth/auth_cubit.dart';
import 'package:jobspot/features/user/presentation/cubit/credential/credential_cubit.dart';
import 'package:jobspot/injection_container.dart';

Future<void> userInjectionContainer() async {
  
  // CUBIT OR BLOC
  sl.registerFactory(() => AuthCubit(
      isSignInUseCase: sl.call(),
      signOutUseCase: sl.call(),
      getCurrentUidUseCase: sl.call()));

  sl.registerFactory(() => CredentialCubit(
      signInUseCase: sl.call(),
      signUpUseCase: sl.call(),
      googleAuthUseCase: sl.call(),
      forgotPasswordUseCase: sl.call()));

  // USECASES
  sl.registerLazySingleton<ForgotPasswordUseCase>(
      () => ForgotPasswordUseCase(userRepository: sl.call()));
  sl.registerLazySingleton<GetCurrentUidUseCase>(
      () => GetCurrentUidUseCase(userRepository: sl.call()));
  sl.registerLazySingleton<GetCurrentUserUseCase>(
      () => GetCurrentUserUseCase(userRepository: sl.call()));
  sl.registerLazySingleton<GoogleAuthUseCase>(
      () => GoogleAuthUseCase(userRepository: sl.call()));
  sl.registerLazySingleton<IsSignInUseCase>(
      () => IsSignInUseCase(userRepository: sl.call()));
  sl.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(userRepository: sl.call()));
  sl.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(userRepository: sl.call()));
  sl.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(userRepository: sl.call()));
  sl.registerLazySingleton<UpdateUserUseCase>(
      () => UpdateUserUseCase(userRepository: sl.call()));

  // REPOSITORIES
  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(userRemoteDataSource: sl.call()));

  // REMOTE DATA SOURCES
  sl.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(
      firebaseFirestore: sl.call(),
      firebaseAuth: sl.call(),
      googleSignIn: sl.call()));
}
