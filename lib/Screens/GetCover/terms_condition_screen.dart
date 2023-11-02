import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../Routes/routes.dart';
import '../../Utils/app_colors.dart';
import '../../Utils/constants.dart';
import '../../Widgets/custom_button.dart';
import '../../Widgets/custom_widget.dart';

class TermsConditionScreen extends StatefulWidget {
  const TermsConditionScreen({super.key});

  @override
  State<TermsConditionScreen> createState() => _TermsConditionScreenState();
}

class _TermsConditionScreenState extends State<TermsConditionScreen> {
  /// if you DECLINE. It will display message you can’t continue and app closes.
  void showSnackbarAndCloseApp(BuildContext context) {
    informationSnackBar(message: 'You can\'t continue. The app will close.');
    // Close the app after a delay (e.g., 2 seconds).
    Future.delayed(Duration(seconds: 4), () {
      SystemNavigator.pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /// back btn
            CustomWidgets.customBack(),

            /// decline btn
            CustomBorderButton(
              onTap: () {
                showSnackbarAndCloseApp(context);
              },
              text: "DECLINE",
            ),

            /// accept btn
            CustomButton(
              onTap: () {
                Get.toNamed(Routes.AGENT_DETAILS_SCREEN);
              },
              height: 5.h,
              width: 35.w,
              text: "ACCEPT",
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// title
              Center(
                  child: CustomWidgets.text(
                      "Just before we continue, please read and accept the disclaimer",
                      color: AppColors.blackColor,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w600,
                      fontSize: 11.sp)),
              SizedBox(
                height: 2.h,
              ),
              /// description
              Center(
                  child: CustomWidgets.text(text,
                      color: AppColors.blackColor,
                      textAlign: TextAlign.center,
                      fontSize: 7.5.sp)),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String text =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi venenatis diam nec diam ullamcorper euismod. Quisque fermentum cursus lacus vel porta. Vivamus convallis, purus id finibus sagittis, sapien velit vehicula enim, eget ullamcorper enim leo id quam. Aliquam erat volutpat. Curabitur pellentesque augue accumsan, faucibus magna et, viverra dolor. Vivamus iaculis metus vel augue condimentum posuere. Aenean tristique purus eu dolor porttitor dignissim. Sed orci lacus, pulvinar nec ultrices in, sagittis in orci. Pellentesque nunc felis, aliquam ac molestie quis, convallis nec elit. Vivamus a mi porta nisi molestie hendrerit vitae a magna. Etiam vel nisi pulvinar, tristique eros et, eleifend metus. Integer est sapien, ultrices euismod consectetur ac, feugiat vitae lectus. Etiam eget tempor nulla. Nunc pharetra, dui id gravida sodales, neque magna placerat sem, quis bibendum magna tellus sed massa. Curabitur a hendrerit nisi. Vestibulum blandit erat a feugiat efficitur. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam ultricies vel nibh vestibulum lobortis. Duis arcu dolor, vulputate ac massa non, pretium varius quam. Vestibulum vitae velit magna. In ullamcorper ante nec lectus feugiat, vel imperdiet nunc convallis. Quisque rhoncus dignissim felis, nec accumsan lorem. Sed nec scelerisque dui. Aenean vel vulputate lectus, non feugiat tortor. Aenean fringilla placerat condimentum. Nunc quam nibh, bibendum sit amet nibh in, semper ullamcorper tortor. Nunc a pulvinar ante. Suspendisse potenti. Sed non vestibulum velit. Sed faucibus, quam ac accumsan mattis, urna velit porttitor est, ut suscipit orci dolor nec nunc. Suspendisse vulputate malesuada finibus. Morbi risus quam, lacinia sed ante quis, pulvinar cursus quam. Aenean ornare vulputate tincidunt. Curabitur nec nibh a lacus consectetur tincidunt quis ac ante.";
