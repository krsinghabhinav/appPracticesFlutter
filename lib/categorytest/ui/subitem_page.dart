import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/category_model.dart';
import 'subsubitem_page.dart';

class SubitemPage extends StatelessWidget {
  final List<Subitem> subitems;

  SubitemPage({required this.subitems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Subitems")),
      body: ListView.builder(
        itemCount: subitems.length,
        itemBuilder: (context, index) {
          final sub = subitems[index];
          return ListTile(
            leading: Image.network(sub.image, width: 50),
            title: Text(sub.name),
            onTap: () {
              Get.to(() => SubSubitemPage(subitems: sub.subitems));
            },
          );
        },
      ),
    );
  }
}
