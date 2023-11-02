import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import '../../API/dio_api_manager.dart';
import '../../Controller/applicant_controller.dart';
import '../../Routes/routes.dart';
import '../../Utils/app_colors.dart';
import '../../Utils/constants.dart';
import '../../Utils/permission_service.dart';
import '../../Widgets/custom_button.dart';
import '../../Widgets/custom_textformfield_widget.dart';
import '../../Widgets/custom_widget.dart';
import '../../generated/assets.dart';

class ApplicantDetailsScreen extends StatefulWidget {
  const ApplicantDetailsScreen({super.key});

  @override
  State<ApplicantDetailsScreen> createState() => _ApplicantDetailsScreenState();
}

class _ApplicantDetailsScreenState extends State<ApplicantDetailsScreen> {
  ApplicantController applicantController = Get.put(ApplicantController());

  @override
  void dispose() {
    // TODO: implement dispose
    applicantController.clearField();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              /// back btn
              CustomWidgets.customBack(),

              /// accept btn
              CustomButton(
                onTap: () {
                  /* if (applicantController.formKey.currentState!.validate()) {
                    Get.toNamed(Routes.COVER_SECTION_SCREEN)!
                        .then((value) => applicantController.clearField());
                  }
*/

                  if (applicantController.firstNameController.text.isEmpty) {
                    errorSnackBar(
                        message: 'Please Enter Your First Name');
                  }
                  else if (applicantController.lastNameController.text.isEmpty) {
                    errorSnackBar(
                        message: 'Please Enter Your Last Name');
                  }
                  else if (applicantController.dobController.text.isEmpty) {
                    errorSnackBar(
                        message: 'Please Select Date of Birth');
                  }
                  else if (applicantController.aadharController.text.isEmpty) {
                    errorSnackBar(message: 'Please Enter Aadhar Number');
                  } else if (applicantController.mobileController.text.isEmpty) {
                    errorSnackBar(message: 'Please Enter Mobile Number');
                  }else if (  applicantController.imagePath.value.isEmpty &&   applicantController.imagePath.value == "") {
                    errorSnackBar(message: 'Please Upload Id Image');
                  }
                  else {
                    Get.toNamed(Routes.COVER_SECTION_SCREEN)!
                        .then((value) => applicantController.clearField());
                  }
                },
                height: 5.h,
                width: 75.w,
                text: "NEXT",
              ),
              SizedBox()
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
          child: SingleChildScrollView(
            child: Form(
              key: applicantController.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: CustomWidgets.text(
                          "TELL US A LITTLE ABOUT YOURSELF!",
                          color: AppColors.blueLinearColor2,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w800,
                          fontSize: 11.sp)),
                  SizedBox(
                    height: 4.h,
                  ),

                  /// FirstName
                  CustomWidgets.text("First Name *",
                      color: AppColors.textGreyColor,
                      textAlign: TextAlign.center,
                      fontSize: 8.sp),
                  CustomTextFormfieldWidget(
                    controller: applicantController.firstNameController,
                    imageName: Assets.iconsIconAccount,
                    hintText: "Drake",
                    keyboardType: TextInputType.text,
                                    ),
                  SizedBox(
                    height: 1.5.h,
                  ),

                  /// LastName
                  CustomWidgets.text("Last Name *",
                      color: AppColors.textGreyColor,
                      textAlign: TextAlign.center,
                      fontSize: 8.sp),
                  CustomTextFormfieldWidget(
                    controller: applicantController.lastNameController,
                    imageName: Assets.iconsIconAccount,
                    hintText: "Josh",
                    keyboardType: TextInputType.text,
                                   ),
                  SizedBox(
                    height: 1.5.h,
                  ),

                  /// Age & dob
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
                              controller: applicantController.dobController,
                              imageName: Assets.iconsIconDob,
                              hintText: "1991/12/08",
                              padding: const EdgeInsets.only(left: 7),
                              readOnly: true,

                              onTap: () {
                                applicantController.selectDOBdate(context);
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
                              controller: applicantController.ageController,
                              imageName: Assets.iconsIconCalander,
                              hintText: "29",
                              readOnly: true,
                            ),
                          ],
                        ),
                      ],
                    ),
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
                    controller: applicantController.aadharController,
                    imageName: Assets.iconsIconAccount,
                    hintText: "1234 1234 1234",
                    keyboardType: TextInputType.number,
                                   ),

                  SizedBox(
                    height: 1.5.h,
                  ),

                  /// mobile number
                  CustomWidgets.text("Mobile Number *",
                      color: AppColors.textGreyColor,
                      textAlign: TextAlign.center,
                      fontSize: 8.sp),
                  CustomTextFormfieldWidget(
                    controller: applicantController.mobileController,
                    imageName: Assets.iconsIconPhone,
                    hintText: "+91 12345 67890",
                    padding: const EdgeInsets.only(left: 7),
                    keyboardType: TextInputType.number,
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

                  /// upload id image
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
                            image:applicantController.imagePath.value != "" ?
                            DecorationImage(image:FileImage(File(applicantController.imagePath.value)) ,fit: BoxFit.fill,)
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
                        applicantController.imagePath.value = "";
                        await PermissionHandlerPermissionService
                            .handlePhotosPermission(context).then((
                            bool galleryPermission) async {
                          if (galleryPermission == true) {
                            await applicantController.openImagePicker(
                                ImageSource.gallery).then((value) async {
                              if (value.path!.isNotEmpty || value.path != "") {
                                applicantController.imageName.value = value.path
                                    .split("/")
                                    .last;
                                applicantController.imagePath.value =
                                    value.path;
                              }
                              /// send id image in to server
                              DioAPIManager().multiPartRequest(
                                  file: File(applicantController
                                      .imagePath
                                      .toString()));
                              print("Image Name :::: ${applicantController
                                  .imageName}");
                              print("Image Path :::: ${applicantController
                                  .imagePath}");
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
                            ? await applicantController.openImagePicker(
                            ImageSource.camera).then((value) async {
                          if (value.path.isNotEmpty || value.path != "") {
                            applicantController.imageName.value = value.path
                                .split("/")
                                .last;
                            applicantController.imagePath.value = value.path;
                          }
                          /// send id image in to server
                          DioAPIManager().multiPartRequest(
                              file: File(applicantController
                                  .imagePath
                                  .toString()));
                          print(
                              "Image Name :::: ${applicantController
                                  .imageName}");
                          print(
                              "Image Path :::: ${applicantController
                                  .imagePath}");
                        })
                            : await PermissionHandlerPermissionService
                            .handleCameraPermission(context).then((
                            bool cameraPermission) async {
                          if (cameraPermission == true) {
                            await applicantController.openImagePicker(
                                ImageSource.camera).then((value) async {
                              if (value.path.isNotEmpty || value.path != "") {
                                applicantController.imageName.value = value.path
                                    .split("/")
                                    .last;
                                applicantController.imagePath.value =
                                    value.path;
                              }
                              /// send id image in to server
                              DioAPIManager().multiPartRequest(
                                  file: File(applicantController
                                      .imagePath
                                      .toString()));
                              print("Image Name :::: ${applicantController
                                  .imageName}");
                              print("Image Path :::: ${applicantController
                                  .imagePath}");
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
