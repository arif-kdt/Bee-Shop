import 'dart:convert';
import 'package:b_shopping/models/product_models.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String url = "https://fakestoreapi.com/products";

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }
}
