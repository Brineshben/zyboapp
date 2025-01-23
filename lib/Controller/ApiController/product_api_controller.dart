import 'package:get/get.dart';

import '../../Model/ApiModel/product_api_model.dart';
import '../../Service/Api_services.dart';

class ProductApiController extends GetxController {
  RxList<ProductListModel> recentDataCopy = <ProductListModel>[].obs;
  RxList<ProductListModel> recentData = <ProductListModel>[].obs;



  Future<void> fetchProductData() async {
    List<dynamic> resp =
    await ApiServices.productDetails();
    print("respppp$resp");

    recentData.value = resp.map((e) => ProductListModel.fromJson(e)).toList();
    recentDataCopy.value = recentData.value;
  }
  Future<void> searchProductData(String SearchData) async {
    recentData.value = [];
    List<dynamic> resp =
    await ApiServices.searchData(SearchData);

    recentData.value = resp.map((e) => ProductListModel.fromJson(e)).toList();
  }
}