import '../repositories/fireabase_repository.dart';

class GetCurrentUIdUsecase {
  final FirebaseRepository repository;

  GetCurrentUIdUsecase({
    required this.repository,
  });

  Future<String> call() async {
    return repository.getCurrentUId();
  }
}
