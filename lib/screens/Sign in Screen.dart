import 'package:chat_app/screens/login%20screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart.';
import '../controller/registration controller.dart';
import '../models/default Text Form Field.dart';
import '../models/default button.dart';

class SignUpScreen extends StatelessWidget {
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
                      key: controller.formKey.value,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                CupertinoIcons.chat_bubble_2_fill,
                                size: 150,
                              )
                            ],
                          ),
                          Text(
                            "Chat App",
                            style: TextStyle(
                              fontFamily: "Lora",
                              fontSize: 40,
                              color: Get.isDarkMode
                                  ? const Color.fromRGBO(253, 253, 253, 1.0)
                                  : const Color.fromRGBO(1, 29, 33, 1.0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontFamily: "Lora",
                                fontSize: 40,
                                color: Get.isDarkMode
                                    ? const Color.fromRGBO(253, 253, 253, 1.0)
                                    : const Color.fromRGBO(1, 29, 33, 1.0),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DefaultTextFormField(
                            radius: 10,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return " User can not be empty";
                              }
                              return null;
                            },
                            controller: controller.userController.value,
                            type: TextInputType.text,
                            labelText: "User".tr,
                            prefixIcon: CupertinoIcons.person,
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
                            controller: controller.emailController.value,
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
                              controller: controller.passwordController.value,
                              type: TextInputType.emailAddress,
                              labelText: "Password".tr,
                              prefixIcon: Icons.lock_outline),
                          const SizedBox(
                            height: 20,
                          ),
                          DefaultButton(
                            radius: 10,
                            icon: CupertinoIcons.person,
                            text: "Sign Up".tr,
                            color: const Color.fromRGBO(39, 104, 139, 1.0),
                            onPressed: () async {
                              if (controller.formKey.value.currentState!.validate())
                              {
                                try {
                                  var auth = FirebaseAuth.instance;
                                  UserCredential user =
                                    await auth.createUserWithEmailAndPassword(
                                    email: controller.emailController.value.text,
                                    password: controller.passwordController.value.text,
                                  );
                                  Get.to(LoginScreen());
                                } on FirebaseAuthException catch (ex) {
                                  if (ex.code == "weak-password") {
                                    Get.snackbar(
                                      'Warning',
                                      'Weak Password',
                                      icon: const Icon(
                                        Icons.warning,
                                        color: Colors.red,
                                      ),
                                      snackPosition: SnackPosition.BOTTOM,
                                    );
                                  }
                                  else if (ex.code == "The Email-Already-In-Use") {
                                    Get.snackbar(
                                      'Warning',
                                      'email already in use',
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
                              controller.emailController.value.clear();
                              controller.passwordController.value.clear();
                              controller.userController.value.clear();
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "If You Have Account?",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Get.to(LoginScreen());
                                  },
                                  child: const Text(
                                    ("Login"),
                                    style: TextStyle(
                                        color: Color(0xff26688B), fontSize: 16),
                                  ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
        ),
    );
  }
}
