import 'package:get/get.dart';

import '../data/repository/recommended_product_repo.dart';
import '../models/product_model.dart';

class RecommendedProductController extends GetxController{
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({required this.recommendedProductRepo});

  List<dynamic> _recommendedProductList=[];
  List<dynamic> get recommendedProductList=> _recommendedProductList;

  bool _isLoaded = false;
  bool get isloaded=> _isLoaded;

  Future<void> getRecommendedProductList() async{
    Response response = await recommendedProductRepo.getRecommendedProductList();
    if(response.statusCode==200){
      print(_recommendedProductList);
      _recommendedProductList=[];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    }else{

      print("could not get products recommended");
    }
  }
}