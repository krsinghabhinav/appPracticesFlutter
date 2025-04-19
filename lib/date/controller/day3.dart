import 'package:get/get.dart';

class Day3Controller extends GetxController {
  final selectedDate = DateTime.now().obs;
  // final displayMonth = DateTime.now().obs;
  final date = DateTime.now().obs;
  var dateStore = [].obs;

  var isSelected = false.obs;

 

  List<DateTime> visibleDates() {
    DateTime today = DateTime(
      selectedDate.value.year,
      selectedDate.value.month,
      selectedDate.value.day,
    );
    return [
      today.subtract(Duration(days: 1)),//previous
      today,  //current 
      today.add(Duration(days: 1)), // next
    ];
  }

  void previouseMonth() {
    selectedDate.value = DateTime(
      selectedDate.value.year,
      selectedDate.value.month - 1,
      1,
    );
  }
  // void previouseMonth() {
  //   DateTime newMonth = DateTime(
  //     displayMonth.value.year,
  //     displayMonth.value.month - 1,
  //     1,
  //   );
  //   displayMonth.value = newMonth;

  //   int maxDays = DateTime(newMonth.year, newMonth.month + 1, 0).day;
  //   int selectedDay = selectedDate.value.day;
  //   selectedDate.value = DateTime(
  //     newMonth.year,
  //     newMonth.month,
  //     selectedDay > maxDays ? maxDays : selectedDay,
  //   );
  // }

  void nextMonth() {
    selectedDate.value = DateTime(
      selectedDate.value.year,
      selectedDate.value.month + 1,
      1,
    );
  }

  // void nextMonth() {
  //   DateTime newtMonth = DateTime(
  //     displayMonth.value.year,
  //     displayMonth.value.month + 1,
  //     1,
  //   );
  //   displayMonth.value = newtMonth;

  //   int maxDays = DateTime(newtMonth.year, newtMonth.month + 1, 0).day;
  //   int selectedDay = selectedDate.value.day;

  //   selectedDate.value = DateTime(
  //     newtMonth.year,
  //     newtMonth.month,
  //     selectedDay > maxDays ? maxDays : selectedDay,
  //   );
  // }

  void selectdDate(DateTime date) {
    selectedDate.value = date;

    // if (date.month != displayMonth.value.month ||
    //     date.year != displayMonth.value.year) {
    //   displayMonth.value = DateTime(date.year, date.month, 1);
    // }
  }

  void nextDate() {
    DateTime next = selectedDate.value.add(Duration(days: 1));
    // if (next.month != selectedDate.value.month) {
    //   displayMonth.value = DateTime(next.year, next.month, 1);
    // }
    selectedDate.value = next;
  }

  void previousDate() {
    DateTime previous = selectedDate.value.subtract(Duration(days: 1));

    // if (previous.month != selectedDate.value.month) {
    //   displayMonth.value = DateTime(previous.year, previous.month, 1);
    // }

    selectedDate.value = previous;
  }
}


// import 'package:get/get.dart';

// class Day3Controller extends GetxController {
//   // Abhi ka date selected hai
//   var selectedDate = DateTime.now().obs;

//   // Jo month screen pe dikh raha hai (calendar view)
//   var displayMonth = DateTime.now().obs;

//   // Ye sirf reference ke liye rakha hai (zarurat pe use kar sakte ho)
//   var date = DateTime.now().obs;

//   // Ye flag check karega ki koi date select hui ya nahi
//   var isSelected = false.obs;

//   // Yaha 3 din dikh rahe hain: kal, aaj, parso
//   List<DateTime> visibleDates() {
//     // Current selected day ko displayMonth ke hisaab se bana rahe hain
//     DateTime today = DateTime(
//       displayMonth.value.year,
//       displayMonth.value.month,
//       selectedDate.value.day,
//     );

//     // List mein kal, aaj aur parso return karenge
//     return [
//       today.subtract(Duration(days: 1)), // kal
//       today,                             // aaj
//       today.add(Duration(days: 1)),     // parso
//     ];
//   }

//   // Jab user previous month pe click kare
//   void previouseMonth() {
//     // Ek mahina peeche jao
//     DateTime newMonth = DateTime(
//       displayMonth.value.year,
//       displayMonth.value.month - 1,
//       1,
//     );

//     displayMonth.value = newMonth;

//     // Dekho naye month mein kitne din hai
//     int maxDays = DateTime(newMonth.year, newMonth.month + 1, 0).day;

//     // Agar pehle select kiya hua day naye month mein nahi aata toh last day le lo
//     int day = selectedDate.value.day;
//     selectedDate.value = DateTime(
//       newMonth.year,
//       newMonth.month,
//       day > maxDays ? maxDays : day,
//     );
//   }

//   // Jab user next month pe click kare
//   void nextMonth() {
//     // Ek mahina aage jao
//     DateTime newMonth = DateTime(
//       displayMonth.value.year,
//       displayMonth.value.month + 1,
//       1,
//     );

//     displayMonth.value = newMonth;

//     // Naye month ke maximum days nikaal lo
//     int maxDays = DateTime(newMonth.year, newMonth.month + 1, 0).day;

//     // Safe date set karo
//     int day = selectedDate.value.day;
//     selectedDate.value = DateTime(
//       newMonth.year,
//       newMonth.month,
//       day > maxDays ? maxDays : day,
//     );
//   }

//   // Jab user koi specific date select kare
//   void selectdDate(DateTime date) {
//     // Select kiya hua date update karo
//     selectedDate.value = date;

//     // Agar month ya year change ho gaya toh displayMonth bhi update karo
//     if (date.month != displayMonth.value.month ||
//         date.year != displayMonth.value.year) {
//       displayMonth.value = DateTime(date.year, date.month, 1);
//     }
//   }

//   // Agle din pe jao
//   void nextDate() {
//     DateTime next = selectedDate.value.add(Duration(days: 1));

//     // Agar month change hua toh displayMonth update karo
//     if (next.month != selectedDate.value.month) {
//       displayMonth.value = DateTime(next.year, next.month, 1);
//     }

//     selectedDate.value = next;
//   }

//   // Pichle din pe jao
//   void previousDate() {
//     DateTime previous = selectedDate.value.subtract(Duration(days: 1));

//     // Month change hua kya? Toh update karo
//     if (previous.month != selectedDate.value.month) {
//       displayMonth.value = DateTime(previous.year, previous.month, 1);
//     }

//     selectedDate.value = previous;
//   }
// }
