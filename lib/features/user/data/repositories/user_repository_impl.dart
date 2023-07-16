import 'package:jobspot/features/user/data/data_sources/remote/user_remote_data_source.dart';
import 'package:jobspot/features/user/domain/entities/user_entity.dart';
import 'package:jobspot/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository{
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({required this.userRemoteDataSource});

  @override
  Future<void> forgotPassword(String email) async => userRemoteDataSource.forgotPassword(email); 

  @override
  Future<String> getCurrentUid() async => userRemoteDataSource.getCurrentUid(); 

  @override
  Future<void> getCurrentUser(UserEntity user) async => userRemoteDataSource.getCurrentUser(user);

  @override
  Future<void> googleAuth() async => userRemoteDataSource.googleAuth();

  @override
  Future<bool> isSignIn() async => userRemoteDataSource.isSignIn();

  @override
  Future<void> signIn(UserEntity user) async => userRemoteDataSource.signIn(user);

  @override
  Future<void> signOut() async => userRemoteDataSource.signOut();

  @override
  Future<void> signUp(UserEntity user) async => userRemoteDataSource.signUp(user);

  @override
  Future<void> updateUser(UserEntity user) async => userRemoteDataSource.updateUser(user);

}