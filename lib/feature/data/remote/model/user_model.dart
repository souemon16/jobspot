import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
      {final String? fullName,
      required final String email,
      required final String password,
      required final String uid})
      : super(fullName: fullName, email: email, password: password, uid: uid);

  factory UserModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return UserModel(
        fullName: documentSnapshot.get('fullName'),
        email: documentSnapshot.get('email'),
        password: documentSnapshot.get('password'),
        uid: documentSnapshot.get('uid'));
  }

  Map<String, dynamic> toDocument() {
    return {
      'fullName': fullName,
      'email': email,
      'password': password,
      'uid': uid
    };
  }
}
