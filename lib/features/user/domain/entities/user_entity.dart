import 'package:equatable/equatable.dart';

class UserEntity extends Equatable{
  final String? fullName;
  final String? email;
  final String? password;
  final String? uid;
  final String? gender;
  final String? location;
  final String? number;
  final String? dob;
  final String? profileImg;

  const UserEntity({this.fullName, this.email, this.password, this.uid, this.gender, this.location, this.number, this.dob, this.profileImg});

  @override
  List<Object?> get props => [fullName, email, password, uid, gender, location, number, dob, profileImg];

}