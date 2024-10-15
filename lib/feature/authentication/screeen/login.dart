import 'package:cikitsakai/feature/authentication/controller/login/login_controller.dart';
import 'package:cikitsakai/feature/authentication/screeen/forget_password.dart';
import 'package:cikitsakai/feature/authentication/screeen/reset_password.dart';
import 'package:cikitsakai/utills/validation/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'signup.dart';
import '../../../main.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    mq = MediaQuery.of(context).size;
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
              children: [
                Image.asset(
                  "assets/image/MainImage.jpeg",
                  height: 100,
                  width: mq.width * .85,
                  fit: BoxFit.fitWidth,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 30),
                  child: Text(
                    "Chikiत्सक.AI",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700),
                  ),
                ),

                /// ----------- Sign In
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Sign In",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        fontStyle: FontStyle.normal),
                  ),
                ),

                /// --------------------- Form  ------------------------------
                Form(
                  key: controller.loginFormKey,
                  child: Column(
                    children: [
                      /// --------------------- Email  ------------------------------
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 0),
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

                      /// ------------------- Password -----------------------------------
                      Obx(
                        () => TextFormField(
                          controller: controller.password,
                          validator: (value) =>
                              TValidator.validateEmptyText('Password', value),
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
                                onPressed: () => controller.hidePassword.value =
                                    !controller.hidePassword.value,
                                icon: Icon(controller.hidePassword.value
                                    ? Iconsax.eye_slash
                                    : Iconsax.eye)),
                            labelText: "Password",
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                /// ----------------------------------------
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => Get.to(() => const ForgetPassword()),
                      child: const Text(
                        "Forget Password ?",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            color: Color(0xff9e9e9e),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      /// Sign Up Button
                      Expanded(
                        flex: 1,
                        child: MaterialButton(
                          onPressed: () {
                            // Navigate to the RegisterScreen when the button is pressed
                            Get.to(() => const RegisterScreen());
                          },
                          color: const Color(0xffffffff),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Color(0xff9e9e9e), width: 1),
                              borderRadius: BorderRadius.circular(12.0)),
                          textColor: const Color(0xff000000),
                          height: 40,
                          minWidth: 140,
                          child: const Padding(
                            padding: EdgeInsets.all(16),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),

                      /// Login Button
                      Expanded(
                        flex: 1,
                        child: MaterialButton(
                          onPressed: () => controller.emailAndPasswordSignIn(),
                          color: const Color(0xff000310),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Color(0xff9e9e9e), width: 1),
                              borderRadius: BorderRadius.circular(12.0)),
                          textColor: const Color(0xffffffff),
                          height: 40,
                          minWidth: 140,
                          child: const Padding(
                            padding: EdgeInsets.all(16),
                            child: Text(
                              "Login",
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
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                  child: Text(
                    "Or Continue with",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff9e9e9e),
                    ),
                  ),
                ),

                /// Google Sign-In Button
                InkWell(
                  onTap: () => controller.googleSignIn(),
                  child: Container(
                    margin: const EdgeInsets.all(0),
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                            color: const Color(0xff9e9e9e), width: 1)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(
                          image: NetworkImage(
                              "https://cdn3.iconfinder.com/data/icons/logos-brands-3/24/logo_brand_brands_logos_google-256.png"),
                          width: 25,
                          height: 25,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                          child: Text(
                            "Google",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
