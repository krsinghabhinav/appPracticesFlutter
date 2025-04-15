import 'package:flutter/material.dart';
import '../model/category_model.dart';

class SubSubitemPage extends StatelessWidget {
  final List<Subitem> subitems;

  SubSubitemPage({required this.subitems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nested Subitems")),
      body: subitems.isEmpty
          ? Center(child: Text("No further subitems"))
          : ListView.builder(
              itemCount: subitems.length,
              itemBuilder: (context, index) {
                final sub = subitems[index];
                return ListTile(
                  leading: Image.network(sub.image, width: 50),
                  title: Text(sub.name),
                );
              },
            ),
    );
  }
}
