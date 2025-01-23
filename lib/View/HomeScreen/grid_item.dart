import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productlistingapp/Service/Api_services.dart';
import '../../Controller/ApiController/product_api_controller.dart';
import '../../Controller/ApiController/wishlist_api.dart';
import '../../Utils/colors.dart';

class GridItem extends StatelessWidget {
  final int? id;
  final bool? wishList;
  final String image;
  final String name;
  final int? salePrice;
  final int? mrp;
  final int? rating;

  const GridItem(
      {super.key,
      required this.image,
      required this.name,
      required this.salePrice,
      required this.mrp,
      required this.rating,
      this.id,
      this.wishList});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8).r,
                child: Image.network(
                  image,
                  height: 176.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8, // Adjust the top position as needed
                right: 8, // Adjust the right position as needed
                child: GetX<ProductApiController>(

                  builder: (ProductApiController controller){
                    bool iswishList=controller.recentData.value.where((element) => element.id == id).toList().first.inWishlist ?? false;
                    return InkWell(
                        onTap: () async {
                          await ApiServices.addtoWishList(id.toString());
                          await controller.fetchProductData();
                          await Get.find<WishlistApiController>().fetchProductData();

                        },
                        child: SvgPicture.asset(iswishList
                            ? "assets/Images/Heart (1).svg"
                            : "assets/Images/Wishlist.svg"));
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "₹$mrp",
                    style: GoogleFonts.heebo(
                      color: ColorUtils.previousAmount,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.h,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  SizedBox(width: 5.h),
                  Text(
                    "₹$salePrice",
                    style: GoogleFonts.heebo(
                      color: ColorUtils.continueContainerColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.h,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    "assets/Images/Star.svg",
                  ),
                  SizedBox(width: 5.h),
                  Text(
                    "$rating",
                    style: GoogleFonts.heebo(
                      color: ColorUtils.ratingColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.h,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text(
                name,
                style: GoogleFonts.heebo(
                  color: ColorUtils.blackColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.h,
                  letterSpacing: 1,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
class WishListGridItem extends StatelessWidget {
  final int? id;
  final bool? wishList;
  final String image;
  final String name;
  final int? salePrice;
  final int? mrp;
  final int? rating;

  const WishListGridItem(
      {super.key,
        required this.image,
        required this.name,
        required this.salePrice,
        required this.mrp,
        required this.rating,
        this.id,
        this.wishList});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8).r,
                child: Image.network(
                  image,
                  height: 176.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8, // Adjust the top position as needed
                right: 8, // Adjust the right position as needed
                child: GetX<WishlistApiController>(
                  builder: (WishlistApiController controller){
                    bool iswishList=controller.wishListData.value.where((element) => element.id == id).toList().first.inWishlist ?? false;

                    return InkWell(
                        onTap: () async {
                          await ApiServices.addtoWishList(id.toString());
                          await controller.fetchProductData();

                        },
                        child: SvgPicture.asset(iswishList
                            ? "assets/Images/Heart (1).svg"
                            : "assets/Images/Wishlist.svg"));
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "₹$mrp",
                    style: GoogleFonts.heebo(
                      color: ColorUtils.previousAmount,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.h,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  SizedBox(width: 5.h),
                  Text(
                    "₹$salePrice",
                    style: GoogleFonts.heebo(
                      color: ColorUtils.continueContainerColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.h,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    "assets/Images/Star.svg",
                  ),
                  SizedBox(width: 5.h),
                  Text(
                    "$rating",
                    style: GoogleFonts.heebo(
                      color: ColorUtils.ratingColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.h,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text(
                name,
                style: GoogleFonts.heebo(
                  color: ColorUtils.blackColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.h,
                  letterSpacing: 1,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
