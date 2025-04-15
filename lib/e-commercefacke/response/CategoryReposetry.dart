import 'package:apppreacticeall/e-commercefacke/baseUrl/apiBaseUrl.dart';
import 'package:apppreacticeall/e-commercefacke/model/category_model.dart';
import 'package:apppreacticeall/serverhepler/apihelperserver.dart';
import 'package:get/get.dart';

class Categoryreposetry {
  Apihelperserver apihelperserver = Apihelperserver();

  // Method to get categories
  Future<List<CategoryModel>> getcategory() async {
    // Concatenate the base URL with the category endpoint
    try {
      String url = Apibaseurl.categoryFullUrl;
      print("url===$url");
      // Fetch data from the API
      final response = await apihelperserver.getAPI(url);
      print("response===${response}");
      List<dynamic> data = response as List<dynamic>;
      List<CategoryModel> categoryData =
          data.map((e) => CategoryModel.fromString(e)).toList();
      return categoryData;
    } on Exception catch (e) {
      print("Error fetching categories: $e");
      // TODO
      return [];
    }
  }
}
