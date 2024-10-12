import 'package:cikitsakai/feature/authentication/repositiories/authentication_repository.dart';
import 'package:cikitsakai/utills/constants/image_string.dart';
import 'package:cikitsakai/utills/popups/full_screen_loader.dart';
import 'package:cikitsakai/utills/popups/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../screeen/password_configuration/reset_password.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'Processing Your Request', TImages.docerAnimation);

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // Remove the Loader
      TFullScreenLoader.stopLoading();

      // Show Success SnackBar
      TLoader.successSnackBar(
          title: 'Email Sent', message: 'Email Link Sent to Reset Password');

      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();
      TLoader.errorSnackBar(title: 'oh Snap', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Processing Your Request', TImages.docerAnimation);

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove The Loader
      TFullScreenLoader.stopLoading();

      // Show Success Screen
      TLoader.successSnackBar(
          title: 'Email Sent', message: 'Email Link Sent to Reset Email');
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();
      TLoader.errorSnackBar(title: 'oh Snap', message: e.toString());
    }
  }
}
