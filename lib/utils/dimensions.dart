import 'package:get/get.dart';

class Dimensions{
  static final double screenHight = Get.context!.height;
  static final double screenWidth = Get.context!.width;

  static final double pageView = screenHight/2.64;
  static final double pageViewController = screenHight/3.84;
  static final double pageViewTextController = screenHight/7.03;

  static double height10 = screenHight/84.4;
  static double height15 = screenHight/56.27;
  static double height20 = screenHight/42.2;
  static double height30 = screenHight/28.13;
  static final double height45 = screenHight/18.76;

  static double width10 = screenWidth/84.4;
  static double width15 = screenWidth/56.27;
  static double width20 = screenWidth/42.2;
  static double width30 = screenWidth/28.13;

  static double font16 = screenHight/52.75;
  static double font20 = screenHight/42.2;
  static double font26 = screenHight/32.46;

  static double radius15 = screenHight/56.27;
  static double radius20 = screenHight/42.2;
  static double radius30 = screenHight/28.13;

  static double iconsize24 = screenHight/35.17;
  static double iconsize16 = screenHight/52.75;


  static double listViewImgSize = screenWidth/3.25;
  static double listViewTextContSize = screenHight/3.9;


  static double popularFoodImgSize = screenHight/2.41;

  //bottom height

  static double bottomHightBar = screenHight/7.03;

  //splash screen dimensions

  static double splashImg = screenHight/3.38;

}