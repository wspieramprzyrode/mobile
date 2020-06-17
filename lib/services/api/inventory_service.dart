import 'package:retrofit/retrofit.dart';
import 'package:wspieramprzyrode/datamodels/invetory_category.dart';
import 'package:wspieramprzyrode/datamodels/inventory_object.dart';
import 'package:dio/dio.dart';

part 'inventory_service.g.dart';

@RestApi(baseUrl: 'https://api-dev.wspieramprzyrode.pl/v1/inventory/')
abstract class InventoryService {
  factory InventoryService(Dio dio, {String baseUrl}) = _InventoryService;

  @GET('objects')
  Future<List<InventoryObject>> getObjects();

  @GET('categories')
  Future<List<InventoryCategory>> getCategories();
}
