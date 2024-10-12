import 'dart:async';

import 'package:cikitsakai/common/widgets/success_screen/success.dart';
import 'package:cikitsakai/feature/authentication/repositiories/authentication_repository.dart';
import 'package:cikitsakai/utills/constants/image_string.dart';
import 'package:cikitsakai/utills/popups/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendMailVerification();
      TLoader.successSnackBar(
          title: 'Email Send',
          message: 'Please Check Your inbox and verify your email');
    } catch (e) {
      TLoader.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  setTimerForAutoRedirect() async {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser!.reload();
      final user = FirebaseAuth.instance.currentUser;
      // user? => if user is null
      // emailVerified ?? => EmailVerified also be null so two question mark
      // if user is verified in that case if condition is true. the we want to cancel the time
      // and get.off we want to destroy previous email verification screen
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SuccessScreen(
              image: TImages.successfullyRegisterAnimation,
              title: "Your account successfully created!",
              subtitle:
                  "Welcome to Your Ultimate Shopping Destination: Your Account is Created, Unleash the Joy of Seamless Online Shopping!",
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect()),
        );
      }
    });
  }

  checkMailVerificationStatus() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SuccessScreen(
            image: TImages.successfullyRegisterAnimation,
            title: "Your account successfully created!",
            subtitle:
                "Welcome to Your Ultimate Shopping Destination: Your Account is Created, Unleash the Joy of Seamless Online Shopping!",
            onPressed: () =>
                AuthenticationRepository.instance.screenRedirect()),
      );
    }
  }
}
