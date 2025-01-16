import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'routes/app_routes.dart';
import 'bindings/app_bindings.dart';

void main()async {
  await Supabase.initialize(
anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZqZW1pcXZzb2l5dmpkeWdieHNnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzcwMjI0ODYsImV4cCI6MjA1MjU5ODQ4Nn0.SzX4YQFMIaDnNEUsAkkJ1O62lxpO9tl4noJi0nP29QQ",
url: "https://vjemiqvsoiyvjdygbxsg.supabase.co",
);

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash, // Set your initial route
      getPages: AppRoutes.routes,
      initialBinding: AppBindings(),  // Initialize bindings here
    ),
  );
}
