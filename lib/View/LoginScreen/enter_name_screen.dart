import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controller/ApiController/UserDetail_api_controller.dart';
import '../../Utils/colors.dart';
import '../../Utils/productapp_popups.dart';
import '../HomeScreen/page_index_navigation.dart';
import '../HomeScreen/home_screen.dart';

class EnterNameScreen extends StatelessWidget {
  String phoneNumber;
   EnterNameScreen({Key? key,required this.phoneNumber}) : super(key: key,);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    return Scaffold(
      backgroundColor: ColorUtils.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 45.h,
                      width: 45.w,
                      decoration: BoxDecoration(
                          color: ColorUtils.whiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 10,
                              spreadRadius: 0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(7)),
                      child: const Icon(
                        Icons.arrow_back_outlined, color: Colors.grey,),
                    ),
                  )
                ],
              ),


              const SizedBox(height: 32),
              Container(
                width: double.infinity,
                height: 48.h,
                child: TextField(
                  // maxLength: 10,
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Enter Full Name',
                    hintStyle: GoogleFonts.oxygen(
                        color: ColorUtils.nameTextColor,
                        fontSize: 14,
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
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(15),
                    // Limits input to 10 characters
                  ],
                ),
              ),
              const SizedBox(height: 32),

              GestureDetector(
                onTap: ()async {
                  if (
                  nameController.text.isNotEmpty
                  ) {
                    await Get.find<
                        UserDetailController>().fetchUserDetailsData(phoneNumber: phoneNumber, firstName: nameController.text);
                    ProductAppPopUps.submit(
                        message: "Login Successfully" ,
                        actionName: "Ok",
                        iconData:Icons.done,
                        iconColor: Colors.green);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PageIndexNavigation()));
                    ProductAppPopUps.submit(
                        message: "Login Successfully" ,
                        actionName: "Ok",
                        iconData:Icons.done,
                        iconColor: Colors.green);

                  } else {
                    ProductAppPopUps.submit(
                        message: "Please Enter the Name",
                        actionName: "Ok",
                        iconData:Icons.error_outline,
                        iconColor: Colors.red);
                  }
                },
                child: Container(

                  width: double.infinity,
                  height: 50.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorUtils.continueContainerColor
                  ),

                  child: Center(
                    child: Text(
                      'Submit',
                      style: GoogleFonts.oxygen(
                          color: ColorUtils.whiteColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
