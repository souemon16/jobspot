import 'package:jobspot/core/usecases/usecase.dart';

import '../repositories/user_repository.dart';

class ForgotPasswordUseCase implements UseCase<void, String>{
   final UserRepository userRepository;

  ForgotPasswordUseCase({required this.userRepository});

  @override
  Future<void> call({String? params}) {
   return userRepository.forgotPassword(params!);
  }
  
}