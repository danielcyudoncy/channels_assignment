
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UpdateAccountController extends GetxController {
  var selectedRole = ''.obs; // Observable for storing the selected role
  
  // Other controller variables like email, phone, etc.
  var email = ''.obs;
  var phoneNumber = ''.obs;
  var fullName = ''.obs;
  var profileImage = ''.obs;
  var isLoading = false.obs;

  // Methods to set values (You might already have these)
  void setRole(String? role) {
  if (role != null) {
    selectedRole.value = role;
  }
}

  void setFullName(String name) => fullName.value = name;
  void setEmail(String emailValue) => email.value = emailValue;
  void setPhoneNumber(String phoneValue) => phoneNumber.value = phoneValue;
  void setProfileImage(String image) => profileImage.value = image;

  // Function to handle image picking
  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      profileImage.value = image.path;
    // Implement image picking logic here
  }
}
}