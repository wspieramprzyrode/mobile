import 'dart:convert';

import 'package:wspieramprzyrode/datamodels/inventory_object.dart';
import 'package:http/http.dart' as http;

class InventoryService {
  String url = 'https://api-dev.wspieramprzyrode.pl/v1/inventory';
  http.BaseClient client = http.Client();
  Future<List<InventoryObject>> getObjects() async {
    // TODO: remove it
    print("request to api");
    final response = await client.get("$url/objects");
    if (response.statusCode == 200) {
      var parsedResponse = json.decode(response.body);
      List<InventoryObject> objects = List<InventoryObject>();
      parsedResponse.forEach((object) {
        objects.add(InventoryObject.fromJson(object));
      });
      return objects;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
