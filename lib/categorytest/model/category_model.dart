class Category {
  final String id;
  final String name;
  final List<Item> items;

  Category({required this.id, required this.name, required this.items});

  factory Category.fromJson(Map<String, dynamic> json) {
    var list = json['items'] as List;
    List<Item> itemsList = list.map((i) => Item.fromJson(i)).toList();

    return Category(
      id: json['id'],
      name: json['name'],
      items: itemsList,
    );
  }
}

class Item {
  final String id;
  final String name;
  final String image;
  final List<Subitem> subitems;

  Item({required this.id, required this.name, required this.image, required this.subitems});

  factory Item.fromJson(Map<String, dynamic> json) {
    var list = json['subitems'] as List;
    List<Subitem> subitemsList = list.map((i) => Subitem.fromJson(i)).toList();

    return Item(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      subitems: subitemsList,
    );
  }
}

class Subitem {
  final String id;
  final String name;
  final String image;
  final List<Subitem> subitems;

  Subitem({required this.id, required this.name, required this.image, required this.subitems});

  factory Subitem.fromJson(Map<String, dynamic> json) {
    var list = json['subitems'] as List?;
    List<Subitem> subitemsList = list != null ? list.map((i) => Subitem.fromJson(i)).toList() : [];

    return Subitem(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      subitems: subitemsList,
    );
  }
}
class SubSubitem {
  final String id;
  final String name;
  final String image;
  final List<Subitem> subitems;

  SubSubitem({required this.id, required this.name, required this.image, required this.subitems});

  factory SubSubitem.fromJson(Map<String, dynamic> json) {
    var list = json['subitems'] as List?;
    List<Subitem> subitemsList = list != null ? list.map((i) => Subitem.fromJson(i)).toList() : [];

    return SubSubitem(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      subitems: subitemsList,
    );
  }
}
