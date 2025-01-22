import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productlistingapp/Utils/colors.dart';

import '../../Controller/ApiController/wishlist_api.dart';
import '../../Model/ApiModel/wishList_model.dart';
import '../HomeScreen/grid_item.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  void initState() {
    print("nithiun");
    initialize();
    super.initState();
  }

  Future initialize() async {
    await Get.find<WishlistApiController>().fetchProductData();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 8, bottom: 8),
                  child: Text(
                    "WishList",
                    style: GoogleFonts.heebo(
                        color: ColorUtils.textColorReSend,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
            Expanded(
              child: GetX<WishlistApiController>(
                builder: (WishlistApiController controller) {
                  List<WishListpageModel> productList =
                      Get.find<WishlistApiController>().wishListData.value;
                  print(".........${productList.length}");
                  return productList.isNotEmpty ?GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 240.h,
                    ),
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      return WishListGridItem(
                        image: productList[index].images?.first ?? "",
                        name: productList[index].name ?? "",
                        salePrice: productList[index].salePrice,
                        mrp: productList[index].mrp,
                        rating:productList[index].avgRating,
                        id: productList[index].id,
                        wishList: productList[index].inWishlist,

                      );
                    },
                  ): Center(child: Text("No Data Found",style: GoogleFonts.heebo(
                    color: ColorUtils.previousAmount,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.h,
                  ),));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
