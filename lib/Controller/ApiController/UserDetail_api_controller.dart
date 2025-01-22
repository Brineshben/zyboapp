import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Model/ApiModel/User_api_model.dart';
import '../../Service/Api_services.dart';
import '../../Service/sharedpreference.dart';
import '../../Utils/productapp_popups.dart';

class UserDetailController extends GetxController {
  Rx<UserDetailsModel> userDetailsData = UserDetailsModel().obs;


  Future<void> fetchUserDetailsData({required String phoneNumber,required String firstName}) async {
    Map<String, dynamic> resp =
    await ApiServices.userDetails(phoneNumber: phoneNumber, firstName: firstName);
    print("resp$resp");

    UserDetailsModel userDetailsApi = UserDetailsModel.fromJson(resp);
    print("userDetailsApi$userDetailsApi");
    userDetailsData.value =userDetailsApi;
    SharedPrefs().setLoginData(userDetailsApi);


  }
}