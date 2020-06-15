import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:wspieramprzyrode/services/geolocation_service.dart';
import 'package:wspieramprzyrode/widgets/category_dropdown/category_dropdown.dart';

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
  File _image;
  GeolocationService geolocation;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }
  Future takeImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  void _getLocation() async {
    final position = await geolocation.getUserLocation();
    setState(() {
      userLocation = position;
    });
    print(userLocation);
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  Position userLocation;
  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    geolocation = Provider.of<GeolocationService>(context);
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
          content: Row(
            children: [
              RaisedButton(
                child: new Text("Wykonaj zdjęcie"),
                onPressed: takeImage,
              ),
               Spacer(),
              RaisedButton(
                child: new Text("Wybierz z galerii"),
                onPressed: getImage,
              )
            ],
          )),
      new Step(
          title: const Text('Wybierz typ'),
          isActive: true,
          state: StepState.indexed,
          content: CategoryDropdown()),////
    ];

    return Container(
        child: new Form(
      key: _formKey,
      child: new ListView(children: <Widget>[
        Stepper(
          steps: steps,
          currentStep: currStep,
          onStepContinue: () {
            setState(() {
              if (currStep < steps.length - 1) {
                currStep = currStep + 1;
              } else {
                currStep = 0;
              }
              // else {
              // Scaffold
              //     .of(context)
              //     .showSnackBar(new SnackBar(content: new Text('$currStep')));

              // if (currStep == 1) {
              //   print('First Step');
              //   print('object' + FocusScope.of(context).toStringDeep());
              // }

              // }
            });
          },
          onStepCancel: () {
            setState(() {
              if (currStep > 0) {
                currStep = currStep - 1;
              } else {
                currStep = 0;
              }
            });
          },
          onStepTapped: (step) {
            setState(() {
              currStep = step;
            });
          },
        )
      ]),
    ));
  }
}
