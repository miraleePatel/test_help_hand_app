import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../Routes/routes.dart';
import '../../Utils/app_colors.dart';
import '../../Widgets/custom_button.dart';
import '../../Widgets/custom_widget.dart';
import '../../generated/assets.dart';

class CoverSectionScreen extends StatefulWidget {
  const CoverSectionScreen({super.key});

  @override
  State<CoverSectionScreen> createState() => _CoverSectionScreenState();
}

class _CoverSectionScreenState extends State<CoverSectionScreen> {

   List<CoverModel> coverList = [
    CoverModel(
      title: 'Spouse / Life Partner',
      image:   Assets.imagesLifepartner,
    ),
    CoverModel(
      title: 'Children Under 21',
      image:   Assets.imagesChildren,
    ),
    CoverModel(
      title: 'Parents / Grandparents',
      image:    Assets.imagesParents,
    ),
    CoverModel(
      title:  'Not Covering Anyone Else',
      image:  "",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Get.toNamed(Routes.ADD_MEMBER_SCREEN);
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: CustomWidgets.text("WHO ELSE WOULD YOU LIKE TO COVER?",
                      color: AppColors.blueLinearColor2,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w800,
                      fontSize: 11.sp)),
              SizedBox(
                height: 2.h,
              ),
              Center(
                  child: CustomWidgets.text("COVER UP TO 6 PEOPLE",
                      color: AppColors.greenLinearColor2,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w700,
                      fontSize: 9.sp)),
              SizedBox(
                height: 2.h,
              ),
              GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: coverList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 30.h,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
               return Container(
               alignment: Alignment.center,
                 decoration: BoxDecoration(
                     border: Border.all(
                         color: AppColors.testFeildBorder,
                         width: 2
                     ),
                     borderRadius: BorderRadius.circular(10)
                 ),
                 padding: EdgeInsets.only(bottom: 20),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     coverList[index].image == "" ? SizedBox(height: 5.h,) : SizedBox(),
                    Center(child: CustomWidgets.text(coverList[index].title.toString(),textAlign: TextAlign.center)),
                     coverList[index].image != "" ?
                     Image.asset(coverList[index].image!,scale: 2,) : SizedBox.shrink(),
                     Container(
                  height:  5.5.h,
                  width: double.infinity,
                  margin: EdgeInsets.only(right: 25,left: 25),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                  gradient:
                  LinearGradient(
                    colors: [
                      AppColors.greenLinearColor2,
                      AppColors.greenLinearColor1,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(25),
                  ),
                  child: CustomWidgets.text( coverList[index].image == "" ? "SKIP" : "+ ADD",color: AppColors.whiteColor,fontWeight: FontWeight.w700),)
                   ],
                 ),
               );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

}

class CoverModel{
String? title;
String? image;

CoverModel({this.title,this.image});
}