import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_hand_app/Utils/constants.dart';
import 'package:sizer/sizer.dart';

import '../../Routes/routes.dart';
import '../../Utils/app_colors.dart';
import '../../Widgets/custom_button.dart';
import '../../Widgets/custom_textformfield_widget.dart';
import '../../Widgets/custom_widget.dart';
import '../../generated/assets.dart';

class AgentDetailsScreen extends StatefulWidget {
  const AgentDetailsScreen({super.key});

  @override
  State<AgentDetailsScreen> createState() => _AgentDetailsScreenState();
}

class _AgentDetailsScreenState extends State<AgentDetailsScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController agentCodeController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  /// Method for clear textfeild
  void clearField() {
    firstNameController.clear();
    lastNameController.clear();
    agentCodeController.clear();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    clearField();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
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
                if(firstNameController.text.isEmpty){
                    errorSnackBar(
                        message: 'Please Enter Your First Name');
                  }
                  else if(lastNameController.text.isEmpty){
                    errorSnackBar(
                        message: 'Please Enter Your Last Name');
                  }
                  else if(agentCodeController.text.isEmpty){
                    errorSnackBar(
                        message: 'Please Enter Agent Code');
                  }
                  else{
                    Get.toNamed(Routes.APPLICANT_DETAILS_SCREEN)!
                        .then((value) => clearField());
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
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// title
                  Center(
                      child: CustomWidgets.text("AGENT DETAILS",
                          color: AppColors.blueLinearColor2,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w800,
                          fontSize: 11.sp)),
                  SizedBox(
                    height: 5.h,
                  ),
                  /// FirstName
                  CustomWidgets.text("First Name *",
                      color: AppColors.textGreyColor,
                      textAlign: TextAlign.center,
                      fontSize: 8.sp),
                  CustomTextFormfieldWidget(
                    controller: firstNameController,
                    imageName: Assets.iconsIconAccount,
                    hintText: "Drake",
                    keyboardType: TextInputType.text,
                            ),
                  SizedBox(
                    height: 2.h,
                  ),
                  /// LastName
                  CustomWidgets.text("Last Name *",
                      color: AppColors.textGreyColor,
                      textAlign: TextAlign.center,
                      fontSize: 8.sp),
                  CustomTextFormfieldWidget(
                    controller: lastNameController,
                    imageName: Assets.iconsIconAccount,
                    hintText: "Josh",
                    keyboardType: TextInputType.text,

                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  /// AgentCode
                  CustomWidgets.text("Agent Code *",
                      color: AppColors.textGreyColor,
                      textAlign: TextAlign.center,
                      fontSize: 8.sp),
                  CustomTextFormfieldWidget(
                    controller: agentCodeController,
                    imageName: Assets.iconsIconAccount,
                    hintText: "G97896",
                    keyboardType: TextInputType.text,

                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
