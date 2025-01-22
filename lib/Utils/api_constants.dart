class ApiConstants {
  static final ApiConstants _instance = ApiConstants._internal();

  ApiConstants._internal();

  factory ApiConstants() {
    return _instance;
  }
  static String phoneNumberApi = "https://admin.kushinirestaurant.com/api/verify/";
  static String userDetailsApi = "https://admin.kushinirestaurant.com/api/login-register/";
  static String productDetailsApi = "https://admin.kushinirestaurant.com/api/products/";
  static String bannerApi = "https://admin.kushinirestaurant.com/api/banners/";
  static String profileApi = "https://admin.kushinirestaurant.com/api/user-data/";
  static String wishListApi = "https://admin.kushinirestaurant.com/api/add-remove-wishlist/";
  static String wishListItemsApi = "https://admin.kushinirestaurant.com/api/wishlist/";
  static String searchApi = "https://admin.kushinirestaurant.com/api/search/";

}