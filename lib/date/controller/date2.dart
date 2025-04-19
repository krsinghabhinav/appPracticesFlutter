// import 'package:get/get.dart';

// // class DatePickerController extends GetxController {
// //   // Observable variables
// //   final selectedDate = DateTime.now().obs;
// //   final displayMonth = DateTime.now().obs;

// //   // Get visible dates (previous, current, next)
// //   List<DateTime> get visibleDates {
// //     final current = DateTime(
// //       displayMonth.value.year,
// //       displayMonth.value.month,
// //       selectedDate.value.day,
// //     );
// //     return [
// //       current.subtract(const Duration(days: 1)),
// //       current,
// //       current.add(const Duration(days: 1)),
// //     ];
// //   }

// //   // Navigate to previous month
// //   void previousMonth() {
// //     final newMonth = DateTime(
// //       displayMonth.value.year,
// //       displayMonth.value.month - 1,
// //       1,
// //     );
// //     displayMonth.value = newMonth;

// //     // Adjust selected date to be within the month bounds
// //     final daysInMonth = DateTime(newMonth.year, newMonth.month + 1, 0).day;
// //     if (selectedDate.value.day > daysInMonth) {
// //       selectedDate.value = DateTime(newMonth.year, newMonth.month, daysInMonth);
// //     } else {
// //       selectedDate.value = DateTime(
// //         newMonth.year,
// //         newMonth.month,
// //         selectedDate.value.day,
// //       );
// //     }
// //   }

// //   // Navigate to next month
// //   void nextMonth() {
// //     final newMonth = DateTime(
// //       displayMonth.value.year,
// //       displayMonth.value.month + 1,
// //       1,
// //     );
// //     displayMonth.value = newMonth;

// //     // Adjust selected date to be within the month bounds
// //     final daysInMonth = DateTime(newMonth.year, newMonth.month + 1, 0).day;
// //     if (selectedDate.value.day > daysInMonth) {
// //       selectedDate.value = DateTime(newMonth.year, newMonth.month, daysInMonth);
// //     } else {
// //       selectedDate.value = DateTime(
// //         newMonth.year,
// //         newMonth.month,
// //         selectedDate.value.day,
// //       );
// //     }
// //   }

// //   // Select a specific date
// //   void selectDate(DateTime date) {
// //     selectedDate.value = date;
// //     // Ensure display month matches the selected date
// //     if (date.month != displayMonth.value.month ||
// //         date.year != displayMonth.value.year) {
// //       displayMonth.value = DateTime(date.year, date.month, 1);
// //     }
// //   }

// //   // Scroll to next date in the carousel
// //   void nextDate() {
// //     final nextDate = selectedDate.value.add(const Duration(days: 1));
// //     // Check if we need to move to next month
// //     if (nextDate.month != selectedDate.value.month) {
// //       displayMonth.value = DateTime(nextDate.year, nextDate.month, 1);
// //     }
// //     selectedDate.value = nextDate;
// //   }

// //   // Scroll to previous date in the carousel
// //   void previousDate() {
// //     final prevDate = selectedDate.value.subtract(const Duration(days: 1));
// //     // Check if we need to move to previous month
// //     if (prevDate.month != selectedDate.value.month) {
// //       displayMonth.value = DateTime(prevDate.year, prevDate.month, 1);
// //     }
// //     selectedDate.value = prevDate;
// //   }
// // }


// // ===================== CONTROLLER =====================
// class DatePickerController extends GetxController {
//   // Current selected date and the month visible on the screen
//   final selectedDate = DateTime.now().obs;
//   final displayMonth = DateTime.now().obs;

//   // Get yesterday, today, tomorrow dates based on the selected date
//   List<DateTime> get visibleDates {
//     DateTime today = DateTime(
//       displayMonth.value.year,
//       displayMonth.value.month,
//       selectedDate.value.day,
//     );

//     return [
//       today.subtract(Duration(days: 1)), // yesterday
//       today,                             // today
//       today.add(Duration(days: 1)),      // tomorrow
//     ];
//   }

//   // Go to previous month
//  void previousMonth() {
//   // Pehle hum ek naya month banate hain, jo selected month se ek month pehle ka hoga.
//   DateTime newMonth = DateTime(
//     displayMonth.value.year,
//     displayMonth.value.month - 1,  // Ek mahina pichhe chala jayega
//     1,                             // Har month ka pehla din
//   );
//   displayMonth.value = newMonth;   // Hum displayMonth ko update kar rahe hain
  
//   // Ab hum maxDays calculate karte hain, jo naya month ka last day hoga
//   int maxDays = DateTime(newMonth.year, newMonth.month + 1, 0).day;

//   // Ab hum selectedDay ko lete hain, jo current selected date ka din hai
//   int selectedDay = selectedDate.value.day;

//   // Hum selectedDate ko update kar rahe hain, agar selectedDay zyada ho to usse maxDays pe set karte hain
//   selectedDate.value = DateTime(
//     newMonth.year,
//     newMonth.month,
//     selectedDay > maxDays ? maxDays : selectedDay, // Agar selectedDay maxDays se bada ho to maxDays set karte hain
//   );
// }


//   // Go to next month
// void nextMonth() {
//   // Naye mahine ki pehli tareekh banate hain (next month)
//   DateTime newMonth = DateTime(
//     displayMonth.value.year,        // Current year
//     displayMonth.value.month + 1,   // Next month
//     1,                              // Pehla din
//   );
//   displayMonth.value = newMonth;    // Display month ko update karte hain
  
//   // Max days calculate karte hain, jo next month ka last day hoga
//   int maxDays = DateTime(newMonth.year, newMonth.month + 1, 0).day;
  
//   // Ab hum selected day ko lete hain, jo current selected date ka din hai
//   int selectedDay = selectedDate.value.day;

//   // Agar selected day next month ke max days se zyada ho, to usko max days par set karte hain
//   selectedDate.value = DateTime(
//     newMonth.year,             // Naye month ka year
//     newMonth.month,            // Naye month ka month
//     selectedDay > maxDays      // Agar selected day max days se zyada ho to max day set karte hain
//         ? maxDays
//         : selectedDay,         // Warna selected day ko hi rakht hain
//   );
// }


//   // Pick a new date
//   void selectDate(DateTime date) {
//   selectedDate.value = date;  // New selected date ko update karte hain

//   // Agar selected date ka month aur year display month se alag hain
//   if (date.month != displayMonth.value.month ||
//       date.year != displayMonth.value.year) {
//     displayMonth.value = DateTime(date.year, date.month, 1); // Display month ko update karte hain
//   }
// }


//   // Move to next day
// void nextDate() {
//   DateTime next = selectedDate.value.add(Duration(days: 1)); // Selected date se ek din badha kar next date banate hain
  
//   // Agar next date ka month selected date ke month se alag hai
//   if (next.month != selectedDate.value.month) {
//     displayMonth.value = DateTime(next.year, next.month, 1);  // Display month ko next month ke pehle din se update karte hain
//   }
  
//   selectedDate.value = next; // Selected date ko next date se update karte hain
// }


//   // Move to previous day
// void previousDate() {
//   DateTime previous = selectedDate.value.subtract(Duration(days: 1)); // Selected date se ek din ghatakar previous date banate hain
  
//   // Agar previous date ka month selected date ke month se alag hai
//   if (previous.month != selectedDate.value.month) {
//     displayMonth.value = DateTime(previous.year, previous.month, 1);  // Display month ko previous month ke pehle din se update karte hain
//   }
  
//   selectedDate.value = previous; // Selected date ko previous date se update karte hain
// }

// }