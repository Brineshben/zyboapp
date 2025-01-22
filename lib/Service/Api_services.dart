import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:productlistingapp/Service/sharedpreference.dart';
import '../Model/ApiModel/User_api_model.dart';
import '../Utils/api_constants.dart';

class ApiServices {
  static final ApiServices _instance = ApiServices._internal();

  ApiServices._internal();

  factory ApiServices() {
    return _instance;
  }

  static Future<Map<String, dynamic>> userLogin({
    required String phoneNumber,
  }) async {
    String url = ApiConstants.phoneNumberApi;
    print(url);
    Map apiBody = {"phone_number": phoneNumber};

    Map<String, String> apiHeader = {
      'Content-Type': 'application/json',
    };
    try {
      var request = http.Request('POST', Uri.parse(url));
      request.body = (json.encode(apiBody));
      request.headers.addAll(apiHeader);
      http.StreamedResponse response = await request.send();
      var respString = await response.stream.bytesToString();
      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error");
    }
  }

  static Future<Map<String, dynamic>> userDetails({
    required String phoneNumber,
    required String firstName,
  }) async {
    String url = ApiConstants.userDetailsApi;
    print(url);
    Map apiBody = {
      "phone_number": phoneNumber,
      "first_name": firstName,
    };

    Map<String, String> apiHeader = {
      'Content-Type': 'application/json',
    };
    try {
      var request = http.Request('POST', Uri.parse(url));
      request.body = (json.encode(apiBody));
      request.headers.addAll(apiHeader);
      http.StreamedResponse response = await request.send();
      var respString = await response.stream.bytesToString();
      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error");
    }
  }

  static Future<List<dynamic>> productDetails() async {
    String url = ApiConstants.productDetailsApi;
    print(url);
    UserDetailsModel? loginApi = await SharedPrefs().getLoginData();
    Map<String, String> apiHeader = {
      'Authorization': 'Bearer ${loginApi?.token?.access ?? ""}',
      'Content-Type': 'application/json',
    };

    try {
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll(apiHeader);
      http.StreamedResponse response = await request.send();
      var respString = await response.stream.bytesToString();
      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error");
    }
  }

  static Future<List<dynamic>> bannerDetails() async {
    String url = ApiConstants.bannerApi;
    print(url);

    Map<String, String> apiHeader = {
      'Content-Type': 'application/json',
    };
    try {
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll(apiHeader);
      http.StreamedResponse response = await request.send();
      var respString = await response.stream.bytesToString();
      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error");
    }
  }

  static Future<Map<String, dynamic>> profileDetails() async {
    String url = ApiConstants.profileApi;
    print(url);

    UserDetailsModel? loginApi = await SharedPrefs().getLoginData();
    Map<String, String> apiHeader = {
      'Authorization': 'Bearer ${loginApi?.token?.access ?? ""}',
      'Content-Type': 'application/json',
    };
    print("apiHeader$apiHeader");
    try {
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll(apiHeader);
      http.StreamedResponse response = await request.send();
      var respString = await response.stream.bytesToString();
      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error");
    }
  }

  static Future<Map<String, dynamic>> addtoWishList(String productID) async {
    String url = ApiConstants.wishListApi;
    print(url);

    UserDetailsModel? loginApi = await SharedPrefs().getLoginData();
    Map<String, String> apiHeader = {
      'Authorization': 'Bearer ${loginApi?.token?.access ?? ""}',
      'Content-Type': 'application/json',
    };
    Map<String, dynamic> body = {"product_id": productID};

    try {
      var request = http.Request('POST', Uri.parse(url));
      request.body = (json.encode(body));
      request.headers.addAll(apiHeader);

      http.StreamedResponse response = await request.send();
      var respString = await response.stream.bytesToString();
      print("json.decode(respString)${json.decode(respString)}");
      var responseData = json.decode(respString);

      if (responseData["message"]=="Product added to favorites") {
        Get.snackbar(
          'Success',
          "Product added to favorites Successfully",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 2),
          borderRadius: 15,
          isDismissible: true,
          colorText: Colors.white,
          animationDuration: const Duration(milliseconds: 200),
        );
      } else if(responseData["message"]=="Product removed from favorites") {
        Get.snackbar(
          'Success',
          "Product removed from favorites successfully",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 2),
          borderRadius: 15,
          isDismissible: true,
          colorText: Colors.white,
          animationDuration: const Duration(milliseconds: 200),
        );
      }
      else{
        Get.snackbar(
          'Failed',
          "Something went wrong",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

      }
      return {};

    } catch (e) {
      throw Exception("Service Error");
    }
  }

  static Future<List<dynamic>> wishListItems() async {
    String url = ApiConstants.wishListItemsApi;
    print(url);

    UserDetailsModel? loginApi = await SharedPrefs().getLoginData();
    Map<String, String> apiHeader = {
      'Authorization': 'Bearer ${loginApi?.token?.access ?? ""}',
      'Content-Type': 'application/json',
    };
    try {
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll(apiHeader);
      http.StreamedResponse response = await request.send();
      var respString = await response.stream.bytesToString();

      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error");
    }
  }

  static Future<List<dynamic>> searchData(String searchData) async {
    String url = ApiConstants.searchApi;
    print(url);

    Map apiBody = {
      "query": searchData,
    };
    UserDetailsModel? loginApi = await SharedPrefs().getLoginData();
    Map<String, String> apiHeader = {
      'Authorization': 'Bearer ${loginApi?.token?.access ?? ""}',
      'Content-Type': 'application/json',
    };
    try {
      var request = http.Request('POST', Uri.parse(url));
      request.body = (json.encode(apiBody));
      request.headers.addAll(apiHeader);
      http.StreamedResponse response = await request.send();
      var respString = await response.stream.bytesToString();

      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error");
    }
  }
}
