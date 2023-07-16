import 'package:jobspot/core/usecases/usecase.dart';
import 'package:jobspot/features/user/domain/repositories/user_repository.dart';

class SignOutUseCase implements UseCase {
  final UserRepository userRepository;

  SignOutUseCase({required this.userRepository});
  @override
  Future<void> call({params}) {
    return userRepository.signOut();
  } 
}
