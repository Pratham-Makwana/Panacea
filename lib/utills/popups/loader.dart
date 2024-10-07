import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TLoader {
  static hiddenSnackBar() =>
      ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static successSnackBar({required String title, message = '', duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: const Color(0xFF4868FF),
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(
        Iconsax.check,
        color: Color(0xFFFFFFFF),
      ),
    );
  }

  static warningSnackBar({required String title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(
        Iconsax.warning_2,
        color: Color(0xFFFFFFFF),
      ),
    );
  }

  static errorSnackBar({required String title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.red.shade600,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(20),
      icon: const Icon(
        Iconsax.warning_2,
        color: Color(0xFFFFFFFF),
      ),
    );
  }
}
