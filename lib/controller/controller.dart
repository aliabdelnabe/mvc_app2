//get-state
import 'package:get/state_manager.dart';
import 'package:mvc_app/model/product.dart';
import 'package:mvc_app/services/services.dart';


class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } finally {isLoading(false);}
  }
}