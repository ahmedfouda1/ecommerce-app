import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/controllers/location_controller.dart';
import 'package:ecommerce_app/controllers/popular_product_controller.dart';
import 'package:ecommerce_app/data/api/api_client.dart';
import 'package:ecommerce_app/data/repository/auth_repo.dart';
import 'package:ecommerce_app/data/repository/cart_repo.dart';
import 'package:ecommerce_app/data/repository/location_repo.dart';
import 'package:ecommerce_app/data/repository/popular_product_repo.dart';
import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/cart_controller.dart';
import '../controllers/recommended_product_controller.dart';
import '../controllers/user_controller.dart';
import '../data/repository/recommended_product_repo.dart';
import '../data/repository/user_repo.dart';

Future<void> init() async{
  final sharePreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharePreferences);
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.Base_Url,sharedPreferences:Get.find()));
  Get.lazyPut(() => AuthRepo(apiClient: Get.find(),sharedPreferences: Get.find() ));
  Get.lazyPut(() => UserRepo(apiClient: Get.find()));
  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  Get.lazyPut(() => LocationRepo(apiClient:Get.find(),sharedPreferences: Get.find()));

  //controllers
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  Get.lazyPut(() => LocationController(locationRepo: Get.find()));

}