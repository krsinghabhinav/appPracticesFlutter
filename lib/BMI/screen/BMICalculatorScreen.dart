import 'package:apppreacticeall/BMI/controller/bmiController.dart';
import 'package:apppreacticeall/BMI/pdf/generatePDF.dart';
import 'package:apppreacticeall/BMI/widgets/BMIResultCard.dart';
import 'package:apppreacticeall/BMI/widgets/CalculateButton.dart';
import 'package:apppreacticeall/BMI/widgets/GenderDropdown.dart';
import 'package:apppreacticeall/BMI/widgets/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';

class Bmicalculatorscreen extends StatefulWidget {
  const Bmicalculatorscreen({super.key});

  @override
  State<Bmicalculatorscreen> createState() => _BmicalculatorscreenState();
}

class _BmicalculatorscreenState extends State<Bmicalculatorscreen> {
  Bmicontroller bmiController = Get.put(Bmicontroller());
  Generatepdf generatepdf = Generatepdf();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI Calculator'), centerTitle: true),
      body: Column(
        children: [
          Customtextfield(
            controller: bmiController.nameController,
            title: "Enter a name",
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 20),

          Customtextfield(
            controller: bmiController.ageController,
            title: "Enter a age",
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          GenderDropdown(selectedGender: bmiController.selectGender.toString()),
          const SizedBox(height: 20),

          Customtextfield(
            controller: bmiController.heightController,
            title: "Enter a height",
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),

          Customtextfield(
            controller: bmiController.weightController,
            title: "Enter a weight",
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),

          Calculatebutton(
            onTab: () {
              bmiController.calculateBmi();
            },
            title: "Calulate BMI",
          ),
          const SizedBox(height: 20),

          Obx(
            () => Bmiresultcard(
              bmiAdvice: bmiController.bmiAdvice.toString(),
              bmiValue: double.parse(bmiController.bmiValue.toString()),
              bmiCategory: bmiController.bmiCategory.toString(),
              bmiCalculatedDate: bmiController.bmiCalculatedDate.toString(),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () => generatepdf.generatePDF(bmiController),
            icon: const Icon(Icons.picture_as_pdf),
            label: const Text('Download PDF'),
          ),
        ],
      ),
    );
  }
}
