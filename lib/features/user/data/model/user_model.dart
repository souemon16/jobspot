import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobspot/features/user/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    String? fullName,
    String? email,
    String? password,
    String? uid,
    String? gender,
    String? location,
    String? number,
    String? dob,
    String? profileImg,
  }) : super(
            fullName: fullName,
            email: email,
            password: password,
            uid: uid,
            gender: gender,
            location: location,
            number: number,
            dob: dob,
            profileImg: profileImg);

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    var snapshotMap = snapshot.data() as Map<String, dynamic>;
    return UserModel(
      fullName: snapshotMap["fullName"],
      email: snapshotMap["email"],
      password: snapshotMap["password"],
      uid: snapshotMap["uid"],
      gender: snapshotMap["gender"],
      location: snapshotMap["location"],
      number: snapshotMap["number"],
      dob: snapshotMap["dob"],
      profileImg: snapshotMap["profileImg"],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "fullName": fullName,
      "email": email,
      "password": password,
      "uid": uid,
      "gender": gender,
      "location": location,
      "number": number,
      "dob": dob,
      "profileImg": profileImg,
    };
  }
}
