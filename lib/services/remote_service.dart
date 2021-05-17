import 'package:http/http.dart' as http;
import 'package:shopping_app_rest_api/models/product.dart';
class RemoteService{
  static var client=http.Client();
  static Future<List<Product>> fetchProduct() async {
    var response=await client.get(
      'http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'
    );
    if(response.statusCode==200){
      var jsonString=response.body;
      return productFromJson(jsonString);
    }else{
      return null;
    }

  }
}