import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:onta_tms/src/routes/app_routes.dart';

class ResetPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();

  //text editing controllers of password and confirm password
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //observable variables
  final obscurePassword = true.obs;
  final obscureConfirmPassword = true.obs;
  final isLoading = false.obs;

  //confirm passqword visibility
  void toggleConfirmPasswordVisibility() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }

  //password visbility
  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  //password validator
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  //confirm password validator
  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  //handle submits
  Future<void> handleSubmit() async{
    if (formKey.currentState!.validate()) {
      try{
        isLoading.value = true;

        await Future.delayed(const Duration(seconds: 2));

        //  success message
        Get.snackbar(
          'Success',
          'Password reset successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
        );
        
        // Navigate to home page
        Get.offAllNamed(AppRoutes.homePage);
        
      } catch (e) {
        // Show error message
        Get.snackbar(
          'Error',
          'Failed to reset password: ${e.toString()}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
      } finally {
        isLoading.value = false;
      }
    }
  }
  
  // Navigate back
  void goBack() {
    Get.back();
  }
  
  @override
  void onClose() {
    // Dispose controllers when not needed
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}