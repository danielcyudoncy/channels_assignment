import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var email = ''.obs;
  var password = ''.obs;

  void setEmail(String value) => email.value = value;
  void setPassword(String value) => password.value = value;

  Future<void> createAccount() async {
    try {
      isLoading.value = true;
      // Add your authentication logic here
      await Future.delayed(Duration(seconds: 2)); // Simulated API call
      print('Creating account with: ${email.value}');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void signInWithGoogle() async {
    try {
      // Implement Google Sign In
      print('Google Sign In');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void signInWithApple() async {
    try {
      // Implement Apple Sign In
      print('Apple Sign In');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}