import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Dummyuidata extends StatefulWidget {
  @override
  State<Dummyuidata> createState() => _DummyuidataState();
}

class _DummyuidataState extends State<Dummyuidata> {
  List<String> myCategories = [];
  List<dynamic> productDataList = [];
  bool isLoading = false;
  String selectedCategory = 'All';

  Future<void> fetchCategories() async {
    final url = Uri.parse('https://dummyjson.com/products');
    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> products = jsonDecode(response.body)['products'];
        final Set<String> fetchedCategories = {"All"};
        for (var product in products) {
          fetchedCategories.add(product['category']);
        }

        setState(() {
          myCategories = fetchedCategories.toList();
          isLoading = false;
        });

        // Fetch products after loading categories
        fetchData('All');
      } else {
        print("Failed to load categories");
      }
    } catch (e) {
      print("Error: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> fetchData(String category) async {
    final url = Uri.parse('https://dummyjson.com/products');
    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> products = jsonDecode(response.body)['products'];
        List<dynamic> categoryProducts = [];

        for (var product in products) {
          if (category == 'All' || product['category'] == category) {
            categoryProducts.add(product);
          }
        }

        setState(() {
          productDataList = categoryProducts;
          selectedCategory = category;
          isLoading = false;
        });
      }
    } catch (e) {
      print("Error: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Categories")),
      body: Column(
        children: [
          isLoading && myCategories.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : SizedBox(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: myCategories.length,
                    itemBuilder: (context, index) {
                      final category = myCategories[index];
                      return GestureDetector(
                        onTap: () {
                          fetchData(category);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: category == selectedCategory
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            color: category == selectedCategory
                                ? Colors.amber
                                : Colors.white,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            category,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: category == selectedCategory
                                  ? Colors.white
                                  : const Color.fromARGB(255, 65, 64, 64),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

          // Products Grid
          isLoading
              ? const Expanded(
                  child: Center(child: CircularProgressIndicator()))
              : Expanded(
                  child: GridView.builder(
                    itemCount: productDataList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 220,
                    ),
                    itemBuilder: (context, index) {
                      final product = productDataList[index];
                      return Card(
                        elevation: 2,
                        margin: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              product['thumbnail'] ?? '',
                              height: 100,
                              width: double.infinity,
                              fit: BoxFit.contain,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                product['title'] ?? '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text("₹${product['price']}"),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
