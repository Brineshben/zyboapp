import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controller/ApiController/product_api_controller.dart';
import '../../Utils/colors.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12, top: 8),
      child: Container(
        height: 60.h,
        decoration: BoxDecoration(
          color: ColorUtils.whiteColor,
          borderRadius: BorderRadius.circular(65),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 3,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: TextField(
            onChanged: (value){
              Get.find<ProductApiController>().searchProductData(value);
            },
            controller: searchController,
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: GoogleFonts.lato(
                  color: ColorUtils.textColorReSend,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
              border: InputBorder.none,
              suffixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    height: 25,
                    width: 50,
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/Images/Line 11.svg"),
                        const SizedBox(width: 10,),
                        SvgPicture.asset("assets/Images/search.svg"),
                      ],
                    )),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            ),
          ),
        ),
      ),
    );
  }
}
