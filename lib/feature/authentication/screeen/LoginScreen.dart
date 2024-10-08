import 'package:cikitsakai/feature/authentication/controller/login_controller.dart';
import 'package:cikitsakai/utills/validation/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'RegisterScreen.dart';
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
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
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
                      decoration: InputDecoration(
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                              color: Color(0xff9e9e9e), width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                              color: Color(0xff9e9e9e), width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                              color: Color(0xff9e9e9e), width: 1),
                        ),
                        labelText: "Email",
                        isDense: false,
                        filled: true,
                        fillColor: const Color(0x00f2f2f3),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                          color: Colors.black, //Color(0x00f2f2f3),
                        ),
                      ),
                    ),
                  ),
                ),

                /// -------------------------------------------------------
                TextFormField(
                  controller: controller.password,
                  obscureText: controller.hidePassword.value,
                  validator: (value) => TValidator.validatePassword(value),
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    color: Color(0xff000000),
                  ),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () =>controller.hidePassword.value = !controller.hidePassword.value,
                        icon: Icon(controller.hidePassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye)),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide:
                          const BorderSide(color: Color(0xff9e9e9e), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide:
                          const BorderSide(color: Color(0xff9e9e9e), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide:
                          const BorderSide(color: Color(0xff9e9e9e), width: 1),
                    ),
                    labelText: "Password",
                    isDense: false,
                    filled: true,
                    fillColor: const Color(0x00f2f2f3),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    labelStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        color: Colors.black //Color(0x00f2f2f3),
                        ),
                  ),
                ),

                /// ----------------------------------------
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
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

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: MaterialButton(
                          onPressed: () {
                            // Navigate to the RegisterScreen when the button is pressed
                            Get.to(()=> const RegisterScreen());
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
                      Expanded(
                        flex: 1,
                        child: MaterialButton(
                          onPressed: () {
                            // String email = 'admin';
                            // String password = 'admin';
                            // if (emailController.text == email &&
                            //     passwordController.text == password) {
                            //   Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (_) => const DashboardScreen()));
                            // } else {
                            //   // Shoe an error message or perform other actions if the credentials don't match
                            //   showDialog(
                            //     context: context,
                            //     builder: (context) {
                            //       return AlertDialog(
                            //         title: const Text('Invalid Credentials'),
                            //         content: const Text(
                            //             'Please enter valid email and password.'),
                            //         actions: [
                            //           TextButton(
                            //               onPressed: () =>
                            //                   Navigator.pop(context),
                            //               child: const Text('OK'))
                            //         ],
                            //       );
                            //     },
                            //   );
                            // }
                          },
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
                Container(
                  margin: const EdgeInsets.all(0),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12.0),
                      border:
                          Border.all(color: const Color(0xff9e9e9e), width: 1)),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
