
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';


// import '../controller/DateController.dart';class DatePickerScreen extends StatelessWidget {
//   final DateController dateController = Get.put(DateController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text('Date Picker'),
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         elevation: 0,
//       ),
//       body: Column(
//         children: [
//           SizedBox(height: 20),
//           // Month and year header with navigation arrows
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.chevron_left, size: 28),
//                   onPressed: () => dateController.previousMonth(),
//                 ),
//                 Obx(() => Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(Icons.calendar_today, size: 20, color: Colors.black54),
//                     SizedBox(width: 8),
//                     Text(
//                       dateController.monthYearText.value,
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 )),
//                 IconButton(
//                   icon: Icon(Icons.chevron_right, size: 28),
//                   onPressed: () => dateController.nextMonth(),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 30),
//           // Carousel date selector
//           Container(
//             height: 80,
//             child: Obx(() => NotificationListener<ScrollNotification>(
//               onNotification: (ScrollNotification scrollInfo) {
//                 if (scrollInfo is ScrollEndNotification) {
//                   // Handle scroll end if needed
//                 }
//                 return true;
//               },
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 controller: dateController.scrollController,
//                 itemCount: dateController.daysInMonth.value,
//                 itemBuilder: (context, index) {
//                   final date = DateTime(
//                     dateController.currentDate.value.year,
//                     dateController.currentDate.value.month,
//                     index + 1,
//                   );
//                   final isSelected = date.day == dateController.selectedDay.value;
                  
//                   return GestureDetector(
//                     onTap: () => dateController.selectDay(date.day),
//                     child: AnimatedContainer(
//                       duration: Duration(milliseconds: 200),
//                       width: isSelected ? 60 : 50,
//                       margin: EdgeInsets.symmetric(horizontal: 5),
//                       decoration: BoxDecoration(
//                         color: isSelected ? Color(0xFFE74C3C) : Color(0xFFD3D3D3),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Center(
//                         child: AnimatedDefaultTextStyle(
//                           duration: Duration(milliseconds: 200),
//                           style: TextStyle(
//                             color: isSelected ? Colors.white : Colors.black,
//                             fontSize: isSelected ? 22 : 18,
//                             fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//                           ),
//                           child: Text('${date.day}'),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             )),
//           ),
//         ],
//       ),
//     );
//   }


//   class DateController extends GetxController {
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

// }



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/DateController.dart';
import 'easytimelineUI.dart';

// class DateSelectorScreen extends StatelessWidget {
//   final DateController controller = Get.put(DateController());

//   DateSelectorScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Date Picker UI")),
//       body: Column(
//         children: [
//           Obx(() => Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconButton(
//                       onPressed: controller.previousMonth,
//                       icon: const Icon(Icons.arrow_left),
//                     ),
//                     Row(
//                       children: [
//                         const Icon(Icons.calendar_today_outlined),
//                         const SizedBox(width: 8),
//                         Text(
//                           DateFormat('MMMM yyyy').format(controller.selectedDate.value),
//                           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                     IconButton(
//                       onPressed: controller.nextMonth,
//                       icon: const Icon(Icons.arrow_right),
//                     ),
//                   ],
//                 ),
//               )),
//           Obx(
//             () => SizedBox(
//               height: 70,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: controller.currentDates.length,
//                 itemBuilder: (context, index) {
//                   final date = controller.currentDates[index];
//                   final isSelected = DateFormat('yyyy-MM-dd').format(controller.selectedDate.value) ==
//                       DateFormat('yyyy-MM-dd').format(date);

//                   return GestureDetector(
//                     onTap: () => controller.updateDate(date),
//                     child: AnimatedContainer(
//                       duration: const Duration(milliseconds: 300),
//                       margin: const EdgeInsets.symmetric(horizontal: 4),
//                       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//                       decoration: BoxDecoration(
//                         color: isSelected ? Colors.red : Colors.grey.shade300,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Center(
//                         child: Text(
//                           DateFormat('d').format(date),
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: isSelected ? Colors.white : Colors.black,
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


class DateSelectorScreen extends StatelessWidget {
  final DateController controller = Get.put(DateController());

  DateSelectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(
      viewportFraction: 0.33,
      initialPage: controller.selectedIndex,
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Date Picker UI")),
      body: Column(
        children: [
          Obx(() => Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.previousMonth();
                        Future.delayed(const Duration(milliseconds: 200), () {
                          pageController.jumpToPage(controller.selectedIndex);
                        });
                      },
                      icon: const Icon(Icons.arrow_left),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today_outlined),
                        const SizedBox(width: 8),
                        Text(
                          DateFormat('MMMM yyyy').format(controller.selectedDate.value),
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        controller.nextMonth();
                        Future.delayed(const Duration(milliseconds: 200), () {
                          pageController.jumpToPage(controller.selectedIndex);
                        });
                      },
                      icon: const Icon(Icons.arrow_right),
                    ),
                  ],
                ),
              )),
          Obx(() {
            final dates = controller.currentDates;

            return SizedBox(
              height: 100,
              child: PageView.builder(
                itemCount: dates.length,
                controller: pageController,
                onPageChanged: (index) {
                  controller.updateDate(dates[index]);
                },
                itemBuilder: (context, index) {
                  final date = dates[index];
                  final isSelected = DateFormat('yyyy-MM-dd').format(date) ==
                      DateFormat('yyyy-MM-dd').format(controller.selectedDate.value);

                  return Center(
                    child: GestureDetector(
                      onTap: () {
                        controller.updateDate(date);
                        pageController.jumpToPage(index);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.red : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: Colors.red.withOpacity(0.4),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  )
                                ]
                              : [],
                        ),
                        child: Center(
                          child: Text(
                            DateFormat('d').format(date),
                            style: TextStyle(
                              fontSize: isSelected ? 20 : 14,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }),
          Easytimelineui()
        ],
      ),
    );
  }
}