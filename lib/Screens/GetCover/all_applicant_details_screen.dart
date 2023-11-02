import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../Routes/routes.dart';
import '../../Utils/app_colors.dart';
import '../../Widgets/custom_button.dart';
import '../../Widgets/custom_widget.dart';
import '../../generated/assets.dart';

class AllApplicantDetailsScreen extends StatefulWidget {
  const AllApplicantDetailsScreen({super.key});

  @override
  State<AllApplicantDetailsScreen> createState() =>
      _AllApplicantDetailsScreenState();
}

class _AllApplicantDetailsScreenState extends State<AllApplicantDetailsScreen> {
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

            /// accept btn
            CustomButton(
              onTap: () {
                // Get.toNamed(Routes.ALL_APPLICANT_DETAILS_SCREEN);
              },
              height: 5.h,
              width: 35.w,
              text: "Let’s Do It".toUpperCase(),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: CustomWidgets.text("QUOTE SUMMARY",
                      color: AppColors.blueLinearColor2,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w800,
                      fontSize: 11.sp)),
              SizedBox(
                height: 4.h,
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
                child: CustomWidgets.text("YOUR PLAN",
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
      ),
    );
  }
}
