import 'dart:convert';

import 'package:wspieramprzyrode/datamodels/inventory_object.dart';
import 'package:http/http.dart' as http;

class InventoryService {
  String url = 'https://api-dev.wspieramprzyrode.pl/v1/inventory';
  http.BaseClient client = http.Client();

  // TODO refactor to use Retrofit - https://pub.dev/packages/retrofit
  Future<List<InventoryObject>> getObjects() async {
    final endpoint = '$url/objects';
    print('GET $endpoint');

    final response = await client.get(endpoint);
    if (response.statusCode == 200) {
      try {
        final decodedResponse = json.decode(response.body) as List;
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
}
