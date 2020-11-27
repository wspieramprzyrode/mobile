import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../i18n/localization.dart';
import '../../services/geolocation/geolocation_service.dart';
import '../../services/geolocation/gpslocation.dart';
import '../../widgets/category_dropdown/category_dropdown.dart';

class AddNewObjectContentMobile extends StatefulWidget {
  const AddNewObjectContentMobile({Key key}) : super(key: key);

  @override
  _AddNewObjectContentMobileState createState() =>
      _AddNewObjectContentMobileState();
}

class _AddNewObjectContentMobileState extends State<AddNewObjectContentMobile> {
  GeolocationService geolocation;
  int currStep = 0;
  static final _focusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // File _image;
  String categoryId;
  final picker = ImagePicker();

  Future getImage() async {
    // final pickedFile = await picker.getImage(source: ImageSource.gallery);

    // setState(() {
    // _image = File(pickedFile.path);
    // });
  }

  Future takeImage() async {
    // final pickedFile = await picker.getImage(source: ImageSource.camera);

    // setState(() {
    // _image = File(pickedFile.path);
    // });
  }

  Future<void> _getLocation() async {
    final position = await geolocation.getUserLocation();
    setState(() {
      userLocation = position;
    });
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  GpsLocation userLocation;

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    geolocation = Provider.of<GeolocationService>(context);
    final List<Step> steps = [
      Step(
          title: Text(AppLocalization.fetchLocation),
          subtitle: Text('Wykonaj jak najblizej obiektu'),
          isActive: true,
          //state: StepState.editing,
          content: RaisedButton(
            onPressed: _getLocation,
            child: Text("Pobierz"),
          )),
      Step(
          title: Text(AppLocalization.choicePhoto),
          isActive: true,
          content: Row(
            children: [
              RaisedButton(
                onPressed: takeImage,
                child: Text(AppLocalization.takePhoto),
              ),
              Spacer(),
              RaisedButton(
                onPressed: getImage,
                child: Text(AppLocalization.photoFromGallery),
              )
            ],
          )),
      Step(
          title: Text(AppLocalization.choiceObjectCategory),
          isActive: true,
          content: CategoryDropdown(categoryId: categoryId))
    ];

    return Form(
      key: _formKey,
      child: ListView(children: <Widget>[
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
              //     .showSnackBar(SnackBar(content: Text('$currStep')));

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
    );
  }
}
