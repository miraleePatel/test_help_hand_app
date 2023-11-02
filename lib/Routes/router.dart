// ignore_for_file: constant_identifier_Names

import 'package:get/get.dart';
import 'package:help_hand_app/Screens/Admin/admin_home_screen.dart';
import 'package:help_hand_app/Screens/Admin/agent_list_screen.dart';
import 'package:help_hand_app/Screens/Admin/agent_view_screen.dart';
import 'package:help_hand_app/Screens/Admin/dashboard_screen.dart';
import 'package:help_hand_app/Screens/GetCover/add_member_screen.dart';
import 'package:help_hand_app/Screens/GetCover/agent_details_screen.dart';
import 'package:help_hand_app/Screens/GetCover/all_applicant_details_screen.dart';
import 'package:help_hand_app/Screens/GetCover/applicant_details_screen.dart';
import 'package:help_hand_app/Screens/GetCover/cover_section_screen.dart';
import 'package:help_hand_app/Screens/GetCover/terms_condition_screen.dart';
import '../Screens/Admin/Authentication/login_screen.dart';
import '../Screens/splash_screen.dart';
import 'routes.dart';

class AppPages {
  static const INITIAL_ROUTE = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: Routes.SPLASH_SCREEN,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.LOGIN_SCREEN,
      page: () => const LoginScreen(),
    ),  GetPage(
      name: Routes.DASHBOARD_SCREEN,
      page: () => const DashboardScreen(),
    ),   GetPage(
      name: Routes.ADMIN_HOME_SCREEN,
      page: () => const AdminHomeScreen(),
    ),   GetPage(
      name: Routes.AGENT_LIST_SCREEN,
      page: () => const AgentListScreen(),
    ),   GetPage(
      name: Routes.AGENT_VIEW_SCREEN,
      page: () => const AgentViewScreen(),
    ),   GetPage(
      name: Routes.TERMS_CONDITION_SCREEN,
      page: () => const TermsConditionScreen(),
    ),   GetPage(
      name: Routes.COVER_SECTION_SCREEN,
      page: () => const CoverSectionScreen(),
    ),   GetPage(
      name: Routes.APPLICANT_DETAILS_SCREEN,
      page: () => const ApplicantDetailsScreen(),
    ),GetPage(
      name: Routes.ALL_APPLICANT_DETAILS_SCREEN,
      page: () => const AllApplicantDetailsScreen(),
    ),GetPage(
      name: Routes.AGENT_DETAILS_SCREEN,
      page: () => const AgentDetailsScreen(),
    ),GetPage(
      name: Routes.ADD_MEMBER_SCREEN,
      page: () => const AddMemberScreen(),
    ),


  ];
}
