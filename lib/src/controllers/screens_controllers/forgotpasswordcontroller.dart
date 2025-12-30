import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onta_tms/src/routes/app_routes.dart';

class ForgotPasswordController extends GetxController {
  //form key
  final formKey = GlobalKey<FormState>();

  //textediting controller
  final emailController = TextEditingController();

  //observable variable
  final isLoading = false.obs;

  //email validator
  //----------------------
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  //handle submit
  Future<void> handleSubmit() async {
    if (formKey.currentState!.validate()) {
      try {
        isLoading.value = true;

        await Future.delayed(const Duration(seconds: 2));

        //navigate to reset password page
        Get.toNamed(AppRoutes.resetPassword);
      } finally {
        isLoading.value = false;
      }
    }
  }

  //navigate back
  void goBack() {
    Get.back();
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
