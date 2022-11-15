import '../repositories/fireabase_repository.dart';

class IsSigninUseCase {
  final FirebaseRepository repository;

  IsSigninUseCase({
    required this.repository,
  });

  Future<bool> call() async {
    return repository.isSignIn();
  }
}
