import '../entities/user_entity.dart';

abstract class FirebaseRepository {
  Future<bool> isSignIn();
  Future<void> signIn(UserEntity user);
  Future<void> signUp(UserEntity user);
  Future<void> getCreateCurrentUser(UserEntity user);
  Future<void> signOut();
  Future<String> getCurrentUId();
}
