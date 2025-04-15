import 'dart:convert';
import 'package:apppreacticeall/dymmyjsontestAPI/model/categoryProductModel.dart';
import 'package:apppreacticeall/e-commercefacke/baseUrl/apiBaseUrl.dart';
import 'package:apppreacticeall/serverhepler/apihelperserver.dart';

class DummyJsonProductRepo {
  final Apihelperserver apihelperserver = Apihelperserver();

  Future<DummyProductModel?> getDummyData() async {
    final String url = Apibaseurl.DummyJsonURL;
    try {
      final response = await apihelperserver.getAPI(url);
      return DummyProductModel.fromJson(response);
    } catch (e) {
      print("Error fetching dummy data: $e");
      return null;
    }
  }
}
