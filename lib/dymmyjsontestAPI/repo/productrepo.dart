import 'dart:convert';
import 'package:apppreacticeall/dymmyjsontestAPI/model/categoryProductModel.dart';
import 'package:apppreacticeall/e-commercefacke/baseUrl/apiBaseUrl.dart';
import 'package:apppreacticeall/serverhepler/apihelperserver.dart';

class DummyJsonProductRepo {
  final Apihelperserver apihelperserver = Apihelperserver();

  Future<DummyProductModel?> getDummyData() async {
    final String url = Apibaseurl.DummyJsonURL;
    print("Fetching from: $url");

    try {
      final response = await apihelperserver.getAPI(url);
      final jsonMap = jsonDecode(response.body) as Map<String, dynamic>;
      final data = DummyProductModel.fromJson(jsonMap);
      print("Fetched product count: ${data.products?.length ?? 0}");
      return data;
    } catch (e) {
      print("Error fetching dummy data: $e");
      return null;
    }
  }
}
