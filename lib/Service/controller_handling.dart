import 'package:get/get.dart';

import '../Controller/ApiController/UserDetail_api_controller.dart';
import '../Controller/ApiController/banner_api_controller.dart';
import '../Controller/ApiController/login_api_controller.dart';
import '../Controller/ApiController/product_api_controller.dart';
import '../Controller/ApiController/profile_api_controller.dart';
import '../Controller/ApiController/wishlist_api.dart';


class HandleControllers {
  static createGetControllers() {
    Get.put(UserLoginController());
    Get.put(UserDetailController());
    Get.put(ProductApiController());
    Get.put(BannerApiController());
    Get.put(ProfileApiController());
    Get.put(WishlistApiController());

  }

  static deleteAllGetControllers() {
    Get.delete<UserLoginController>();
    Get.delete<UserDetailController>();
    Get.delete<ProductApiController>();
    Get.delete<BannerApiController>();
    Get.delete<ProfileApiController>();
    Get.delete<WishlistApiController>();

  }
}
