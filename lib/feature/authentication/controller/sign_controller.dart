import 'dart:developer';

import 'package:cikitsakai/feature/authentication/model/user_model.dart';
import 'package:cikitsakai/feature/authentication/repositiories/authentication_repository.dart';
import 'package:cikitsakai/feature/authentication/repositiories/user_repository.dart';
import 'package:cikitsakai/utills/constants/image_string.dart';
import 'package:cikitsakai/utills/popups/full_screen_loader.dart';
import 'package:cikitsakai/utills/popups/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../screeen/verify_email.dart';

class SignController extends GetxController {
  static SignController get instance => Get.find();

  final hiddenPassword = true.obs;
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  Future<void> signUp() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'we are processing your information', TImages.docerAnimation);

      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      final newUser = UserModel(
          id: userCredential.user!.uid,
          email: email.text.trim(),
          // password: password.text.trim(),
          username: username.text.trim());

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      TFullScreenLoader.stopLoading();
      TLoader.successSnackBar(
          title: 'Congratulation',
          message: 'Your account has been created! Verify email to continue');

      Get.to(() => VerifyEmailScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoader.errorSnackBar(title: 'Oh snap', message: e.toString());
      log(e.toString());
    }
  }
}
