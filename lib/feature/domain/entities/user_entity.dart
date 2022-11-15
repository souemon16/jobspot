import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? fullName;
  final String email;
  final String password;
  final String uid;

  const UserEntity(
      {this.fullName,
      required this.email,
      required this.password,
      required this.uid});

  @override
  List<Object?> get props => [fullName, email, password, uid];
}
