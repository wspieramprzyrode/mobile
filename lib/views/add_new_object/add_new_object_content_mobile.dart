import 'package:flutter/material.dart';

class AddNewObjectContentMobile extends StatefulWidget {
  const AddNewObjectContentMobile({Key key}) : super(key: key);
  @override
  _AddNewObjectContentMobileState createState() =>
      new _AddNewObjectContentMobileState();
}

class _AddNewObjectContentMobileState extends State<AddNewObjectContentMobile> {
  int currStep = 0;
  static var _focusNode = new FocusNode();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void _getLocation() {
    }

    List<Step> steps = [
      new Step(
          title: const Text('Pobierz lokalizację'),
          subtitle: const Text('Wykonaj jak najblizej obiektu'),
          isActive: true,
          //state: StepState.editing,
          state: StepState.indexed,
          content: new RaisedButton(
            child: new Text("Pobierz"),
            onPressed: _getLocation,
          )),
      new Step(
          title: const Text('Zrób zdjęcie'),
          isActive: true,

          state: StepState.indexed,
          content: new RaisedButton(
            child: new Text("Wykonaj zdjęcie"),
            onPressed: _getLocation,
          )),
      new Step(
          title: const Text('Wybierz typ'),
          isActive: true,
          state: StepState.indexed,
          content: new RaisedButton(
            child: new Text("dd"),
            onPressed: _getLocation,
          ))
    ];

    return Container(
        child: new Form(
      key: _formKey,
      child: new ListView(children: <Widget>[new Stepper(steps: steps)]),
    ));
  }
}
