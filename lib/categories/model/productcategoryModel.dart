class Productcategorymodel {
  final int id;
  final String name;
  final String desc;
  final double price;
  final String size;
  final List<String> images;

  Productcategorymodel({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.size,
    required this.images,
  });

  // Method to convert JSON to Productcategorymodel object
  factory Productcategorymodel.fromJson(Map<String, dynamic> json) {
    return Productcategorymodel(
      id: json['id'],
      name: json['name'],
      desc: json['desc'],
      price: json['price'],
      size: json['size'],
      images: List<String>.from(json['images']),
    );
  }

  // Method to convert Productcategorymodel object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'size': size,
      'images': images,
    };
  }
}
