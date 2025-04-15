import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenderDropdown extends StatelessWidget {
  String? selectedGender;

  GenderDropdown({super.key, this.selectedGender});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedGender,
      items:
          ['Male', 'Female', 'Other']
              .map(
                (gender) =>
                    DropdownMenuItem(value: gender, child: Text(gender)),
              )
              .toList(),
      decoration: const InputDecoration(labelText: 'Gender'),
      onChanged: (value) {
        selectedGender = value!;
      },
    );
  }
}
