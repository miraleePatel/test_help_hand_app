import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../Routes/routes.dart';
import '../../Utils/app_colors.dart';
import '../../Utils/constants.dart';
import '../../Utils/permission_service.dart';
import '../../Widgets/custom_button.dart';
import '../../Widgets/custom_textformfield_widget.dart';
import '../../Widgets/custom_widget.dart';
import '../../generated/assets.dart';

class AddMemberScreen extends StatefulWidget {
  const AddMemberScreen({super.key});

  @override
  State<AddMemberScreen> createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController aadharController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController reletionshipController = TextEditingController();

  var imageName = ''.obs;
  var imagePath = ''.obs;
  var profileImg = "".obs;
  int age = 0;


  clearData(){
    firstNameController.clear();
    lastNameController.clear();
    dobController.clear();
    aadharController.clear();
    ageController.clear();
    genderController.clear();
    reletionshipController.clear();
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
    print('Selected Date: $selectedDate');
    print('Current Date: $currentDate');
    print('Age: $age');

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// back btn
            CustomWidgets.customBack(),
            /// decline btn
            CustomBorderButton(
              onTap: () {},
              text: "ADD ANOTHER",
            ),
            /// NEXT btn
            CustomButton(
              onTap: () {
                if (firstNameController.text.isEmpty) {
                  errorSnackBar(
                      message: 'Please Enter Your First Name');
                }
                else if (lastNameController.text.isEmpty) {
                  errorSnackBar(
                      message: 'Please Enter Your Last Name');
                }
                else if (dobController.text.isEmpty) {
                  errorSnackBar(
                      message: 'Please Select Date of Birth');
                }
                else if (aadharController.text.isEmpty) {
                  errorSnackBar(message: 'Please Enter Aadhar Number');
                } else if (  imagePath.value.isEmpty &&   imagePath.value == "") {
                  errorSnackBar(message: 'Please Upload Id Image');
                }
                else {
                  Get.toNamed(Routes.ALL_APPLICANT_DETAILS_SCREEN)!.then((value) => clearData());
                }

              },
              height: 5.h,
              width: 35.w,
              text: "NEXT",
            ),

          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: CustomWidgets.text("LETS GET YOUR LOVED  ONE COVERED",
                      color: AppColors.blueLinearColor2,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w800,
                      fontSize: 11.sp)),
              SizedBox(
                height: 4.h,
              ),
              /// firstName
              CustomWidgets.text("First Name *",
                  color: AppColors.textGreyColor,
                  textAlign: TextAlign.center,
                  fontSize: 8.sp),
              CustomTextFormfieldWidget(
                controller: firstNameController,
                imageName: Assets.iconsIconAccount,
                hintText: "Marry",
              ),
              SizedBox(
                height: 1.5.h,
              ),
              /// lastName
              CustomWidgets.text("Last Name *",
                  color: AppColors.textGreyColor,
                  textAlign: TextAlign.center,
                  fontSize: 8.sp),
              CustomTextFormfieldWidget(
                controller: lastNameController,
                imageName: Assets.iconsIconAccount,
                hintText: "Deo",
              ),
              SizedBox(
                height: 1.5.h,
              ),
              /// Dob & Age
              SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomWidgets.text("Date of Birth *",
                            color: AppColors.textGreyColor,
                            textAlign: TextAlign.center,
                            fontSize: 8.sp),
                        CustomTextFormfieldWidget(
                          width: 43.w,
                          controller: dobController,
                          imageName: Assets.iconsIconDob,
                          hintText: "1991/12/08",
                          padding:  const EdgeInsets.only(left: 7),
                          onTap: () {
                            selectDOBdate(context);
                          },
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomWidgets.text("Age *",
                            color: AppColors.textGreyColor,
                            textAlign: TextAlign.center,
                            fontSize: 8.sp),
                        CustomTextFormfieldWidget(
                          width: 43.w,
                          controller: ageController,
                          imageName: Assets.iconsIconCalander,
                          hintText: "30",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              /// Gender
              CustomWidgets.text("Gender *",
                  color: AppColors.textGreyColor,
                  textAlign: TextAlign.center,
                  fontSize: 8.sp),
              CustomTextFormfieldWidget(
                controller: genderController,
                imageName: Assets.iconsIconGender,
                hintText: "male",
           scale: 1.5,
              ),
              SizedBox(
                height: 1.5.h,
              ),
              /// Relationship
              CustomWidgets.text("Relationship *",
                  color: AppColors.textGreyColor,
                  textAlign: TextAlign.center,
                  fontSize: 8.sp),
              CustomTextFormfieldWidget(
                controller: reletionshipController,
                imageName: Assets.iconsIconRelationship,
                hintText: "Spouse",
                scale: 1.5,
              ),
              SizedBox(
                height: 1.5.h,
              ),
              /// Aadhar Number
              CustomWidgets.text("Aadhar Number",
                  color: AppColors.textGreyColor,
                  textAlign: TextAlign.center,
                  fontSize: 8.sp),
              CustomTextFormfieldWidget(
                controller: aadharController,
                imageName: Assets.iconsIconAccount,
                hintText: "1234 1234 1234",
              ),
              SizedBox(
                height: 5.h,
              ),

              /// upload id
              Center(
                  child: CustomWidgets.text("UPLOAD ID",
                      color: AppColors.blueLinearColor2,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w800,
                      fontSize: 11.sp)),
              SizedBox(
                height: 2.h,
              ),
              GestureDetector(
                onTap: () {
                  uploadIdImage(context);
                },
                child: Obx(() {
                  return Center(
                    child: Container(
                      height: 23.h,
                      width: 37.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.greenLinearColor2, width: 2),
                          borderRadius: BorderRadius.circular(10),
                          image:imagePath.value != "" ?
                          DecorationImage(image:FileImage(File(imagePath.value)) ,fit: BoxFit.fill,)
                              :  DecorationImage(image:AssetImage(Assets.imagesUploadDefault,
                          ),scale: 2,)
                      ),

                    ),
                  );
                }),
              ),
              SizedBox(
                height: 3.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// upload Image
  void uploadIdImage(context) {
    showModalBottomSheet(
        context: context,
        // backgroundColor: AppColors.bgColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(7),
          ),
        ),
        builder: (BuildContext bc) {
          return Builder(builder: (context) {
            return SafeArea(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: const Icon(
                        Icons.photo_library,
                        color: AppColors.blueLinearColor2,
                      ),
                      title: CustomWidgets.text(
                          'Photo Library', color: AppColors.blueLinearColor2),
                      onTap: () async {
                        imagePath.value = "";
                        await PermissionHandlerPermissionService
                            .handlePhotosPermission(context).then((
                            bool galleryPermission) async {
                          if (galleryPermission == true) {
                            await openImagePicker(
                                ImageSource.gallery).then((value) async {
                              if (value.path!.isNotEmpty || value.path != "") {
                                imageName.value = value.path
                                    .split("/")
                                    .last;
                                imagePath.value =
                                    value.path;
                              }

                            });
                          }
                        });
                        Get.back();
                      }),
                  ListTile(
                      leading: const Icon(
                        Icons.photo_camera,
                        color: AppColors.blueLinearColor2,
                      ),
                      title: CustomWidgets.text(
                          'Camera', color: AppColors.blueLinearColor2),
                      onTap: () async {
                        Platform.isIOS
                            ? await openImagePicker(
                            ImageSource.camera).then((value) async {
                          if (value.path.isNotEmpty || value.path != "") {
                            imageName.value = value.path
                                .split("/")
                                .last;
                            imagePath.value = value.path;
                          }

                        })
                            : await PermissionHandlerPermissionService
                            .handleCameraPermission(context).then((
                            bool cameraPermission) async {
                          if (cameraPermission == true) {
                            await openImagePicker(
                                ImageSource.camera).then((value) async {
                              if (value.path.isNotEmpty || value.path != "") {
                                imageName.value = value.path
                                    .split("/")
                                    .last;
                                imagePath.value =
                                    value.path;
                              }

                            });
                          }
                        });
                        Get.back();
                      }),
                ],
              ),
            );
          });
        });
  }
}
