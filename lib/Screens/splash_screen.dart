import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:help_hand_app/Routes/routes.dart';
import 'package:help_hand_app/generated/assets.dart';
import 'package:sizer/sizer.dart';
import '../Utils/app_colors.dart';
import '../Utils/string_constant.dart';
import '../Widgets/custom_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          /// logo
          Center(child: Image.asset(Assets.imagesLogo,scale: 2.5,)),
          SizedBox(height: 10.h,),
          /// Get cover section
          CustomButton(
            onTap: (){
              Get.toNamed(Routes.TERMS_CONDITION_SCREEN);
            },
            height: 6.5.h,
            width: 45.w,
            text:"GET COVER" ,
          ),
          SizedBox(height: 3.h,),
          /// admin login section
          CustomButton(
            onTap: (){
              if (GetStorage().read(authToken) != null) {
                Get.offAllNamed(Routes.DASHBOARD_SCREEN);
              }else{
              Get.offAllNamed(Routes.LOGIN_SCREEN);}
            },
            height: 6.5.h,
            width: 45.w,
            gradient:  LinearGradient(
              colors: [
                AppColors.greenLinearColor2,
                AppColors.greenLinearColor1,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            text:"ADMIN LOGIN" ,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
