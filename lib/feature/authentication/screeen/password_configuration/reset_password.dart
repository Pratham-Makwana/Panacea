import 'package:cikitsakai/feature/authentication/controller/forget_password_controller.dart';
import 'package:cikitsakai/feature/authentication/screeen/LoginScreen.dart';
import 'package:cikitsakai/utills/constants/image_string.dart';
import 'package:cikitsakai/utills/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utills/constants/colors.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Image(
                image: const AssetImage(TImages.deliveredEmailIllustration),
                width: MediaQuery.of(Get.context!).size.width * 0.6,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSection,
              ),

              //   Title & SubTitle
              Text(
                email,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              Text(
                'Password Reset Email Sent',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              Text(
                "Your Account Security is Our Priority! We've Sent You a Secure Link to Safely Change Your Password and Keep Your Account Protected.",
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: TSizes.spaceBtwSection),

              /// Done  Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        foregroundColor: TColors.light,
                        backgroundColor: TColors.primary,
                        disabledBackgroundColor: TColors.darkerGrey,
                        disabledForegroundColor: TColors.buttonDisabled,
                        side: const BorderSide(color: TColors.primary),
                        padding: const EdgeInsets.symmetric(
                            vertical: TSizes.buttonHeight),
                        textStyle: const TextStyle(
                            fontSize: 16,
                            color: TColors.textWhite,
                            fontWeight: FontWeight.w600),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(TSizes.buttonRadius))),
                    onPressed: () => Get.offAll(() => const LoginScreen()),
                    child: const Text('Done')),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// Reset-Email Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        foregroundColor: TColors.light,
                        backgroundColor: TColors.primary,
                        disabledBackgroundColor: TColors.darkerGrey,
                        disabledForegroundColor: TColors.buttonDisabled,
                        side: const BorderSide(color: TColors.primary),
                        padding: const EdgeInsets.symmetric(
                            vertical: TSizes.buttonHeight),
                        textStyle: const TextStyle(
                            fontSize: 16,
                            color: TColors.textWhite,
                            fontWeight: FontWeight.w600),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(TSizes.buttonRadius))),
                    onPressed: () => ForgetPasswordController.instance
                        .resendPasswordResetEmail(email),
                    child: const Text('Resend Email')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
