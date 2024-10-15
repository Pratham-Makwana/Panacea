import 'package:cikitsakai/feature/authentication/controller/forget_password/forget_password_controller.dart';
import 'package:cikitsakai/feature/authentication/screeen/login.dart';
import 'package:cikitsakai/utills/constants/image_string.dart';
import 'package:cikitsakai/utills/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../main.dart';

class ResetPasswordScreen extends StatelessWidget {
  final String email;

  const ResetPasswordScreen({super.key, required this.email});

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
                width: mq.width * 0.6,
              ),
              const SizedBox(height: TSizes.spaceBtwSection),

              //   Title
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
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                "Your Account Security is Our Priority! We've Sent You a Secure Link to Safely Change Your Password and Keep Your Account Protected.",
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSection,
              ),

              /// Continue Button
              SizedBox(
                width: double.infinity,
                //height: mq.height * .06,
                child: ElevatedButton(
                  onPressed: () => Get.offAll(() => const LoginScreen()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff000310),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(color: Color(0xff9e9e9e), width: 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Continue',
                      style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// Resend Email Button
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () => ForgetPasswordController.instance
                      .resendPasswordEmailReset(email),
                  color: const Color(0xffffffff),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(color: Color(0xff9e9e9e), width: 1),
                      borderRadius: BorderRadius.circular(12.0)),
                  textColor: const Color(0xff000000),
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "Resend Email",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
