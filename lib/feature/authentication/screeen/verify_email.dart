import 'package:cikitsakai/data/authentication/authentication_repo.dart';
import 'package:cikitsakai/feature/authentication/controller/signup/verify_email_controller.dart';
import 'package:cikitsakai/main.dart';
import 'package:cikitsakai/utills/constants/image_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, required this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    mq = MediaQuery.of(context).size;
    return Scaffold(
      // AppBar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            /// LogOut
            onPressed: () => AuthenticationRepository.instance.logout(),
            icon: const Icon(CupertinoIcons.clear),
          )
        ],
      ),

      //   Body
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Image(
                image: const AssetImage(TImages.deliveredEmailIllustration),
                width: mq.width * 0.6,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Verify your email address!',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                email ?? '',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Congratulations! Your Account Awaits: Verify Your Email to Start Shopping and Experience a World of Unrivaled Deals and Personalized Offers.",
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),

              /// Button
              SizedBox(
                width: double.infinity,
                height: mq.height * .06,
                child: ElevatedButton(
                  onPressed: () => controller.checkEmailVerificationStatus(),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text(
                    'Continue',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                height: mq.height * .06,
                child: ElevatedButton(
                  onPressed: () => controller.sendEmailVerification(),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text(
                    'Resend',
                    style: TextStyle(color: Colors.white),
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
