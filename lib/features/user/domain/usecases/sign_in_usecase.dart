import 'package:jobspot/core/usecases/usecase.dart';

import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class SignInUseCase implements UseCase<void, UserEntity>{
   final UserRepository userRepository;

  SignInUseCase({required this.userRepository});

  @override
  Future<void> call({UserEntity? params}) {
   return userRepository.signIn(params!);
  }
  
}