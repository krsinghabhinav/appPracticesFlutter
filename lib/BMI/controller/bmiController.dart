import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bmicontroller extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  var selectGender = "Male".obs;
  var bmiValue = 0.0.obs;
  var bmiCategory = ''.obs;
  var bmiAdvice = ''.obs;
  var bmiCalculatedDate = ''.obs;

  void calculateBmi() {
    double heightcm = double.parse(heightController.text) ?? 0;
    double weightkg = double.parse(weightController.text) ?? 0;

    if (heightcm > 0 && weightkg > 0) {
      double heightM = heightcm / 100;
      double bmi = weightkg / (heightM * heightM);
      bmiValue.value = bmi;
      if (bmi < 18.5) {
        bmiCategory.value = "Underweight";
        bmiAdvice.value = "You are underweight. You should gain some weight.";
      } else if (bmi < 25) {
        bmiCategory.value = "Normal";
        bmiAdvice.value = "You are normal weight. Good job!";
      } else if (bmi < 30) {
        bmiCategory.value = "Overweight";
        bmiAdvice.value = "You are overweight. You should lose some weight.";
      } else {
        bmiCategory.value = "Obese";
        bmiAdvice.value = "You are obese. You should lose some weight.";
      }
      bmiCalculatedDate.value = DateTime.now().toString();
    }
  }
}
