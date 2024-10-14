import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String username;
  final String email;

  UserModel({required this.id, required this.username, required this.email});

  static UserModel empty() => UserModel(id: '', username: '', email: '');

  /// Convert model to JSON structure for storing data in Firebase.
  Map<String, dynamic> toJson() {
    return {
      'Username': username,
      'Email': email,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data();
      return UserModel(
        id: document.id,
        username: data?['Username'] ?? '',
        email: data?['Email'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }
}
