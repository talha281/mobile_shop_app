import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? userName;
  final String? email;
  final String? password;

  UserModel({
    this.userName,
    this.email,
    this.password,
  });
  @override
  List<Object?> get props => [userName, email, password];

  UserModel copyWith({
    String? userName,
    String? email,
    String? password,
  }) {
    return UserModel(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'email': email,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userName: map['userName'],
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  bool get stringify => true;
}
