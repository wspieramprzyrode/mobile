import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wspieramprzyrode/datamodels/Invetory_category.dart';
import 'package:wspieramprzyrode/services/api/inventory_service.dart';

class CategoryDropdown extends StatefulWidget {
  final String categoryId;
  const CategoryDropdown({Key key, @required this.categoryId})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => new _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  String dropdownValue;

  @override
  void initState() {
    super.initState();
  }

  void selectData(newValue) {
    setState(() {
      dropdownValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final apis = Provider.of<InventoryService>(context);
    return FutureBuilder<List<InventoryCategory>>(
        future: apis.getCategories(),
        initialData: [],
        builder: (context, categories) {
          Widget w;
          if (categories.connectionState == ConnectionState.done &&
              categories.hasData) {
            w = DropdownButton(
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              underline: Container(
                height: 2,
              ),
              onChanged: (newValue) {
                selectData(newValue);
              },
              items: categories.data.map((InventoryCategory value) {
                return DropdownMenuItem(
                  value: value.id,
                  child: Text(value.name),
                );
              }).toList(),
            );
          } else {
            w = CircularProgressIndicator();
          }
          return w;
        });
  }
}
