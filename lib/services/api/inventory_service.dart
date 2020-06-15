import 'dart:convert';

import 'package:wspieramprzyrode/datamodels/Invetory_category.dart';
import 'package:wspieramprzyrode/datamodels/inventory_object.dart';
import 'package:dio/dio.dart';
import 'package:wspieramprzyrode/services/api/client.dart';

class InventoryService {
  Dio dio = ApiClient('https://api-dev.wspieramprzyrode.pl/v1/inventory').getApiClient();

  Future<List<InventoryObject>> getObjects() async {
    print('GET $endpoint');
    final response = await dio.get('/objects', options: Options(responseType: ResponseType.plain));
    if (response.statusCode == 200) {
      try {
        final decodedResponse = json.decode(response.data) as List;
        return decodedResponse
            .map((obj) => InventoryObject.fromJson(obj))
            .toList();
      } catch (err) {
        print('GET $endpoint failed to parse response - ${Error.safeToString(err)}');
        return [];
      }
    } else {
      print('GET $endpoint failed with status: ${response.statusCode}.');
      return [];
    }
  }

  Future<List<InventoryCategory>> getCategories() async {
    // TODO: remove it
    print("request to api");
    final response = await dio.get('/categories', options: Options(responseType: ResponseType.plain));
    if (response.statusCode == 200) {
      var parsedResponse = json.decode(response.data);
      List<InventoryCategory> objects = List<InventoryCategory>();
      parsedResponse.forEach((object) {
        objects.add(InventoryCategory.fromJson(object));
      });
      return objects;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
