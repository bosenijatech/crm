import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'getx_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: getPages,
    );
  }
}
