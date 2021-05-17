import 'package:get/state_manager.dart';
import 'package:shopping_app_rest_api/models/product.dart';
import 'package:shopping_app_rest_api/services/remote_service.dart';
class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = List<Product>().obs;


  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteService.fetchProduct();
      if (products != null) {
        // ignore: deprecated_member_use
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}