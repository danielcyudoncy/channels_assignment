import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class GetStartedController extends GetxController {
  // Observables for managing the states of email, password, and loading state
  var isLoading = false.obs;
  var email = ''.obs;
  var password = ''.obs;

  // Setters for the email and password values
  void setEmail(String value) => email.value = value;
  void setPassword(String value) => password.value = value;

  // Simulate account creation with a Future method
  Future<void> createAccount() async {
    try {
      isLoading.value = true;  // Set loading to true
      // Simulated API call for creating an account
      await Future.delayed(const Duration(seconds: 2));
      if (kDebugMode) {
        print('Creating account with: ${email.value}');
      }
    } catch (e) {
      // Show an error message using GetX snackbar
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;  // Set loading to false after the operation
    }
  }

  // Method for handling Google SignIn
  void signInWithGoogle() async {
    try {
      // Add your logic for Google SignIn here
      if (kDebugMode) {
        print('Google Sign In');
      }
    } catch (e) {
      // Show an error message using GetX snackbar
      Get.snackbar('Error', e.toString());
    }
  }

  // Method for handling Apple SignIn
  void signInWithApple() async {
    try {
      // Add your logic for Apple SignIn here
      if (kDebugMode) {
        print('Apple Sign In');
      }
    } catch (e) {
      // Show an error message using GetX snackbar
      Get.snackbar('Error', e.toString());
    }
  }
}
