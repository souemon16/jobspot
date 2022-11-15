import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/entities/user_entity.dart';
import '../model/user_model.dart';
import 'firebase_remote_data_sources.dart';

class FirebaseRemoteDataSourcesImpl implements FirebaseRemoteDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  FirebaseRemoteDataSourcesImpl({required this.auth, required this.firestore});

  @override
  Future<void> getCreateCurrentUser(UserEntity user) async {
    final userCollectionRef = firestore.collection("users");
    final userId = await getCurrentUId();
    userCollectionRef.doc(userId).get().then((value) {
      final newUser =
          UserModel(uid: userId, email: user.email, password: user.password)
              .toDocument();

      if (!value.exists) {
        userCollectionRef.doc(userId).set(newUser);
      }
      return;
    });
  }

  @override
  Future<String> getCurrentUId() async => auth.currentUser!.uid;

  @override
  Future<bool> isSignIn() async => auth.currentUser?.uid != null;

  @override
  Future<void> signIn(UserEntity user) async {
    auth.signInWithEmailAndPassword(email: user.email, password: user.password);
  }

  @override
  Future<void> signOut() async {
    auth.signOut();
  }

  @override
  Future<void> signUp(UserEntity user) async {
    auth.createUserWithEmailAndPassword(
        email: user.email, password: user.password);
  }
}
