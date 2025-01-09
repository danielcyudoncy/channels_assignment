import 'package:get/get.dart';

class CreateAccountController extends GetxController {
  // Reactive variables to hold form input values and loading state
  var fullName = ''.obs;
  var isLoading = false.obs;
  var role = ''.obs;
  var profileImage = ''.obs;

  // Example function to simulate account creation process
  void createAccount() async {
    if (_validateForm()) {
      try {
        isLoading.value = true;

        // Simulate a network request with a delay (replace with actual API call)
        await Future.delayed(const Duration(seconds: 3));

        // After successful account creation, reset loading state
        isLoading.value = false;

        // Optionally, show a success message or navigate to another screen
        Get.snackbar('Success', 'Account created successfully!');
      } catch (error) {
        // In case of error, reset loading state and show error message
        isLoading.value = false;
        Get.snackbar('Error', 'Failed to create account: $error');
      }
    }
  }

  // Example form validation method (simplified without email and password validation)
  bool _validateForm() {
    if (fullName.value.isEmpty) {
      Get.snackbar('Error', 'Full Name is required');
      return false;
    } else if (role.value.isEmpty) {
      Get.snackbar('Error', 'Please select a role');
      return false;
    } else if (profileImage.value.isEmpty) {
      Get.snackbar('Error', 'Profile image is required');
      return false;
    }

    return true;
  }
}
