import 'dart:ffi';

import 'package:cikitsakai/data/user/user_repo.dart';
import 'package:cikitsakai/feature/personalization/controller/user_controller.dart';
import 'package:cikitsakai/utills/constants/image_string.dart';
import 'package:cikitsakai/utills/popups/full_screen_loader.dart';
import 'package:cikitsakai/utills/popups/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../screen/profile_screen.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final username = TextEditingController();
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  final userController = UserController.instance;

  // for Update Data
  final userRepository = Get.put(UserRepository());

  /// init user data when Home Screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializeNames() async {
    /// initialize  TextField With the value of the User
    username.text = userController.user.value.username;
  }

  Future<void> updateUserName() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'We are updating your information...', TImages.docerAnimation);

      // Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> name = {'Username': username.text.trim()};
      await userRepository.updateSingleField(name);

      //   update the Rx user data
      userController.user.value.username = username.text.trim();

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Message
      TLoader.successSnackBar(
          title: 'Congratulation', message: 'Your Name has been updated.');

      // Move to previous screen
      Get.off(const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoader.errorSnackBar(title: 'On Snap!', message: e.toString());
    }
  }
}
