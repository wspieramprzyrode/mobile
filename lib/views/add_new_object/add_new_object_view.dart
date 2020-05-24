import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:wspieramprzyrode/views/add_new_object/add_new_object_content_mobile.dart';

class AddNewObjectView extends StatelessWidget {
  const AddNewObjectView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(mobile: AddNewObjectContentMobile());
  }
}
