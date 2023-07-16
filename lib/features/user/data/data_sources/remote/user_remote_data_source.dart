import '../../../domain/entities/user_entity.dart';

abstract class UserRemoteDataSource{
  Future<bool> isSignIn();
  
  Future<void> signIn(UserEntity user);
  Future<void> signUp(UserEntity user);
  Future<void> forgotPassword(String email);
  Future<void> signOut();
  Future<void> googleAuth();

  Future<void> getCurrentUser(UserEntity user);
  Future<String> getCurrentUid();
  Future<void> updateUser(UserEntity user);
}