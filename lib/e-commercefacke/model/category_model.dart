// class CategoryModel {
//   final String name;
//   CategoryModel({required this.name});
// }

class CategoryModel  {
  final String name;

  CategoryModel({required this.name});

  factory CategoryModel.fromString(String name) {
    return CategoryModel(name: name);
  }
}
