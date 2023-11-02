import 'package:flutter/material.dart';

import '../../Utils/app_colors.dart';
import '../../Widgets/custom_widget.dart';

class ApplicantScreen extends StatefulWidget {
  const ApplicantScreen({super.key});

  @override
  State<ApplicantScreen> createState() => _ApplicantScreenState();
}

class _ApplicantScreenState extends State<ApplicantScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomWidgets.text("APPLICANT", color: AppColors.blueLinearColor2),
    );
  }
}
