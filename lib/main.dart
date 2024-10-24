import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/app_routes.dart';
import 'bindings/app_bindings.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash, // Set your initial route
      getPages: AppRoutes.routes,
      initialBinding: AppBindings(),  // Use your bindings here
    ),
  );
}
