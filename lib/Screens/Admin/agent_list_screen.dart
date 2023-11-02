import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../Controller/agent_controller.dart';
import '../../Controller/dashboard_controller.dart';
import '../../Utils/app_colors.dart';
import '../../Widgets/custom_widget.dart';
import '../../generated/assets.dart';

class AgentListScreen extends StatefulWidget {
  const AgentListScreen({super.key});

  @override
  State<AgentListScreen> createState() => _AgentListScreenState();
}

class _AgentListScreenState extends State<AgentListScreen> {
  AgentController agentController = Get.put(AgentController());
  DashboardController dashboardController = Get.put(DashboardController());

  @override
  void initState() {
    // TODO: implement initState
    agentController.getAgentData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 3.h,),
            TextFormField(
              controller: agentController.searchController,
              cursorColor: AppColors.blackColor,
              style: TextStyle(color: AppColors.whiteColor),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Search here...",
                hintStyle: GoogleFonts.openSans(
                    color: AppColors.hintText,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600),
                contentPadding: EdgeInsets.only(
                  top: 2.5.h,
                  left: 5.w,
                ),
                hintTextDirection: TextDirection.ltr,
                border: InputBorder.none,
                fillColor: AppColors.testFeildBorder,
                filled: true,
                isDense: true,
                suffixIcon: Image.asset(Assets.iconsIconSearch, scale: 1.5,),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none
                ),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none
                ),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomWidgets.text("Agent\nCode".toUpperCase(),
                    color: AppColors.blueLinearColor2, maxLine: 2,
                    fontWeight: FontWeight.w500),
                SizedBox(
                  width: 10.w,
                ),
                CustomWidgets.text("NAME",
                    color: AppColors.blueLinearColor2,
                    fontWeight: FontWeight.w500),
                SizedBox(
                  width: 20.w,
                ),
                CustomWidgets.text("DATE".toUpperCase(),
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
        Obx(() {
          return  agentController.agentList.isNotEmpty?  Table(

              children: List.generate( agentController.agentList.length, (index) => TableRow(children: [
                // charges
                TableCell(
                    child: Container(
              height: 40.0,
                        child: CustomWidgets.text( agentController.agentList[index].agentCode.toString(), fontSize: 7.sp))),
                //price
                TableCell(
                    child: Container(
                      height: 40.0,
                      child:  CustomWidgets.text(agentController.agentList[index].agentFname.toString(), fontSize: 8.sp),
                    )),
                TableCell(
                    child: Container(
                      height: 40.0,
                      padding: EdgeInsets.only(left: 30),
                      child:   CustomWidgets.text(agentController.agentList[index].dateOfBirth.toString(), fontSize: 8.sp),

                    )),
                TableCell(

                    child: GestureDetector(
                      onTap: (){
                         },
                      child: Container(
                          height: 40.0,
                          padding: EdgeInsets.only(bottom: 20,left: 20),
                          child:   Image.asset(Assets.iconsIconFileFind, scale: 2,)

                      ),
                    )),
              ]))) : Container();
        })

          ],
        ),
      ),
    );
  }
}
