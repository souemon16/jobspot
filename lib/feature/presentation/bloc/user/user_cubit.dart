import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/use_cases/get_create_current_user.dart';
import '../../../domain/use_cases/signin_usecase.dart';
import '../../../domain/use_cases/signout_usecase.dart';
import '../../../domain/use_cases/signup_usecase.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final SigninUseCase signinUseCase;
  final SignupUseCase signupUseCase;
  final SignoutUseCase signoutUseCase;
  final GetCreateCurrentUser getCreateCurrentUser;

  UserCubit({
    required this.signinUseCase,
    required this.signupUseCase,
    required this.signoutUseCase,
    required this.getCreateCurrentUser,
  }) : super(UserInitial());

  // ------------SignIn-------------
  Future<void> submitSignIn({required UserEntity user}) async {
    emit(UserLoading());
    try {
      await signinUseCase.call(user);
      emit(UserSuccess());
    } on SocketException catch (_) {
      emit(UserFailure());
    } catch (_) {
      emit(UserFailure());
    }
  }

  // ------------SignUp-------------
  Future<void> submitSignUp({required UserEntity user}) async {
    emit(UserLoading());
    try {
      await signupUseCase.call(user);
      await getCreateCurrentUser.call(user);
      emit(UserSuccess());
      emit(UserSuccess());
    } on SocketException catch (_) {
      emit(UserFailure());
    } catch (_) {
      emit(UserFailure());
    }
  }
}
