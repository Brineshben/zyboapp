import 'package:get/get.dart';

import '../../Model/ApiModel/banner_api_model.dart';
import '../../Model/ApiModel/product_api_model.dart';
import '../../Service/Api_services.dart';

class BannerApiController extends GetxController {
  RxList<BannerModel> bannerData = <BannerModel>[].obs;



  Future<void> fetchbannerData() async {
    List<dynamic> resp =
    await ApiServices.bannerDetails();
    print("respppp banner$resp");


    bannerData.value = resp.map((e) => BannerModel.fromJson(e)).toList();

  }
}