import 'package:b_shopping/models/product_models.dart';
import 'package:b_shopping/services/api_services.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<Product> _products = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchProducts() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _products = await _apiService.fetchProducts();
    } catch (e) {
      _errorMessage = "Failed to load products. Please try again.";
      debugPrint(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
