import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/date2.dart';

class DatePickerCarousel extends StatelessWidget {
  const DatePickerCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final DatePickerController controller = Get.put(DatePickerController());

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Main row with proper spacing between elements
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Month and year header with navigation
                  Obx(() => _buildMonthYearHeader(controller)),

                  // Date carousel
                  Obx(() => _buildDateCarousel(controller)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMonthYearHeader(DatePickerController controller) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Previous month button
        IconButton(
          icon: const Icon(Icons.chevron_left, size: 20),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: controller.previousMonth,
        ),

        // Small space

        // Month and year display with calendar icon
        Row(
          children: [
            const Icon(Icons.calendar_month, size: 18),
            const SizedBox(width: 2),
            Text(
              DateFormat(
                'MMMM yyyy',
              ).format(controller.displayMonth.value).toUpperCase(),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ],
        ),

        // Small space

        // Next month button
        IconButton(
          icon: const Icon(Icons.chevron_right, size: 20),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: controller.nextMonth,
        ),
      ],
    );
  }

  Widget _buildDateCarousel(DatePickerController controller) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          // Swipe right - go to previous date
          controller.previousDate();
        } else if (details.primaryVelocity! < 0) {
          // Swipe left - go to next date
          controller.nextDate();
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min, // Take only needed space
        children: [
          for (int i = 0; i < controller.visibleDates.length; i++)
            _buildDateContainer(
              controller,
              controller.visibleDates[i],
              i == 1, // is center/selected
            ),
        ],
      ),
    );
  }

  Widget _buildDateContainer(
    DatePickerController controller,
    DateTime date,
    bool isSelected,
  ) {
    return GestureDetector(
      onTap: () => controller.selectDate(date),
      child: Padding(
        padding: const EdgeInsets.only(right: 5),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 1),
          width: isSelected ? 38 : 30,
          height: isSelected ? 38 : 30,
          decoration: BoxDecoration(
            color: isSelected ? Colors.red : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              date.day.toString(),
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: isSelected ? 20 : 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
