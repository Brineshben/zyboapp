import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productlistingapp/Utils/colors.dart';

import '../../Controller/ApiController/login_api_controller.dart';
import '../../Utils/productapp_popups.dart';
import '../HomeScreen/home_screen.dart';
import '../HomeScreen/page_index_navigation.dart';
import 'enter_name_screen.dart';

class OTPVerificationScreen extends StatefulWidget {
  String phoneNumber;

  OTPVerificationScreen({super.key, required this.phoneNumber});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  int _remainingSeconds = 120; // Starting time in seconds
  Timer? _timer;
  final List<TextEditingController> otpControllers =
      List.generate(4, (index) => TextEditingController());

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final minutes = (_remainingSeconds ~/ 60).toString();
    final seconds = (_remainingSeconds % 60).toString();
    return Scaffold(
      backgroundColor: ColorUtils.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20).h,
          child: SingleChildScrollView(
            child: GetX<UserLoginController>(
              builder: (UserLoginController controller) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 46.h,
                            width: 45.h,
                            decoration: BoxDecoration(
                                color: ColorUtils.whiteColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    blurRadius: 10,
                                    spreadRadius: 0,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(7).r),
                            child: Icon(
                              Icons.arrow_back_outlined,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "OTP VERIFICATION",
                          style: GoogleFonts.oxygen(
                              color: ColorUtils.blackColor,
                              fontSize: 18.h,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Text(
                              "Enter the OTP sent to ",
                              style: GoogleFonts.oxygen(
                                  color: ColorUtils.blackColor,
                                  fontSize: 14.h,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              widget.phoneNumber,
                              style: GoogleFonts.oxygen(
                                  color: ColorUtils.blackColor,
                                  fontSize: 14.h,
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        SizedBox(height: 30.h),
                        Row(
                          children: [
                            Text(
                              "OTP is ",
                              style: GoogleFonts.oxygen(
                                  color: ColorUtils.blackColor,
                                  fontSize: 15.h,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              controller.userData.value.otp.toString(),
                              style: GoogleFonts.oxygen(
                                  color: ColorUtils.continueContainerColor,
                                  fontSize: 18.h,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        4,
                        (index) => Container(
                          width: 76.h,
                          height: 58.h,
                          decoration: BoxDecoration(
                            color: ColorUtils.otpContainerColor,
                            border: Border.all(
                              color: Colors.grey,
                              width: 0.3,
                            ),
                            borderRadius: BorderRadius.circular(10).r,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),

                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 2.0,
                                sigmaY: 2.0,
                              ),
                              child: TextField(
                                controller: otpControllers[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18.h),
                                keyboardType: TextInputType.number,
                                maxLength: 1,
                                decoration: const InputDecoration(
                                  counterText: "",
                                  border: InputBorder.none,
                                ),
                                onChanged: (value) {
                                  if (value.isNotEmpty && index < 3) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      '$minutes:$seconds' " Sec",
                      style: GoogleFonts.oxygen(
                          color: ColorUtils.textColor,
                          fontSize: 14.h,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't receive code?",
                          style: GoogleFonts.oxygen(
                              color: ColorUtils.textColorReSend,
                              fontSize: 14.h,
                              fontWeight: FontWeight.w400),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Re-send",
                            style: GoogleFonts.oxygen(
                                color: ColorUtils.reSend,
                                fontSize: 15.h,
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 32.h),
                    GestureDetector(
                      onTap: () {
                        String otp = otpControllers.map((e) => e.text).join();
                        print("benenen$otp");
                        if (controller.userData.value.otp == otp) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  EnterNameScreen(phoneNumber: widget.phoneNumber,)));
                        }
                        else{
                          ProductAppPopUps.submit(
                              message: "Please Enter a Valid OTP",
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
                            'Submit',
                            style: GoogleFonts.oxygen(
                                color: ColorUtils.whiteColor,
                                fontSize: 16.h,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
