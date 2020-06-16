class InventoryCategory {
  final String id;
  final String name;

  InventoryCategory({this.id, this.name});

  factory InventoryCategory.fromJson(Map<String, dynamic> json) {
    return InventoryCategory(
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }
}
