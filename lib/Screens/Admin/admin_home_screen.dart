import 'package:flutter/material.dart';
import 'package:help_hand_app/Utils/app_colors.dart';
import 'package:help_hand_app/Widgets/custom_widget.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomWidgets.text("WELCOME \n ADMIN", color: AppColors.blueLinearColor2),
    );
  }
}
