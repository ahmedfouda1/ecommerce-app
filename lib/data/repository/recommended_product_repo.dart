import 'package:ecommerce_app/data/api/api_client.dart';
import 'package:get/get.dart';

import '../../utils/app_constants.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(AppConstants.Recommended_Product_Uri);
  }
}