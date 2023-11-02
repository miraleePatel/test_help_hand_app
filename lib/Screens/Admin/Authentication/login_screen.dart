import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_hand_app/Utils/constants.dart';
import 'package:sizer/sizer.dart';
import '../../../Controller/auth_controller.dart';
import '../../../Utils/app_colors.dart';
import '../../../Widgets/custom_button.dart';
import '../../../Widgets/custom_textformfield_widget.dart';
import '../../../Widgets/custom_widget.dart';
import '../../../generated/assets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 10,left: 40,right: 40),
          child: CustomButton(
            onTap: () {
              RegExp emailRegExp = RegExp(
                  r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
          if(authController.emailController.text.isEmpty){
            errorSnackBar(message: "Please Enter Your Email");
          }
          else if(!emailRegExp.hasMatch(authController.emailController.text)){
            errorSnackBar(message: "Enter Valid Email Address");

          }
          else if(authController.passController.text.isEmpty){
            errorSnackBar(message: "Please Enter Password");
          }

          else{
              authController.login();
          }
            },
            height: 6.5.h,
            width: 70.w,
            text: "LOGIN",
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
                    child: CustomWidgets.text(
                        "LOGIN",
                        color: AppColors.blueLinearColor2,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w700,
                        fontSize: 15.sp)),
                SizedBox(
                  height: 5.h,
                ),
                /// email
                CustomWidgets.text(
                    "Email *",
                    color: AppColors.textGreyColor,
                    textAlign: TextAlign.center,
                    fontSize: 8.sp
                ),
                CustomTextFormfieldWidget(
                  controller:authController.emailController ,
                  imageName:Assets.iconsIconEmail ,
                  hintText: "john@test.com",
                ),
                SizedBox(
                  height: 2.h,
                ),
                /// Password
                CustomWidgets.text(
                    "Password *",
                    color: AppColors.textGreyColor,
                    textAlign: TextAlign.center,
                    fontSize: 8.sp
                ),
                CustomTextFormfieldWidget(
                  controller:authController.passController ,
                  imageName:Assets.iconsIconLock ,
                  hintText: "*******",
                  obscureText: true,
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
