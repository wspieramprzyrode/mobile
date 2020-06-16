// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InventoryObject _$InventoryObjectFromJson(Map<String, dynamic> json) {
  return InventoryObject(
    id: json['id'] as String,
    categoryId: json['category_id'] as String,
    coordinates: json['coordinates'] == null
        ? null
        : Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InventoryObjectToJson(InventoryObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_id': instance.categoryId,
      'coordinates': instance.coordinates?.toJson(),
    };

Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) {
  return Coordinates(
    latitude: (json['lat'] as num)?.toDouble(),
    longitude: (json['lng'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$CoordinatesToJson(Coordinates instance) =>
    <String, dynamic>{
      'lat': instance.latitude,
      'lng': instance.longitude,
    };
