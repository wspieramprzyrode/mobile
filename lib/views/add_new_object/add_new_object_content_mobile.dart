import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../geolocation/geolocation_service.dart';
import '../../geolocation/gpslocation.dart';
import '../../l10n/l10n.dart';
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
          title: Text(context.appLocalizations.fetchLocation),
          subtitle: Text('Wykonaj jak najblizej obiektu'),
          isActive: true,
          //state: StepState.editing,
          content: RaisedButton(
            onPressed: _getLocation,
            child: Text("Pobierz"),
          )),
      Step(
          title: Text(context.appLocalizations.choicePhoto),
          isActive: true,
          content: Row(
            children: [
              RaisedButton(
                onPressed: takeImage,
                child: Text(context.appLocalizations.takePhoto),
              ),
              Spacer(),
              RaisedButton(
                onPressed: getImage,
                child: Text(context.appLocalizations.photoFromGallery),
              )
            ],
          )),
      Step(
          title: Text(context.appLocalizations.choiceObjectCategory),
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
