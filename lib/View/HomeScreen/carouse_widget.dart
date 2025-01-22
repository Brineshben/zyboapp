import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Controller/ApiController/banner_api_controller.dart';
import '../../Model/ApiModel/banner_api_model.dart';
import '../../Utils/colors.dart';

class CarouseWidget extends StatefulWidget {
  CarouseWidget({Key? key}) : super(key: key);

  @override
  State<CarouseWidget> createState() => _CarouseWidgetState();
}

class _CarouseWidgetState extends State<CarouseWidget> {
  CarouselSliderController carouselController = CarouselSliderController();
  var currentIndex = 0.obs;

  @override
  void initState() {
    initialize();
    super.initState();
  }

  Future initialize() async {
    await Get.find<BannerApiController>().fetchbannerData();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<BannerApiController>(
      builder: (BannerApiController controller) {
        List<BannerModel> bannerListData = Get.find<BannerApiController>().bannerData.value;

        return Column(
          children: [
            Container(
              height: 140.h,
              width: double.infinity,
              child: CarouselSlider.builder(
                carouselController: carouselController,
                itemCount: bannerListData.length,
                itemBuilder: (context, index, realIndex) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13).r,
                        image: DecorationImage(
                          image: NetworkImage(
                            bannerListData[index].image ?? "",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    currentIndex.value = index;
                  },
                  autoPlay: true,
                  enableInfiniteScroll: false,
                  initialPage: 0,
                  aspectRatio: 2.0,
                  viewportFraction: 0.95,
                  disableCenter: true,
                  enlargeCenterPage: true,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Obx(
                  () => AnimatedSmoothIndicator(
                activeIndex: currentIndex.value,
                count: bannerListData.length,
                axisDirection: Axis.horizontal,
                effect: SlideEffect(
                  spacing: 8.h,
                  radius: 4.h,
                  dotWidth: 23.h,
                  dotHeight: 7.h,
                  dotColor: ColorUtils.dotCarouselColor.withOpacity(0.1),
                  activeDotColor: ColorUtils.dotCarouselColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
