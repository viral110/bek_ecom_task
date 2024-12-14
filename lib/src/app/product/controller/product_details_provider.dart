import 'dart:convert';
import 'package:bek_task/src/app/product/model/product_details_model.dart';
import 'package:http/http.dart' as http;

class ProductDetailsNotifier {
  List<ProductDetails> productDetailList = [];

  Future<void> getProductDetails(String id) async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products/$id'));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      productDetailList =
          data.map((item) => ProductDetails.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
