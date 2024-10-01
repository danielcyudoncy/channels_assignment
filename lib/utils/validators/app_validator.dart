class AppValidator {
  static String? validateTextState (String? text){
    if (text!.isEmpty) {
      return "";
    }else{
      return null;
    }
  }

  static String? validateName (String? name, String titleName){
    if (name == null || name.isEmpty) {
      return "$titleName is required!";
    }else if(name.length <= 3){
      return "$titleName should be at least 4 characters";
    }else{
      return null;
    }
  }

  static String? validatePhone (String? phone){
    if (phone == null || phone.isEmpty) {
      return "Phone Number is required!";
    }else if(phone.length != 11){
      return "Invalid Phone Number";
    }else{
      return null;
    }
  }

  static String? validateEmail (String? email){
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (email == null || email.isEmpty) {
      return "Email Address is required!";
    }else if(!emailRegExp.hasMatch(email)){
      return "Invalid Email Address!";
    }else{
      return null;
    }
  }

  static String? validatePassword (String? password){
    if (password == null || password.isEmpty) {
      return "Password is required.";
    }

    if (password.length < 6) {
      return "Password must be at least 6 characters long";
    }

    if (!password.contains(RegExp(r'[A-Z]'))) {
      return "Password must contain at least one uppercase letter";
    }

    if (!password.contains(RegExp(r'[0-9]'))) {
      return "Password must contain at least one number";
    }

    if (!password.contains(RegExp(r'[!@#$%^&*(),.?:{}|<>]'))) {
      return "Password must contain at least one special character.";
    }

    return null;
  }

  static String? confirmPassword(String? password, String? confirmPassword){
    if (confirmPassword != password){
      return "Password and Confirm Password do not match";
    }else{
      return null;
    }
  }
}