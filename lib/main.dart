import 'package:apppreacticeall/BMI/screen/BMICalculatorScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'MusicApp/MusicApp.dart';
import 'ShoppingApp/ShoppingApp.dart';
import 'calculator/calculator.dart';
import 'categories/ui/categoryUi.dart';
import 'categorytest/ui/home_page.dart';
import 'dymmyjsontestAPI/ui/DummyuidatabyControl.dart';
import 'dymmyjsontestAPI/ui/ProductListScreen.dart';
import 'dymmyjsontestAPI/ui/dummyUIData.dart';
import 'e-commercefacke/controller/OrderController.dart';
import 'e-commercefacke/screen/ecommercehome_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ProductListScreen(),
    );
  }
}
