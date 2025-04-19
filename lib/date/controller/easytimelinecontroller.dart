import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// class Easytimelinecontroller extends GetxController {
//   var items = <String>[].obs;

//   int currentYear = DateTime.now().year;
//   void showMonthWithYear() {
//     for (int month = 1; month <= 12; month++) {
//       items.add(DateFormat('MMM').format(DateTime(currentYear, month)));
//     }
//     items.add(currentYear.toString());
//   }

//   void laodMonthWithYear() {
//     currentYear++;
//     for (int month = 1; month <= 12; month++) {
//       items.add(DateFormat('MMM').format(DateTime(currentYear, month)));
//     }
//     items.add(currentYear.toString());
//   }

//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();

//     laodMonthWithYear();
//   }
// }


class Easytimelinecontroller extends GetxController {
  var items = <String>[].obs;
  int currentYear = DateTime.now().year;
  int currentMonth = DateTime.now().month;

  void showMonthWithYear() {
    for (int month = 1; month <= 12; month++) {
      items.add(DateFormat('MMM').format(DateTime(currentYear, month)));
    }
    items.add(currentYear.toString());
  }

  void laodMonthWithYear() {
    currentYear++;
    for (int month = 1; month <= 12; month++) {
      items.add(DateFormat('MMM').format(DateTime(currentYear, month)));
    }
    items.add(currentYear.toString());
  }

  @override
  void onInit() {
    super.onInit();
    showMonthWithYear(); // load current year initially
  }
}
