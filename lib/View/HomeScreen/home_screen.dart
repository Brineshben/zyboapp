import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productlistingapp/Model/ApiModel/product_api_model.dart';
import 'package:productlistingapp/View/HomeScreen/search.dart';
import '../../Controller/ApiController/banner_api_controller.dart';
import '../../Controller/ApiController/product_api_controller.dart';
import '../../Model/ApiModel/banner_api_model.dart';
import '../../Utils/colors.dart';
import 'carouse_widget.dart';
import 'grid_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    initialize();
    super.initState();
  }

  Future initialize() async {
    await Get.find<ProductApiController>().fetchProductData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            Search(),
            SizedBox(height: 10,),
            CarouseWidget(),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 8, bottom: 8),
                  child: Text(
                    "Popular Product",
                    style: GoogleFonts.heebo(
                        color: ColorUtils.textColorReSend,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
            GetX<ProductApiController>(
              builder: (ProductApiController controller) {
                List<ProductListModel> productList = Get.find<ProductApiController>().recentData.value;

                return Expanded(
                  child:productList.isNotEmpty? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 235.h,
                    ),
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      return GridItem(
                        id: productList[index].id,
                        image: productList[index].images?.first ?? "",
                        name: productList[index].name ?? "",
                        salePrice: productList[index].salePrice,
                        mrp: productList[index].mrp,
                        rating: productList[index].avgRating,
                        wishList: productList[index].inWishlist,
                      );
                    },
                  ): Center(child: Text("No Data Found",style: GoogleFonts.heebo(
                    color: ColorUtils.previousAmount,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.h,
                  ),))
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
