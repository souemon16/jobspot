import '../entities/user_entity.dart';
import '../repositories/fireabase_repository.dart';

class SigninUseCase {
  final FirebaseRepository repository;

  SigninUseCase({
    required this.repository,
  });

  Future<void> call(UserEntity user) async {
    return repository.signIn(user);
  }
}
