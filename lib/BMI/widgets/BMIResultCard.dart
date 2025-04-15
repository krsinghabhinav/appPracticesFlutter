import 'package:flutter/material.dart';

class Bmiresultcard extends StatelessWidget {
  final double? bmiValue;
  final String? bmiCategory;
  final String? bmiAdvice;
  final String? bmiCalculatedDate;

  const Bmiresultcard({
    super.key,
    this.bmiAdvice,
    this.bmiCategory,
    this.bmiValue,
    this.bmiCalculatedDate,
  });

  @override
  Widget build(BuildContext context) {
    return bmiValue == 0.0
        ? SizedBox()
        : Card(
          color: Colors.red.shade100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "BMI: ${bmiValue!.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("Category: ${bmiCategory ?? ''}"),
                Text("Advice: ${bmiAdvice ?? ''}"),
                Text("Calculated on: ${bmiCalculatedDate ?? ''}"),
              ],
            ),
          ),
        );
  }
}
