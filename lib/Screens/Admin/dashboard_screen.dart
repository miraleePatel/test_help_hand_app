import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:help_hand_app/Screens/Admin/admin_home_screen.dart';
import 'package:help_hand_app/Screens/Admin/agent_list_screen.dart';
import 'package:help_hand_app/Screens/Admin/agent_view_screen.dart';
import 'package:help_hand_app/Utils/app_colors.dart';
import 'package:help_hand_app/Utils/string_constant.dart';
import 'package:help_hand_app/Widgets/custom_widget.dart';
import 'package:sizer/sizer.dart';

import '../../Controller/dashboard_controller.dart';
import '../../Models/login_model.dart';
import '../../Routes/routes.dart';
import '../../Utils/constants.dart';
import '../../Widgets/custom_button.dart';
import '../../generated/assets.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DashboardController dashboardController = Get.put(DashboardController());

  late PageController pageController;

  List<String> drawerList = ["Home", "Lists", "Applicant"];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController =
        PageController(initialPage: dashboardController.selectedIndex.value);
    String accessToken = GetStorage().read(authToken) ?? "";
    print("[auth token]:................... $accessToken");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: ClipRRect(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
        child: Container(
          width: 60.w,
          child: Drawer(
              elevation: 3,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Image.asset(
                                Assets.iconsIconClose,
                                scale: 2,
                              ),
                            ))),

                    ListView.separated(
                      itemCount: drawerList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Obx(() {
                          return GestureDetector(
                            onTap: () {
                              dashboardController.currentIndex.value = index;
                              if (index == 0) {
                                Get.back();
                                dashboardController.selectedIndex.value = 0;

                              }
                              else if (index == 1) {
                                Get.back();
                                dashboardController.selectedIndex.value = 1;

                              }
                              else {
                                Get.back();
                                dashboardController.selectedIndex.value = 2;

                              }
                            },
                            child: Container(
                              height: 7.h,
                              color: dashboardController.currentIndex.value ==
                                  index
                                  ? AppColors.blueLinearColor2
                                  : AppColors.drawerUnSelect,
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 20),
                              child: CustomWidgets.text(drawerList[index],
                                  color: dashboardController.currentIndex
                                      .value == index
                                      ? AppColors.whiteColor
                                      : AppColors.blueLinearColor2,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                          );
                        });
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 0.5.h,
                        );
                      },
                    ),

                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: CustomButton(
                        onTap: () async {
                          await GetStorage().erase().then((value) =>  Get.offAllNamed(Routes.SPLASH_SCREEN));

                        },
                        height: 6.5.h,
                        text: "Logout".toUpperCase(),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        leading: GestureDetector(
            onTap: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            child: Image.asset(
              Assets.iconsIconMenu,
              scale: 2.5,
            )),
        title: Image.asset(
          Assets.imagesLogo,
          scale: 5,
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
              onTap: () async {
                await GetStorage().erase().then((value) =>  Get.offAllNamed(Routes.SPLASH_SCREEN));


              },
              child: Image.asset(
                Assets.iconsIconLogout,
                scale: 2.5,
              ))
        ],
      ),
      body: Obx(() {
        return PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: <Widget>[_selectPage()],
        );
      }),
    );
  }

  /// Called when index chnage of navbarindex change and return the screen according
  _selectPage() {
    print('_selectPage --->  ${dashboardController.selectedIndex.value}');
    switch (dashboardController.selectedIndex.value) {
      case ADMIN_HOME_INDEX:
        return AdminHomeScreen();
      case LISTS_INDEX:
        return AgentListScreen();
      case APPLICANT_INDEX:
        return AgentViewScreen();
      default:
    }
  }
}

