import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:onta_tms/src/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( 
      title: 'Responsive Login',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.login,
      getPages: AppRoutes.pages, 
    );
  }
}