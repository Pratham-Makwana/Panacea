import 'package:cikitsakai/feature/authentication/model/user_model.dart';
import 'package:cikitsakai/feature/authentication/repositiories/user_repository.dart';
import 'package:cikitsakai/utills/popups/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  Rx<UserModel> user = UserModel.empty().obs;

  final userRepository = Get.put(UserRepository());

  fetchUserRecord() async {
    try {
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    }
  }

  // Save user Record form any Registration Provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      await fetchUserRecord();

      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          // Map Data
          final user = UserModel(
            id: userCredentials.user!.uid,
            email: userCredentials.user!.email ?? '',
            username: userCredentials.user!.displayName ?? '',
          );

          // save user data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      TLoader.warningSnackBar(
          title: 'Data Not Save',
          message:
              'Something went wrong while saving your information.You can re-save data in your profile');
    }
  }


}
