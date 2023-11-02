import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:help_hand_app/Utils/string_constant.dart';
import '../API/api_manager.dart';
import '../Repository/auth_repository.dart';
import '../Routes/routes.dart';
import '../Utils/constants.dart';

class AuthController extends GetxController{
  TextEditingController emailController = TextEditingController(text: "myadmin@test.com");
  TextEditingController passController = TextEditingController(text: "123456789");
  final authRepository = AuthRepository(APIManager());

  clearData(){
    emailController.clear();
    passController.clear();
  }
  ///
  /// sign in with E-mail & Password
  ///
  login() async {
    var loginDetails = await authRepository.loginApiCall(
      email: emailController.text.trim(),
      password: passController.text.trim(),
    );


  if(loginDetails.accessToken != "") {
    GetStorage().write(authToken, loginDetails.accessToken);

    /// success message & navigation
    successSnackBar(message: 'Login Successfully.');
    Get.offAllNamed(Routes.DASHBOARD_SCREEN);
  }else{
    errorSnackBar(message: 'Invalid Credential');
  }

  }
}