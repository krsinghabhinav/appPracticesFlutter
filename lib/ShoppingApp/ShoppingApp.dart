import 'package:flutter/material.dart';

class ProductModel {
  final String name;
  final String image;
  final double price;

  ProductModel({required this.name, required this.image, required this.price});
}

class ProductScreen extends StatefulWidget {
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<ProductModel> productList = [
    ProductModel(
      name: "Shoes",
      image: "https://via.placeholder.com/150",
      price: 999,
    ),
    ProductModel(
      name: "Watch",
      image: "https://via.placeholder.com/150",
      price: 1499,
    ),
    ProductModel(
      name: "T-Shirt",
      image: "https://via.placeholder.com/150",
      price: 499,
    ),
  ];

  List<ProductModel> cartList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping App"),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  // Navigate to cart or show dialog
                },
              ),
              if (cartList.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      "${cartList.length}",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          final product = productList[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Image.network(product.image, width: 50, height: 50),
              title: Text(product.name),
              subtitle: Text("₹${product.price}"),
              trailing: ElevatedButton(
                onPressed: () {
                  setState(() {
                    cartList.add(product);
                    // Add product to cart
                    print("add===${cartList}");
                  });
                },
                child: Text("Add"),
              ),
            ),
          );
        },
      ),
    );
  }
}
