import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UpdateAccountController extends GetxController {
  var isLoading = false.obs;
  var email = ''.obs;
  var phoneNumber = ''.obs;
  var password = ''.obs;
  var profileImage = ''.obs;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      profileImage.value = image.path;
    }
  }
  

  void setEmail(String value) => email.value = value;
  void setPhoneNumber(String value) => phoneNumber.value = value;
  void setPassword(String value) => password.value = value;

  void signInWithGoogle() async {
    try {
      // Implement Google Sign In logic here
      if (kDebugMode) {
        print('Google Sign In');
      }
    } catch (e) {
      // Handle error
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void signInWithApple() async {
    try {
      // Implement Apple Sign In logic here
      if (kDebugMode) {
        print('Apple Sign In');
      }
    } catch (e) {
      // Handle error
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
