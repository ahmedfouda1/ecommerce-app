class AppConstants{
  static const String App_Name = "DBFood";
  static const int App_Version = 1;

  static const String Base_Url = "http://10.0.2.2:8000 ";
  static const String Popular_Product_Uri = "/api/v1/products/popular";
  static const String Recommended_Product_Uri = "/api/v1/products/recommended";
  static const String upload_Url = "/uploads/";

  //user and auth end points
  static const String REGISTRATION_URI = "/api/v1/auth/register";
  static const String LOGIN_URI = "/api/v1/auth/login";
  static const String USER_INFO_URI = "/api/v1/customer/info";

  //new
  static const String USER_ADDRESS = "user-address";
  static const String ADD_USER_ADDRESS = "/api/v1/customer/address/add";
  static const String ADDRESS_LIST_URI = "/api/v1/customer/address/list";
  static const String GEOCODE_URI = "/api/v1/config/geocode-api";

  static const String Token = "";
  static const String PHONE = "";
  static const String PASSWORD = "";
  static const String CART_LIST = "cart-list";
  static const String CART_HISTORY_LIST = "cart-history-list";
}