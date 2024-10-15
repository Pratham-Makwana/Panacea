import 'package:cikitsakai/data/authentication/authentication_repo.dart';
import 'package:cikitsakai/feature/personalization/controller/user_controller.dart';
import 'package:cikitsakai/utills/constants/image_string.dart';
import 'package:cikitsakai/utills/popups/full_screen_loader.dart';
import 'package:cikitsakai/utills/popups/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  Future<void> emailAndPasswordSignIn() async {
    try {
      /// Start Loading
      TFullScreenLoader.openLoadingDialog(
          'Logging You In...', TImages.docerAnimation);

      /// Form Validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Login user using Email & Password Authentication
      final userCredentials = AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      /// Remove Loader
      TFullScreenLoader.stopLoading();

      /// Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoader.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  ///   Google SignIn Authentication
  Future<void> googleSignIn() async {
    try {
      /// Start Loading
      TFullScreenLoader.openLoadingDialog(
          'Logging You In...', TImages.docerAnimation);

      ///  Google Authentication
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      /// Save User Record
      await userController.saveUserRecord(userCredentials);

      /// Remove Loader
      TFullScreenLoader.stopLoading();

      ///   Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoader.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
