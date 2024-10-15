import 'package:cikitsakai/utills/popups/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../data/user/user_repo.dart';
import '../../authentication/model/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  // Save User Record from any Registration Provider (Google,Facebook)
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        // Mao Data
        final user = UserModel(
          id: userCredentials.user!.uid,
          username: userCredentials.user!.displayName ?? '',
          email: userCredentials.user!.email ?? '',
        );

        // Save user data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      TLoader.warningSnackBar(
          title: 'Data not saved',
          message: 'Something went wrong while saving your information.');
    }
  }
}
