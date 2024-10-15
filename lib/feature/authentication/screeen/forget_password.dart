import 'package:cikitsakai/feature/authentication/controller/forget_password/forget_password_controller.dart';
import 'package:cikitsakai/utills/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Headings
              Text(
                'Forget password',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                'Don’t worry sometimes people can forget too, enter your email and we will send you a password reset link.',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwSection),

              /// TextFormField
              Form(
                key: controller.forgetPasswordFormKey,
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'E-Mail',
                      prefixIcon: Icon(Iconsax.direct_right)),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSection,
              ),

              /// Button
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  color: const Color(0xff000310),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 1,
                        color: Color(0xff9e9e9e),
                      ),
                      borderRadius: BorderRadius.circular(12.0)),
                  textColor: const Color(0xffffffff),
                  onPressed: () => controller.sendPasswordEmailReset(),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
