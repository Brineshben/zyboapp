import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controller/ApiController/profile_api_controller.dart';
import '../../Model/ApiModel/profile_api_model.dart';
import '../../Utils/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    initialize();
    super.initState();
  }

  Future initialize() async {
    await Get.find<ProfileApiController>().profileDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: GetX<ProfileApiController>(
            builder: (ProfileApiController controller) {
              Rx<ProfileModel> profileData =
                  Get.find<ProfileApiController>().userData;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'My Profile',
                    style: GoogleFonts.heebo(
                        color: ColorUtils.profileTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Name",
                    style: GoogleFonts.oxygen(
                        color: ColorUtils.previousAmount,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    profileData.value.name ?? "",
                    style: GoogleFonts.heebo(
                        color: ColorUtils.profileTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Phone',
                    style: GoogleFonts.oxygen(
                        color: ColorUtils.previousAmount,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    profileData.value.phoneNumber ?? "",
                    style: GoogleFonts.heebo(
                        color: ColorUtils.profileTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
