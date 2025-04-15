import 'package:apppreacticeall/e-commercefacke/baseUrl/apiBaseUrl.dart';
import 'package:apppreacticeall/serverhepler/apihelperserver.dart';

import '../model/product_model.dart';

class ProductRepo {
  Apihelperserver apihelperserver = Apihelperserver();

  Future<List<ProductModel>> getproduct(String categories) async {
    String url = Apibaseurl.productFullUrl + categories;
    print("ProductUrl===${url}");
    try {
      final response = await apihelperserver.getAPI(url);
      List<dynamic> data = response as List<dynamic>;
      List<ProductModel> products =
          data.map((e) => ProductModel.fromJson(e)).toList();
      return products;
    } on Exception catch (e) {
      print('Error: $e');
      // TODO
      return [];
    }
  }
}
