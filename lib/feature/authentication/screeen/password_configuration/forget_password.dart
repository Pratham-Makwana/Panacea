import 'package:cikitsakai/feature/authentication/model/forget_password_controller.dart';
import 'package:cikitsakai/utills/constants/colors.dart';
import 'package:cikitsakai/utills/constants/sizes.dart';
import 'package:cikitsakai/utills/validation/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(ForgetPasswordController());
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        title: const Text('Forget Password'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Heading
              Text(
                "Forget password",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                "Don’t worry sometimes people can forget too, enter your email and we will send you a password reset link.",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSection * 2,
              ),

              /// TextFormField
              Form(
                key: _controller.forgetPasswordFormKey,
                child: TextFormField(
                  controller: _controller.email,
                  validator: TValidator.validateEmail,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide:
                          const BorderSide(width: 1, color: Colors.grey),
                    ),
                    labelText: 'Email ',
                    prefixIcon: const Icon(Iconsax.direct_right),
                  ),
                ),
              ),

              const SizedBox(
                height: TSizes.spaceBtwSection,
              ),
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
                      onPressed: () => _controller.sendPasswordResetEmail(),
                      child: const Text('Submit')))
            ],
          ),
        ),
      ),
    );
  }
}
