import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var codeController = TextEditingController().obs;
  var formKey = GlobalKey<FormState>().obs;
  var loginFormKey = GlobalKey<FormState>().obs;
  var userController = TextEditingController().obs;
  var loginEmailController = TextEditingController().obs;
  var loginPasswordController = TextEditingController().obs;
}
