import 'dart:convert';

import 'package:wspieramprzyrode/datamodels/invetory_category.dart';
import 'package:wspieramprzyrode/datamodels/inventory_object.dart';
import 'package:dio/dio.dart';
import 'package:wspieramprzyrode/services/api/client.dart';

class InventoryService {
  Dio dio = ApiClient('https://api-dev.wspieramprzyrode.pl/v1/inventory')
      .getApiClient();

  Future<List<InventoryObject>> getObjects() async {
    final response = await dio.get(
      '/objects',
      options: Options(responseType: ResponseType.plain),
    );
    if (response.statusCode == 200) {
      try {
        final decodedResponse = json.decode(response.data as String) as List;
        return decodedResponse
            .map((obj) => InventoryObject.fromJson(obj as Map<String, dynamic>))
            .toList();
      } catch (err) {
        return [];
      }
    } else {
      return [];
    }
  }

  Future<List<InventoryCategory>> getCategories() async {
    final response = await dio.get(
      '/categories',
      options: Options(responseType: ResponseType.plain),
    );
    if (response.statusCode == 200) {
      try {
        final decodedResponse = json.decode(response.data as String) as List;
        return decodedResponse
            .map((obj) => InventoryCategory.fromJson(obj as Map<String, dynamic>))
            .toList();
      } catch (err) {
        return [];
      }
    } else {
      return [];
    }
  }
}
