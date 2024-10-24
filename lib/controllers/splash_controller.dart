import 'package:assignmentapp/screens/home_page.dart';
import 'package:get/get.dart';


class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.put(const HomePage()); 
  }
}
