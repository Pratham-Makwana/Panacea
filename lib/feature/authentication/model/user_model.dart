import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String username;
  final String email;
  // final String password;

  UserModel(
      {required this.id,
      required this.email,
      // required this.password,
      required this.username});

  static UserModel empty() =>
      UserModel(email: '', username: '', id: '');

  Map<String, dynamic> toJson() {
    return {'Username': username, 'Email': email,
      // 'Password': password
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data();
      return UserModel(
        id: document.id,
        email: data?['Username'] ?? '',
        // password: data?['password'] ?? '',
        username: data?['Password'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }
}
