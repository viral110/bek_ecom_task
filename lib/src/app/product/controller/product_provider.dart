import 'dart:convert';
import 'package:bek_task/src/app/product/model/product_model.dart';
import 'package:bek_task/src/common/constant/api_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final productProvider = FutureProvider<List<Product>>((ref) async {
  final response =
      await http.get(Uri.parse(ApiHelper.productListAPI));
  if (response.statusCode == 200) {
    List data = json.decode(response.body);
    return data.map((item) => Product.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load products');
  }
});


