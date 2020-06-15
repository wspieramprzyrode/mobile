class InventoryObject {
  final String id;
  final String categoryId;
  final Coordinates coordinates;

  InventoryObject({this.id, this.categoryId, this.coordinates});
  factory InventoryObject.fromJson(Map<String, dynamic> json) {
    return InventoryObject(
      id: json['id'] as String,
      categoryId: json['category_id'] as String,
      coordinates: Coordinates.fromJson(json['coordinates']),
    );
  }
}

class Coordinates {
  final double latitude;
  final double longitude;
  Coordinates({this.latitude, this.longitude});
  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      latitude: json['lat'] as double,
      longitude: json['lng'] as double,
    );
  }
}
