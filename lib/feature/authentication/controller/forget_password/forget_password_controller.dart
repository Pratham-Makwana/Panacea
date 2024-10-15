import 'package:cikitsakai/data/authentication/authentication_repo.dart';
import 'package:cikitsakai/feature/authentication/screeen/reset_password.dart';
import 'package:cikitsakai/utills/constants/image_string.dart';
import 'package:cikitsakai/utills/popups/full_screen_loader.dart';
import 'package:cikitsakai/utills/popups/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordEmailReset() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'Processing Your request', TImages.docerAnimation);

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // send Email to Reset Password
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      TFullScreenLoader.stopLoading();

      //   Show Success Screen
      TLoader.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link Sent to Reset Your Password');

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();
      TLoader.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  resendPasswordEmailReset(String email) async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'Processing Your request', TImages.docerAnimation);

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      //   Show Success Screen
      TLoader.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link Sent to Reset Email');

    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();
      TLoader.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
