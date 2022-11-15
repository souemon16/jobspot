import '../entities/user_entity.dart';
import '../repositories/fireabase_repository.dart';

class GetCreateCurrentUser {
  final FirebaseRepository repository;

  GetCreateCurrentUser({
    required this.repository,
  });

  Future<void> call(UserEntity user) async {
    return repository.getCreateCurrentUser(user);
  }
}
