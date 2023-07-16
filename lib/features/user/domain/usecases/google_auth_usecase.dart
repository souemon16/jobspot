import 'package:jobspot/core/usecases/usecase.dart';
import 'package:jobspot/features/user/domain/repositories/user_repository.dart';

class GoogleAuthUseCase implements UseCase {
  final UserRepository userRepository;

  GoogleAuthUseCase({required this.userRepository});
  @override
  Future<void> call({params}) {
    return userRepository.googleAuth();
  } 
}
