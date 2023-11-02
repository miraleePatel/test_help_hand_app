import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ApplicantController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController aadharController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var imageName = ''.obs;
  var imagePath = ''.obs;
  var profileImg = "".obs;
  int age = 0;

  void clearField() {
    firstNameController.clear();
    lastNameController.clear();
    dobController.clear();
    aadharController.clear();
    ageController.clear();
    mobileController.clear();
    imagePath.value = "";
  }

  selectDOBdate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2050));

    if (pickedDate != null) {
      dobController.text = DateFormat('MM/dd/yyyy').format(pickedDate);
      calculateAge(pickedDate);
    }
  }

  /// calculte age
  int calculateAge(DateTime selectedDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - selectedDate.year;

    if (currentDate.month < selectedDate.month ||
        (currentDate.month == selectedDate.month &&
            currentDate.day < selectedDate.day)) {
      age--;
    }
    ageController.text = age.toString();
    if (kDebugMode) {
      print('Selected Date: $selectedDate');
      print('Current Date: $currentDate');
      print('Age: $age');
    }

    return age;
  }

  /// Image Picker
  Future<File> openImagePicker(ImageSource sourceData) async {
    XFile? xFile = await ImagePicker().pickImage(
      source: sourceData,
      requestFullMetadata: true,
    );
    return File(xFile!.path);
  }
}
