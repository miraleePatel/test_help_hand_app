import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../Utils/app_colors.dart';


class CustomTextFormfieldWidget extends StatelessWidget {
  final String? imageName;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final double? scale;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final bool? readOnly;
  final void Function(String)? onChanged;

  const CustomTextFormfieldWidget(
      {super.key,
      this.imageName,
      this.controller,
      this.validator,
      this.hintText,
      this.width,
      this.padding,
      this.scale,
      this.keyboardType,this.onTap,this.readOnly,this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 5.5.h,
          width: width ?? double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.testFeildBorder),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.only(left: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: padding ?? const EdgeInsets.all(0),
                child: Image.asset(
                  imageName!,
                  scale: scale ?? 1.3,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 7.w,
              ),
              Expanded(
                child: TextFormField(
                  controller: controller,
                  cursorColor: AppColors.blackColor,
                  keyboardType: keyboardType,
                  validator: validator,
                  onTap: onTap,
                  readOnly: readOnly ?? false,
                  onChanged:onChanged ,
                  scrollPhysics: NeverScrollableScrollPhysics(),
                  style:  GoogleFonts.openSans(
                      color: AppColors.blackColor,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    isDense: true,
                    fillColor: AppColors.testFeildBg,
                    filled: true,
                    contentPadding:
                        EdgeInsets.only(top: 1.5.h, bottom: 1.5.h, left: 10),
                    hintText: hintText,
                    hintStyle: GoogleFonts.openSans(
                        color: AppColors.textGreyColor,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500),
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
