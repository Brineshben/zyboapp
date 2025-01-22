import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../Model/ApiModel/wishList_model.dart';
import '../../Service/Api_services.dart';

class WishlistApiController extends GetxController {
  RxList<WishListpageModel> wishListData = <WishListpageModel>[].obs;



  Future<void> fetchProductData() async {
    List<dynamic> resp =
    await ApiServices.wishListItems();
    print("resppppppppp$resp");

    // ProductListModel productApi = ProductListModel.fromJson(resp);
    // print("userDetailsApi$productApi");
    wishListData.value = resp.map((e) => WishListpageModel.fromJson(e)).toList();


  }
}