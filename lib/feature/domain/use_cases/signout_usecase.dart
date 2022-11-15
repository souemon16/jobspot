import '../repositories/fireabase_repository.dart';

class SignoutUseCase {
  final FirebaseRepository repository;

  SignoutUseCase({
    required this.repository,
  });

  Future<void> call() async {
    return repository.signOut();
  }
}
