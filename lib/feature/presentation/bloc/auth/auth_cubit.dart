import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_cases/get_current_uid_usecase.dart';
import '../../../domain/use_cases/is_signin_usecase.dart';
import '../../../domain/use_cases/signout_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final GetCurrentUIdUsecase getCurrentUIdUsecase;
  final IsSigninUseCase isSigninUseCase;
  final SignoutUseCase signoutUseCase;

  AuthCubit({
    required this.getCurrentUIdUsecase,
    required this.isSigninUseCase,
    required this.signoutUseCase,
  }) : super(AuthInitial());

  Future<void> appStarted() async {
    try {
      final isSignIn = await isSigninUseCase.call();
      if (isSignIn) {
        final uid = await getCurrentUIdUsecase.call();
        emit(Authenticated(uid: uid));
      } else {
        emit(UnAuthenticated());
      }
    } on SocketException catch (_) {
      emit(UnAuthenticated());
    }
  }

  Future<void> signIn() async {
    try {
      final uid = await getCurrentUIdUsecase.call();
      emit(Authenticated(uid: uid));
    } on SocketException catch (_) {
      emit(UnAuthenticated());
    }
  }

  Future<void> signOut() async {
    try {
      await signoutUseCase.call();
      emit(UnAuthenticated());
    } on SocketException catch (_) {
      emit(UnAuthenticated());
    }
  }
}
