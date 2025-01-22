import 'package:get/get.dart';

import '../../Model/ApiModel/profile_api_model.dart';
import '../../Service/Api_services.dart';

class ProfileApiController extends GetxController {
  Rx<ProfileModel> userData = ProfileModel().obs;

  Future<void> profileDetails() async {
    Map<String, dynamic> resp = await ApiServices.profileDetails();
    print("response of profile$resp");

    ProfileModel profileApi = ProfileModel.fromJson(resp);
    userData.value = profileApi;
  }
}
