// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controller/CategoryController.dart';
// import '../controller/product_controller.dart';

// class SearchProductPage extends StatelessWidget {
//   final ProductController productController = Get.find<ProductController>();
//   final CategoryCont categoryCont = Get.put(CategoryCont());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Search Products")),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: TextField(
//               controller: productController.searchController,
//               onChanged: (value) {
//                 productController.searchProduct(value);
//               },
//               decoration: InputDecoration(
//                 hintText: "Search...",
//                 prefixIcon: Icon(Icons.search),
//                 suffixIcon: IconButton(
//                   icon: Icon(Icons.close),
//                   onPressed: () {
//                     productController.searchController.clear();
//                     productController.fetchProduct(
//                       productController.filterproduct.value,
//                     ); // default or previously selected
//                   },
//                 ),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Obx(() {
//               return ListView.builder(
//                 itemCount: productController.productList.length,
//                 itemBuilder: (context, index) {
//                   var product = productController.productList[index];
//                   return ListTile(
//                     leading: Image.network(
//                       product.image.toString(),
//                       height: 50,
//                       width: 50,
//                       fit: BoxFit.contain,
//                     ),
//                     title: Text(product.title.toString()),
//                     subtitle: Text("\$${product.price}"),
//                   );
//                 },
//               );
//             }),
//           ),
//         ],
//       ),
//     );
//   }
// }
