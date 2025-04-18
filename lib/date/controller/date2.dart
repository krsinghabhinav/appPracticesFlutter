import 'package:get/get.dart';

// class DatePickerController extends GetxController {
//   // Observable variables
//   final selectedDate = DateTime.now().obs;
//   final displayMonth = DateTime.now().obs;

//   // Get visible dates (previous, current, next)
//   List<DateTime> get visibleDates {
//     final current = DateTime(
//       displayMonth.value.year,
//       displayMonth.value.month,
//       selectedDate.value.day,
//     );
//     return [
//       current.subtract(const Duration(days: 1)),
//       current,
//       current.add(const Duration(days: 1)),
//     ];
//   }

//   // Navigate to previous month
//   void previousMonth() {
//     final newMonth = DateTime(
//       displayMonth.value.year,
//       displayMonth.value.month - 1,
//       1,
//     );
//     displayMonth.value = newMonth;

//     // Adjust selected date to be within the month bounds
//     final daysInMonth = DateTime(newMonth.year, newMonth.month + 1, 0).day;
//     if (selectedDate.value.day > daysInMonth) {
//       selectedDate.value = DateTime(newMonth.year, newMonth.month, daysInMonth);
//     } else {
//       selectedDate.value = DateTime(
//         newMonth.year,
//         newMonth.month,
//         selectedDate.value.day,
//       );
//     }
//   }

//   // Navigate to next month
//   void nextMonth() {
//     final newMonth = DateTime(
//       displayMonth.value.year,
//       displayMonth.value.month + 1,
//       1,
//     );
//     displayMonth.value = newMonth;

//     // Adjust selected date to be within the month bounds
//     final daysInMonth = DateTime(newMonth.year, newMonth.month + 1, 0).day;
//     if (selectedDate.value.day > daysInMonth) {
//       selectedDate.value = DateTime(newMonth.year, newMonth.month, daysInMonth);
//     } else {
//       selectedDate.value = DateTime(
//         newMonth.year,
//         newMonth.month,
//         selectedDate.value.day,
//       );
//     }
//   }

//   // Select a specific date
//   void selectDate(DateTime date) {
//     selectedDate.value = date;
//     // Ensure display month matches the selected date
//     if (date.month != displayMonth.value.month ||
//         date.year != displayMonth.value.year) {
//       displayMonth.value = DateTime(date.year, date.month, 1);
//     }
//   }

//   // Scroll to next date in the carousel
//   void nextDate() {
//     final nextDate = selectedDate.value.add(const Duration(days: 1));
//     // Check if we need to move to next month
//     if (nextDate.month != selectedDate.value.month) {
//       displayMonth.value = DateTime(nextDate.year, nextDate.month, 1);
//     }
//     selectedDate.value = nextDate;
//   }

//   // Scroll to previous date in the carousel
//   void previousDate() {
//     final prevDate = selectedDate.value.subtract(const Duration(days: 1));
//     // Check if we need to move to previous month
//     if (prevDate.month != selectedDate.value.month) {
//       displayMonth.value = DateTime(prevDate.year, prevDate.month, 1);
//     }
//     selectedDate.value = prevDate;
//   }
// }


// ===================== CONTROLLER =====================
class DatePickerController extends GetxController {
  // Current selected date and the month visible on the screen
  final selectedDate = DateTime.now().obs;
  final displayMonth = DateTime.now().obs;

  // Get yesterday, today, tomorrow dates based on the selected date
  List<DateTime> get visibleDates {
    DateTime today = DateTime(
      displayMonth.value.year,
      displayMonth.value.month,
      selectedDate.value.day,
    );

    return [
      today.subtract(Duration(days: 1)), // yesterday
      today,                             // today
      today.add(Duration(days: 1)),      // tomorrow
    ];
  }

  // Go to previous month
  void previousMonth() {
    DateTime newMonth = DateTime(
      displayMonth.value.year,
      displayMonth.value.month - 1,
      1,
    );
    displayMonth.value = newMonth;

    int maxDays = DateTime(newMonth.year, newMonth.month + 1, 0).day;
    int selectedDay = selectedDate.value.day;

    selectedDate.value = DateTime(
      newMonth.year,
      newMonth.month,
      selectedDay > maxDays ? maxDays : selectedDay,
    );
  }

  // Go to next month
  void nextMonth() {
    DateTime newMonth = DateTime(
      displayMonth.value.year,
      displayMonth.value.month + 1,
      1,
    );
    displayMonth.value = newMonth;

    int maxDays = DateTime(newMonth.year, newMonth.month + 1, 0).day;
    int selectedDay = selectedDate.value.day;

    selectedDate.value = DateTime(
      newMonth.year,
      newMonth.month,
      selectedDay > maxDays ? maxDays : selectedDay,
    );
  }

  // Pick a new date
  void selectDate(DateTime date) {
    selectedDate.value = date;

    if (date.month != displayMonth.value.month ||
        date.year != displayMonth.value.year) {
      displayMonth.value = DateTime(date.year, date.month, 1);
    }
  }

  // Move to next day
  void nextDate() {
    DateTime next = selectedDate.value.add(Duration(days: 1));
    if (next.month != selectedDate.value.month) {
      displayMonth.value = DateTime(next.year, next.month, 1);
    }
    selectedDate.value = next;
  }

  // Move to previous day
  void previousDate() {
    DateTime previous = selectedDate.value.subtract(Duration(days: 1));
    if (previous.month != selectedDate.value.month) {
      displayMonth.value = DateTime(previous.year, previous.month, 1);
    }
    selectedDate.value = previous;
  }
}