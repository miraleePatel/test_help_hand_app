import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../Controller/agent_controller.dart';
import '../../Utils/app_colors.dart';
import '../../Widgets/custom_textformfield_widget.dart';
import '../../Widgets/custom_widget.dart';
import '../../generated/assets.dart';

class AgentViewScreen extends StatefulWidget {
  const AgentViewScreen({super.key});

  @override
  State<AgentViewScreen> createState() => _AgentViewScreenState();
}

class _AgentViewScreenState extends State<AgentViewScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController agentCodeController = TextEditingController();

  AgentController agentController = Get.put(AgentController());


  @override
  void initState() {
    // TODO: implement initState
    agentController.getAgentByIDData(id: 3);
    super.initState();
  }

  void clearField() {
    firstNameController.clear();
    lastNameController.clear();
    agentCodeController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: CustomWidgets.text("AGENT DETAILS",
                    color: AppColors.blueLinearColor2,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w800,
                    fontSize: 11.sp)),
            SizedBox(
              height: 4.h,
            ),
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
            SizedBox(
              height: 5.h,
            ),
            /// your plan title
            Container(
              height: 6.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: AppColors.blueLinearColor2),
              alignment: Alignment.center,
              child: CustomWidgets.text("PLAN",
                  color: AppColors.whiteColor, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 2.h,
            ),
            /// main memeber & dob

            Padding(
              padding: const EdgeInsets.only(left: 5,right: 5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomWidgets.text("MAIN MEMBER",
                          color: AppColors.blueLinearColor2,maxLine: 2,
                          fontWeight: FontWeight.w500),
                      SizedBox(
                        width: 7.w,
                      ),
                      CustomWidgets.text("DOB",
                          color: AppColors.blueLinearColor2,
                          fontWeight: FontWeight.w500),
                      Spacer(),
                    ],
                  ),
                  Divider(
                    color: AppColors.testFeildBorder,
                    thickness: 2,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomWidgets.text("John Deo", fontSize: 8.sp),
                      CustomWidgets.text("02/10/1993", fontSize: 8.sp),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                            maxWidth: 100), // Adjust the width as needed
                        child: Wrap(
                          direction: Axis.horizontal,
                          children: [
                            Image.asset(Assets.iconsRemove),
                            Image.asset(Assets.iconsEdit),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 8.h,
                  ),


                  /// Cover Member
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomWidgets.text("MAIN\nMEMBER",
                          color: AppColors.blueLinearColor2,maxLine: 2,
                          fontWeight: FontWeight.w500),
                      SizedBox(
                        width: 8.w,
                      ),
                      CustomWidgets.text("DOB",
                          color: AppColors.blueLinearColor2,
                          fontWeight: FontWeight.w500),
                      SizedBox(
                        width: 20.w,
                      ),
                      CustomWidgets.text("Relationship".toUpperCase(),
                          color: AppColors.blueLinearColor2,
                          fontWeight: FontWeight.w500),
                      Spacer(),
                    ],
                  ),
                  Divider(
                    color: AppColors.testFeildBorder,
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomWidgets.text("John Deo", fontSize: 8.sp),
                      CustomWidgets.text("02/10/1993", fontSize: 8.sp),
                      CustomWidgets.text("Spouse", fontSize: 8.sp),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                            maxWidth: 100), // Adjust the width as needed
                        child: Wrap(
                          direction: Axis.horizontal,
                          children: [
                            Image.asset(Assets.iconsRemove),
                            Image.asset(Assets.iconsEdit),
                          ],
                        ),
                      ),
                    ],
                  ), SizedBox(
                    height: 1.h,
                  ),Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomWidgets.text("John Deo", fontSize: 8.sp),
                      CustomWidgets.text("02/10/1993", fontSize: 8.sp),
                      CustomWidgets.text("Spouse", fontSize: 8.sp),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                            maxWidth: 100), // Adjust the width as needed
                        child: Wrap(
                          direction: Axis.horizontal,
                          children: [
                            Image.asset(Assets.iconsRemove),
                            Image.asset(Assets.iconsEdit),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Divider(
                    color: AppColors.testFeildBorder,
                    thickness: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
