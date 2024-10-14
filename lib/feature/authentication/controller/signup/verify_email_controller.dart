import 'dart:async';

import 'package:cikitsakai/common/widgets/success_screen/success.dart';
import 'package:cikitsakai/data/authentication/authentication_repo.dart';
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

  // Send Email Verification Link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoader.successSnackBar(
          title: 'Email Sent',
          message: 'Please Check your inbox and verify your email');
    } catch (e) {
      TLoader.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  /// Timer to automatically redirect on Email Verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SuccessScreen(
            image: TImages.successfullyRegisterAnimation,
            title: '',
            subtitle: '',
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      }
    });
  }

  /// Manually Check if Email Verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SuccessScreen(
          image: TImages.successfullyRegisterAnimation,
          title: '',
          subtitle: '',
          onPressed: AuthenticationRepository.instance.screenRedirect(),
        ),
      );
    }
  }
}
