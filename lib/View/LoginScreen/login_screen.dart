import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controller/ApiController/login_api_controller.dart';
import '../../Utils/colors.dart';
import '../../Utils/productapp_popups.dart';
import 'otp_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneNumberController = TextEditingController();
    return Scaffold(
      backgroundColor: ColorUtils.whiteColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 120, left: 20, right: 20).h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: GoogleFonts.oxygen(
                  color: ColorUtils.blackColor,
                  fontSize: 35.h,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 8.h),
            Text(
              "Let's Connect with Lorem Ipsum..!",
              style: GoogleFonts.manrope(
                  color: ColorUtils.greyColor,
                  fontSize: 14.h,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 30.h),
            Row(
              children: [
                SizedBox(
                  width: 45.w,
                  height: 48.h,
                  child: TextField(
                    readOnly: true,
                    cursorColor: ColorUtils.blackColor.withOpacity(0.1),
                    decoration: InputDecoration(
                      hintText: '+91',
                      hintStyle: GoogleFonts.manrope(
                          color: ColorUtils.greyColor,
                          fontSize: 14.h,
                          fontWeight: FontWeight.w400),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorUtils.blackColor.withOpacity(0.1),
                          width: 1,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorUtils.blackColor.withOpacity(0.1),
                          width: 1,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                ),
                SizedBox(width: 8.h),
                SizedBox(
                  width: 330.w,
                  height: 48.h,
                  child: TextField(
                    controller: phoneNumberController,
                    // maxLength: 10,
                    cursorColor: ColorUtils.blackColor.withOpacity(0.1),
                    decoration: InputDecoration(
                      hintText: 'Enter Phone',
                      hintStyle: GoogleFonts.oxygen(
                          color: ColorUtils.greyColor,
                          fontSize: 14.h,
                          fontWeight: FontWeight.w400),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorUtils.blackColor.withOpacity(0.1),
                          width: 1,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorUtils.blackColor.withOpacity(0.1),
                          width: 1,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      // Limits input to 10 characters
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 32.h),
            GestureDetector(
              onTap: () async {
                if (phoneNumberController.text.length == 10) {
                  await Get.find<UserLoginController>()
                      .fetchLoginData(phoneNumber: phoneNumberController.text);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OTPVerificationScreen(
                              phoneNumber: phoneNumberController.text)));
                } else {
                  ProductAppPopUps.submit(
                      message: "Please Enter a Valid Mobile Number",
                      actionName: "Ok",
                      iconData:Icons.error_outline,
                      iconColor: Colors.red);
                }
              },
              child: Container(
                width: double.infinity,
                height: 50.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10).r,
                    color: ColorUtils.continueContainerColor),
                child: Center(
                  child: Text(
                    'Continue',
                    style: GoogleFonts.oxygen(
                        color: ColorUtils.whiteColor,
                        fontSize: 16.h,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Center(
              child: SizedBox(
                width: 280.w,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'By Continuing you accepting the ',
                        style: GoogleFonts.oxygen(
                          color: ColorUtils.greyColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: 'Terms of Use & Privacy Policy',
                        style: GoogleFonts.oxygen(
                          color: ColorUtils.greyColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
