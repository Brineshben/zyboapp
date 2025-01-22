import 'package:get/get.dart';

import '../../Model/ApiModel/login_api_model.dart';
import '../../Service/Api_services.dart';

class UserLoginController extends GetxController {
  Rx<LoginPhoneNumberModel> userData = LoginPhoneNumberModel().obs;


  Future<void> fetchLoginData({required String phoneNumber}) async {
    Map<String, dynamic> resp =
    await ApiServices.userLogin(phoneNumber: phoneNumber);
    print("resp$resp");

      LoginPhoneNumberModel loginApi = LoginPhoneNumberModel.fromJson(resp);
      print("loginapi$loginApi");
    userData.value =loginApi;
    print("loginapi${loginApi.otp}"); print("loginapi${phoneNumber}");

  }
}