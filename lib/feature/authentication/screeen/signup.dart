import 'package:cikitsakai/feature/authentication/controller/signup/signup_controller.dart';
import 'package:cikitsakai/utills/validation/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'login.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                ///***If you have exported images you must have to copy those images in assets/images directory.
                Image(
                  image: const AssetImage("assets/image/MainImage.jpeg"),
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.85,
                  fit: BoxFit.fitWidth,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 30),
                  child: Text(
                    "Chikiत्सक.AI",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                      color: Color(0xff07f4e3),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Sign Up",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 24,
                      color: Color(0xff000000),
                    ),
                  ),
                ),

                /// -------------- Form ------------------------
                Form(
                  key: controller.signupFormKey,
                  child: Column(
                    children: [
                      /// --------- Username
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                        child: TextFormField(
                          controller: controller.username,
                          validator: (value) =>
                              TValidator.validateEmptyText('Username', value),
                          obscureText: false,
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 16,
                            color: Color(0xff000000),
                          ),
                          decoration: const InputDecoration(
                            labelText: "Username",
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                          ),
                        ),
                      ),

                      /// -------------- Email
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                        child: TextFormField(
                          controller: controller.email,
                          validator: (value) => TValidator.validateEmail(value),
                          obscureText: false,
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 16,
                            color: Color(0xff000000),
                          ),
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                          ),
                        ),
                      ),

                      /// ------------ Password
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                          child: TextFormField(
                            controller: controller.password,
                            validator: (value) =>
                                TValidator.validatePassword(value),
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            obscureText: controller.hidePassword.value,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                              color: Color(0xff000000),
                            ),
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () => controller.hidePassword
                                      .value = !controller.hidePassword.value,
                                  icon: Icon(controller.hidePassword.value
                                      ? Iconsax.eye_slash
                                      : Iconsax.eye)),
                              labelText: "Password",
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.signup(),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(16),
                        foregroundColor: const Color(0xffffffff),
                        backgroundColor: const Color(0xff000310),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        )),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already Have Account?',
                      style: TextStyle(fontSize: 18),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(() => const LoginScreen());
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.cyan,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
