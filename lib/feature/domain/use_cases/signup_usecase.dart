import '../entities/user_entity.dart';
import '../repositories/fireabase_repository.dart';

class SignupUseCase {
  final FirebaseRepository repository;

  SignupUseCase({
    required this.repository,
  });

  Future<void> call(UserEntity user) async {
    return repository.signUp(user);
  }
}
