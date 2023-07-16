import 'package:jobspot/core/usecases/usecase.dart';
import 'package:jobspot/features/user/domain/repositories/user_repository.dart';

class IsSignInUseCase implements UseCase {
  final UserRepository userRepository;

  IsSignInUseCase({required this.userRepository});
  @override
  Future<bool> call({params}) {
    return userRepository.isSignIn();
  } 
}
