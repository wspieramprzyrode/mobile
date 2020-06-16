import 'package:json_annotation/json_annotation.dart';

part 'inventory_object.g.dart';

@JsonSerializable(explicitToJson: true)
class InventoryObject {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'category_id')
  final String categoryId;

  @JsonKey(name: 'coordinates')
  final Coordinates coordinates;

  InventoryObject({this.id, this.categoryId, this.coordinates});

  factory InventoryObject.fromJson(Map<String, dynamic> json) =>
      _$InventoryObjectFromJson(json);

  Map<String, dynamic> toJson() => _$InventoryObjectToJson(this);
}

@JsonSerializable()
class Coordinates {
  @JsonKey(name: 'lat')
  final double latitude;

  @JsonKey(name: 'lng')
  final double longitude;

  Coordinates({this.latitude, this.longitude});

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);
}
