import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

import '../../Controller/agent_controller.dart';
import '../../Routes/routes.dart';
import '../../Utils/app_colors.dart';
import '../../Widgets/custom_textformfield_widget.dart';
import '../../Widgets/custom_widget.dart';
import '../../generated/assets.dart';

class AgentViewScreen extends StatefulWidget {
  const AgentViewScreen({super.key});

  @override
  State<AgentViewScreen> createState() => _AgentViewScreenState();
}

class _AgentViewScreenState extends State<AgentViewScreen> {
  AgentController agentController = Get.put(AgentController());
  int id = Get.arguments;

  @override
  void initState() {
    // TODO: implement initState
    callMethodOnInit();
    super.initState();
  }

  callMethodOnInit() {
    agentController.getAgentByIDData(id: id);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    agentController.clearField();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: AppColors.blueLinearColor2,
            )),
        title: Image.asset(
          Assets.imagesLogo,
          scale: 5,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: CustomWidgets.text("AGENT DETAILS",
                      color: AppColors.blueLinearColor2,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w800,
                      fontSize: 11.sp)),
              SizedBox(
                height: 4.h,
              ),
              CustomWidgets.text("First Name *",
                  color: AppColors.textGreyColor,
                  textAlign: TextAlign.center,
                  fontSize: 8.sp),
              CustomTextFormfieldWidget(
                controller: agentController.firstNameController,
                imageName: Assets.iconsIconAccount,
                hintText: "Drake",
                keyboardType: TextInputType.text,
                readOnly: true,
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomWidgets.text("Last Name *",
                  color: AppColors.textGreyColor,
                  textAlign: TextAlign.center,
                  fontSize: 8.sp),
              CustomTextFormfieldWidget(
                controller: agentController.lastNameController,
                imageName: Assets.iconsIconAccount,
                hintText: "Josh",
                keyboardType: TextInputType.text,
                readOnly: true,
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomWidgets.text("Agent Code *",
                  color: AppColors.textGreyColor,
                  textAlign: TextAlign.center,
                  fontSize: 8.sp),
              CustomTextFormfieldWidget(
                controller: agentController.agentCodeController,
                imageName: Assets.iconsIconAccount,
                hintText: "G97896",
                keyboardType: TextInputType.text,
                readOnly: true,
              ),
              SizedBox(
                height: 5.h,
              ),

              /// your plan title
              Container(
                height: 6.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: AppColors.blueLinearColor2),
                alignment: Alignment.center,
                child: CustomWidgets.text("PLAN",
                    color: AppColors.whiteColor, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 2.h,
              ),

              /// main memeber & dob

              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomWidgets.text("MAIN MEMBER",
                            color: AppColors.blueLinearColor2,
                            maxLine: 2,
                            fontWeight: FontWeight.w500),
                        SizedBox(
                          width: 7.w,
                        ),
                        CustomWidgets.text("DOB",
                            color: AppColors.blueLinearColor2,
                            fontWeight: FontWeight.w500),
                        Spacer(),
                      ],
                    ),
                    Divider(
                      color: AppColors.testFeildBorder,
                      thickness: 2,
                    ),

                    Obx(() {
                      return Table(children: [
                        TableRow(children: [
                          // charges
                          TableCell(
                              child: Container(
                                  height: 40.0,
                                  child: agentController.singleAgentList
                                      .isNotEmpty ?
                                  CustomWidgets.text(
                                      "${agentController.singleAgentList[0]
                                          .firstName.toString()} ",
                                      fontSize: 7.sp) : Container())),
                          //price
                          TableCell(
                              child: Container(
                                height: 40.0,
                                child: agentController
                                    .singleAgentList.isNotEmpty ? CustomWidgets
                                    .text(
                                    agentController
                                        .singleAgentList[0].
                                    dateOfBirth
                                        .toString(),
                                    fontSize: 8.sp) : Container(),
                              )),

                          TableCell(
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                    height: 40.0,
                                    padding: EdgeInsets.only(
                                        bottom: 20, left: 20),
                                    child: Row(
                                      children: [
                                        Image.asset(Assets.iconsRemove),
                                        Image.asset(Assets.iconsEdit),
                                      ],
                                    )),
                              )),
                        ])
                      ]);
                    }),

                    SizedBox(
                      height: 5.h,
                    ),

                    /// Cover Member
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomWidgets.text("MAIN\nMEMBER",
                            color: AppColors.blueLinearColor2,
                            maxLine: 2,
                            fontWeight: FontWeight.w500),
                        SizedBox(
                          width: 5.w,
                        ),
                        CustomWidgets.text("DOB",
                            color: AppColors.blueLinearColor2,
                            fontWeight: FontWeight.w500),
                        SizedBox(
                          width: 18.w,
                        ),
                        CustomWidgets.text("Relationship".toUpperCase(),
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
                      return agentController.singleAgentList.isNotEmpty
                          ? Table(
                          children: List.generate(
                              agentController
                                  .singleAgentList[0]
                                  .mainInsurancePersonDependenPeople!
                                  .length,
                                  (index) =>
                                  TableRow(children: [
                                    // charges
                                    TableCell(
                                        child: Container(
                                            height: 40.0,
                                            child: CustomWidgets.text(
                                                "${agentController
                                                    .singleAgentList[0]
                                                    .mainInsurancePersonDependenPeople![index]
                                                    .firstName
                                                    .toString()} ${agentController
                                                    .singleAgentList[0]
                                                    .mainInsurancePersonDependenPeople![index]
                                                    .lastName.toString()}",
                                                fontSize: 7.sp))),
                                    //price
                                    TableCell(
                                        child: Container(
                                          height: 40.0,
                                          child: CustomWidgets.text(
                                              agentController
                                                  .singleAgentList[0]
                                                  .mainInsurancePersonDependenPeople![
                                              index]
                                                  .dateOfBirth
                                                  .toString(),
                                              fontSize: 8.sp),
                                        )),
                                    TableCell(
                                        child: Container(
                                          height: 40.0,
                                          padding: EdgeInsets.only(left: 30),
                                          child: CustomWidgets.text(
                                              agentController
                                                  .singleAgentList[0]
                                                  .mainInsurancePersonDependenPeople![
                                              index]
                                                  .relation
                                                  .toString(),
                                              fontSize: 8.sp),
                                        )),
                                    TableCell(
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                              height: 40.0,
                                              padding: EdgeInsets.only(
                                                  bottom: 20, left: 20),
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                      Assets.iconsRemove),
                                                  Image.asset(Assets.iconsEdit),
                                                ],
                                              )),
                                        )),
                                  ])))
                          : Container();
                    }),
                    SizedBox(
                      height: 2.h,
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
