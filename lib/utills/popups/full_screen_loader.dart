import 'package:cikitsakai/common/widgets/loader/animation_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false, // Disable popping with the back button
        child: Column(
          children: [
            const SizedBox(
              height: 250,
            ),
            TAnimationLoaderWidget(animation: animation, text: text)
          ],
        ),
      ),
    );
  }

  /// Stop the Currently open loading dialog
  /// This method doesn't return anything
  static stopLoading() {
    Navigator.of(Get.overlayContext!)
        .pop(); // Close the dialog using the Navigator
  }
}
