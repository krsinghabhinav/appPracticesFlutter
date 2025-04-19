import 'package:apppreacticeall/date/controller/easytimelinecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

// class Easytimelineui extends StatefulWidget {
//   const Easytimelineui({super.key});

//   @override
//   State<Easytimelineui> createState() => _EasytimelineuiState();
// }

// class _EasytimelineuiState extends State<Easytimelineui> {
//   Easytimelinecontroller controller = Get.put(Easytimelinecontroller());

//   ScrollController scrollController = ScrollController();

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     scrollController.addListener(() {
//       if (scrollController.position.pixels >=
//           scrollController.position.maxScrollExtent - 100) {
//         controller.laodMonthWithYear();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Easy Timeline UI')),
//       body: Obx(
//         () => ListView.builder(
//           controller: scrollController,
//           scrollDirection: Axis.horizontal,
//           itemCount: controller.items.length,
//           itemBuilder: (context, index) {
//             final data = controller.items[index];
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Chip(label: Text(data)),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }


// class scrollController.addListener(...)
// ➤ Scroll hone par ye listener baar-baar chalega.

// scrollController.position.pixels
// ➤ Ye bataata hai user ne kitna scroll kiya (kitne pixels tak).

// scrollController.position.maxScrollExtent
// ➤ Ye total scrollable area ka end point hai (max value).

// >= maxScrollExtent - 100
// ➤ Matlab: Agar user end ke kareeb pahuch gaya (100 pixels ke andar)...

// controller.laodMonthWithYear();
// ➤ Tab naye months (next year ke) list mein add karo. 


 class Easytimelineui     extends StatefulWidget {
  const Easytimelineui({super.key});

  @override
  State<Easytimelineui> createState() => _EasytimelineuiState();
}

class _EasytimelineuiState extends State<Easytimelineui> {
  final Easytimelinecontroller controller = Get.put(Easytimelinecontroller());
  final ScrollController scrollController = ScrollController();



// scrollController.addListener(...)
// ➤ Scroll hone par ye listener baar-baar chalega.

// scrollController.position.pixels
// ➤ Ye bataata hai user ne kitna scroll kiya (kitne pixels tak).

// scrollController.position.maxScrollExtent
// ➤ Ye total scrollable area ka end point hai (max value).

// >= maxScrollExtent - 100
// ➤ Matlab: Agar user end ke kareeb pahuch gaya (100 pixels ke andar)...

// controller.laodMonthWithYear();
// ➤ Tab naye months (next year ke) list mein add karo.


  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 100) {
        controller.laodMonthWithYear();
      }
    });

    // // Scroll to current month after short delay
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   int indexToScroll = controller.currentMonth - 1; // zero-based index
    //   scrollController.animateTo(
    //     indexToScroll * 80.0, // Approximate width of chip + padding
    //     duration: Duration(milliseconds: 500),
    //     curve: Curves.easeInOut,
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
        () => SizedBox(
          height: 60,
          child: ListView.builder(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: controller.items.length,
            itemBuilder: (context, index) {
              final data = controller.items[index];
              final isCurrentMonth = index == controller.currentMonth - 1;
          
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Chip(
                  label: Text(
                    data,
                    style: TextStyle(
                      color: isCurrentMonth ? Colors.white : Colors.black,
                    ),
                  ),
                  backgroundColor:
                      isCurrentMonth ? Colors.red : Colors.grey[300],
                ),
              );
            },
          ),
        ),
      
    );
  }
}
