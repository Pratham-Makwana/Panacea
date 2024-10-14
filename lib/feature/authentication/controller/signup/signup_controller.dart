import 'dart:developer';

import 'package:cikitsakai/data/authentication/authentication_repo.dart';
import 'package:cikitsakai/data/user/user_repo.dart';
import 'package:cikitsakai/feature/authentication/model/user_model.dart';
import 'package:cikitsakai/feature/authentication/screeen/verify_email.dart';
import 'package:cikitsakai/utills/constants/image_string.dart';
import 'package:cikitsakai/utills/popups/full_screen_loader.dart';
import 'package:cikitsakai/utills/popups/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hidePassword = true.obs;
  final email = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  Future<void> signup() async {
    try {
      TFullScreenLoader.openLoadingDialog('text', TImages.docerAnimation);

      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Register the user in firebase authentication & save user data in firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // Save Authenticated user data in the firebase Firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          username: username.text.trim(),
          email: email.text.trim());

      final userRepo = Get.put(UserRepository());
      userRepo.saveUserRecord(newUser);

      // Show Success Message
      TLoader.successSnackBar(
          title: 'Congratulation',
          message: 'Your account has been created@ Verify email to continue.');

      // Move to Verify Email Screen
      Get.to(() => VerifyEmailScreen(email: email.text));
    } catch (e) {
      log('SignUpError: $e');
      TFullScreenLoader.stopLoading();
      TLoader.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
