import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jobspot/features/user/domain/entities/user_entity.dart';
import 'package:jobspot/features/user/domain/usecases/forgot_password_usecase.dart';
import 'package:jobspot/features/user/domain/usecases/google_auth_usecase.dart';
import 'package:jobspot/features/user/domain/usecases/sign_in_usecase.dart';
import 'package:jobspot/features/user/domain/usecases/sign_up_usecase.dart';

part 'credential_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final GoogleAuthUseCase googleAuthUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;

  CredentialCubit(
      {required this.signInUseCase,
      required this.signUpUseCase,
      required this.googleAuthUseCase,
      required this.forgotPasswordUseCase})
      : super(CredentialInitial());

  Future<void> signIn({required String email, required String password}) async {
    emit(CredentialLoading());
    try {
      await signInUseCase.call(params: UserEntity(email: email, password: password));
      emit(CredentialLoaded());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }


  Future<void> signUp({required UserEntity user}) async {
    emit(CredentialLoading());
    try {
      await signUpUseCase.call(params: user);
      emit(CredentialLoaded());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

   Future<void> googleAuth() async {
    emit(CredentialLoading());
    try {
      await googleAuthUseCase.call();
      emit(CredentialLoaded());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }


  Future<void> forgotPassword( String email ) async {
    emit(CredentialLoading());
    try {
      await forgotPasswordUseCase.call(params: email);
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }
}
