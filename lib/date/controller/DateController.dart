
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// class DateController extends GetxController {
//   final currentDate = DateTime.now().obs;
//   final selectedDay = DateTime.now().day.obs;
//   final daysInMonth = 31.obs;
//   final monthYearText = ''.obs;
//   final ScrollController scrollController = ScrollController();

//   @override
//   void onInit() {
//     super.onInit();
//     updateMonthData();
    
//     // Scroll to current day initially
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       scrollToSelectedDay();
//     });
//   }

//   void updateMonthData() {
//     // Calculate days in the current month
//     daysInMonth.value = DateTime(
//       currentDate.value.year,
//       currentDate.value.month + 1,
//       0,
//     ).day;
    
//     // Update month and year text
//     monthYearText.value = DateFormat('MMMM yyyy').format(currentDate.value).toUpperCase();
//   }

//   void selectDay(int day) {
//     selectedDay.value = day;
//     scrollToSelectedDay();
//   }

//   void scrollToSelectedDay() {
//     // Calculate position to scroll to
//     double itemWidth = 60.0; // Width of selected item
//     double position = (selectedDay.value - 2) * itemWidth;
    
//     // Ensure position is within bounds
//     position = position < 0 ? 0 : position;
    
//     // Animate to the position
//     if (scrollController.hasClients) {
//       scrollController.animateTo(
//         position,
//         duration: Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//       );
//     }
//   }

//   void nextMonth() {
//     // Move to next month
//     currentDate.value = DateTime(
//       currentDate.value.year,
//       currentDate.value.month + 1,
//       1,
//     );
    
//     // Reset selected day to 1 when changing months
//     selectedDay.value = 1;
//     updateMonthData();
//     scrollToSelectedDay();
//   }

//   void previousMonth() {
//     // Move to previous month
//     currentDate.value = DateTime(
//       currentDate.value.year,
//       currentDate.value.month - 1,
//       1,
//     );
    
//     // Reset selected day to 1 when changing months
//     selectedDay.value = 1;
//     updateMonthData();
//     scrollToSelectedDay();
//   }
// }



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// class DateController extends GetxController {
//   Rx<DateTime> selectedDate = DateTime.now().obs;

//   void nextMonth() {
//     selectedDate.value = DateTime(selectedDate.value.year, selectedDate.value.month + 1, selectedDate.value.day);
//   }

//   void previousMonth() {
//     selectedDate.value = DateTime(selectedDate.value.year, selectedDate.value.month - 1, selectedDate.value.day);
//   }

//   void updateDate(DateTime date) {
//     selectedDate.value = date;
//   }

//   List<DateTime> get currentDates {
//     DateTime firstDayOfMonth = DateTime(selectedDate.value.year, selectedDate.value.month, 1);
//     int daysInMonth = DateUtils.getDaysInMonth(selectedDate.value.year, selectedDate.value.month);
//     return List.generate(daysInMonth, (index) => firstDayOfMonth.add(Duration(days: index)));
//   }
// }


class DateController extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;

  void nextMonth() {
    selectedDate.value = DateTime(selectedDate.value.year, selectedDate.value.month + 1, 1);
  }

  void previousMonth() {
    selectedDate.value = DateTime(selectedDate.value.year, selectedDate.value.month - 1, 1);
  }

  void updateDate(DateTime date) {
    selectedDate.value = date;
  }

  List<DateTime> get currentDates {
    DateTime firstDayOfMonth = DateTime(selectedDate.value.year, selectedDate.value.month, 1);
    int daysInMonth = DateUtils.getDaysInMonth(selectedDate.value.year, selectedDate.value.month);
    return List.generate(daysInMonth, (index) => firstDayOfMonth.add(Duration(days: index)));
  }

  int get selectedIndex {
    final list = currentDates;
    return list.indexWhere((date) =>
        DateFormat('yyyy-MM-dd').format(date) == DateFormat('yyyy-MM-dd').format(selectedDate.value));
  }
}