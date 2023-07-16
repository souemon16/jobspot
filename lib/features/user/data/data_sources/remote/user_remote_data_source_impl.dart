// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:jobspot/features/user/data/data_sources/remote/user_remote_data_source.dart';
import 'package:jobspot/features/user/data/model/user_model.dart';
import 'package:jobspot/features/user/domain/entities/user_entity.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource{

  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;


  UserRemoteDataSourceImpl({required this.firebaseFirestore, required this.firebaseAuth, required this.googleSignIn});
  

  @override
  Future<void> forgotPassword(String email) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<String> getCurrentUid() async => firebaseAuth.currentUser!.uid;

  @override
  Future<void> getCurrentUser(UserEntity user) async {
    final userCollection = firebaseFirestore.collection("users");
    final uid = await getCurrentUid();

    userCollection.doc(uid).get().then((userDoc) {

      if(!userDoc.exists) {
        final newUser = UserModel(
          fullName: user.fullName,
          email: user.email,
          password: user.password,
          uid: uid,
          dob: user.dob,
          gender: user.gender,
          location: user.location,
          number: user.number,
          profileImg: user.profileImg
        ).toDocument();

        userCollection.doc(uid).set(newUser);
      } else {
        print("User already created");
        return;
      }
    });
  }

  @override
  Future<void> googleAuth() async {

    try {
      final GoogleSignInAccount ? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken
      );

      final newGoogleUser = (await firebaseAuth.signInWithCredential(credential)).user;

      getCurrentUser(UserEntity(
        fullName: newGoogleUser!.displayName,
        email: newGoogleUser.email,
        number: newGoogleUser.phoneNumber,
        profileImg: newGoogleUser.photoURL,
      ));

    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<bool> isSignIn() async => firebaseAuth.currentUser?.uid != null;

  @override
  Future<void> signIn(UserEntity user) async {
    await firebaseAuth.signInWithEmailAndPassword(email: user.email!, password: user.password!);
  }

  @override
  Future<void> signOut() async => await firebaseAuth.signOut();

  @override
  Future<void> signUp(UserEntity user) async {
    await firebaseAuth.createUserWithEmailAndPassword(email: user.email!, password: user.password!).then((value) {
      getCurrentUser(user);
    });
  }

  @override
  Future<void> updateUser(UserEntity user) async {
    final userCollection = firebaseFirestore.collection("users");
    Map<String, dynamic> userInfo = {};

    if(user.dob != null && user.dob != ""){
      userInfo["dob"] = user.dob;
    }
    if(user.gender != null && user.gender != ""){
      userInfo["gender"] = user.gender;
    }
    if(user.location != null && user.location != ""){
      userInfo["location"] = user.location;
    }
    if(user.number != null && user.number != ""){
      userInfo["number"] = user.number;
    }
    if(user.profileImg != null && user.profileImg != ""){
      userInfo["profileImg"] = user.profileImg;
    }

    await userCollection.doc(user.uid).update(userInfo);
  }

}