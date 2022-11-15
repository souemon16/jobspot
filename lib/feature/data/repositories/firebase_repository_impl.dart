import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/fireabase_repository.dart';
import '../remote/data_sources/firebase_remote_data_sources.dart';

class FirebaseRepositoryImpl extends FirebaseRepository {
  final FirebaseRemoteDataSource firebaseRemoteDataSource;

  FirebaseRepositoryImpl({required this.firebaseRemoteDataSource});

  @override
  Future<String> getCurrentUId() async =>
      firebaseRemoteDataSource.getCurrentUId();

  @override
  Future<bool> isSignIn() async => firebaseRemoteDataSource.isSignIn();

  @override
  Future<void> signIn(UserEntity user) async =>
      firebaseRemoteDataSource.signIn(user);

  @override
  Future<void> signOut() async => firebaseRemoteDataSource.signOut();

  @override
  Future<void> signUp(UserEntity user) async =>
      firebaseRemoteDataSource.signUp(user);

  @override
  Future<void> getCreateCurrentUser(UserEntity user) async =>
      firebaseRemoteDataSource.getCreateCurrentUser(user);
}
