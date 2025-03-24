import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart.';
import '../controller/registration controller.dart';
import '../models/default Text Form Field.dart';
import '../models/default button.dart';
import 'Sign in Screen.dart';
import 'chatScreen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetX<RegistrationController>(
            init: RegistrationController(),
            builder: (controller) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: controller.loginFormKey.value,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  const [
                              Icon(CupertinoIcons.chat_bubble_2_fill,size: 150,)
                            ],
                          ),
                          Text(
                            "Chat App",
                            style: TextStyle(
                              fontFamily: "Lora",
                              fontSize: 40,
                              color: Get.isDarkMode
                                  ? const Color.fromRGBO(
                                  253, 253, 253, 1.0)
                                  : const Color.fromRGBO(
                                  1, 29, 33, 1.0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Align(
                            alignment:Alignment.topLeft,
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontFamily: "Lora",
                                fontSize: 40,
                                color: Get.isDarkMode
                                    ? const Color.fromRGBO(
                                    253, 253, 253, 1.0)
                                    : const Color.fromRGBO(
                                    1, 29, 33, 1.0),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          DefaultTextFormField(
                            radius: 10,
                            validator: (value) {
                              if (value!.isEmpty || !value.contains("@")) {
                                return "Email Address can not be empty";
                              }
                              return null;
                            },
                            controller: controller.loginEmailController.value,
                            type: TextInputType.emailAddress,
                            labelText: "Email address".tr,
                            prefixIcon: Icons.email,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          DefaultTextFormField(
                              radius: 10,
                              obscureText:true,
                              suffixIcon: CupertinoIcons.eye,
                              controller: controller.loginPasswordController.value,
                              type: TextInputType.emailAddress,
                              labelText: "Password".tr,
                              prefixIcon: Icons.lock_outline),
                          const SizedBox(
                            height: 20,
                          ),
                          DefaultButton(
                            radius: 10,
                              icon:  Icons.login_outlined,
                            text: "Login".tr,
                            color: Color.fromRGBO(39, 104, 139, 1.0),
                            onPressed: () async {
                              if (controller.loginFormKey.value.currentState!
                                  .validate()) {
                                try {
                                  var auth = FirebaseAuth.instance;
                                  UserCredential user =
                                  await auth.signInWithEmailAndPassword(
                                      email: controller
                                          .loginEmailController.value.text,
                                      password: controller
                                          .loginPasswordController.value.text);
                                  Get.to(ChatScreen(),arguments: controller.loginEmailController.value.text);
                                } on FirebaseAuthException catch (ex) {
                                  if (ex.code == "user-not-found") {
                                    Get.snackbar(
                                      'Warning',
                                      'user is not found',
                                      icon: const Icon(
                                        Icons.warning,
                                        color: Colors.red,
                                      ),
                                      snackPosition: SnackPosition.BOTTOM,
                                    );
                                  } else if (ex.code == "wrong-password") {
                                    Get.snackbar(
                                      'Warning',
                                      'wrong password',
                                      icon: const Icon(
                                        Icons.warning,
                                        color: Colors.red,
                                      ),
                                      snackPosition: SnackPosition.BOTTOM,
                                    );
                                  }
                                  print(ex);
                                }
                              }
                              controller.loginEmailController.value.clear();
                              controller.loginPasswordController.value.clear();
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't Have Account?",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              TextButton(
                                  onPressed: () {Get.to(SignUpScreen());},
                                  child: const Text(
                                    ("Sign Up"),
                                    style:  TextStyle(
                                        color: Color(0xff26688B), fontSize: 16),
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
