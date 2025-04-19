import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controller/day3.dart';
import 'ClassScheduleScreen.dart';
import 'easytimelineUI.dart';

class Uiday3 extends StatelessWidget {
  const Uiday3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Day3Controller controller = Get.put(Day3Controller());

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Month-Year Header
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.chevron_left, size: 20),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: controller.previouseMonth,
                        ),
                        const Icon(Icons.calendar_month, size: 18),
                        const SizedBox(width: 2),
                        Text(
                          DateFormat(
                            'MMMM yyyy',
                          ).format(controller.selectedDate.value).toUpperCase(),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.chevron_right, size: 20),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: controller.nextMonth,
                        ),
                      ],
                    ),

                    // Date carousel
                    GestureDetector(
                      onHorizontalDragEnd: (details) {
                        if (details.primaryVelocity! > 0) {
                          //Right swipe (user ne right ki taraf swipe kiya)
                          controller.previousDate();
                        } else if (details.primaryVelocity! < 0) {
                          //Left swipe (user ne left ki taraf swipe kiya)
                          controller.nextDate();
                        }
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          controller.visibleDates().length,
                          (i) {
                            final date = controller.visibleDates()[i];
                            final isSelected = i == 1;

                            return GestureDetector(
                              onTap: () => controller.selectdDate(date),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 1,
                                  ),
                                  width: isSelected ? 38 : 30,
                                  height: isSelected ? 38 : 30,
                                  decoration: BoxDecoration(
                                    color:
                                        isSelected
                                            ? Colors.red
                                            : Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text(
                                      date.day.toString(),
                                      style: TextStyle(
                                        color:
                                            isSelected
                                                ? Colors.white
                                                : Colors.black,
                                        fontSize: isSelected ? 20 : 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Easytimelineui(),
              SizedBox(height: 10),
              ClassScheduleScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
