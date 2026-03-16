import 'package:b_shopping/models/product_models.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  // Maps product id → {product, quantity}
  final Map<int, Map<String, dynamic>> _cartItems = {};

  Map<int, Map<String, dynamic>> get cartItems => _cartItems;

  void addToCart(Product product) {
    if (_cartItems.containsKey(product.id)) {
      _cartItems[product.id]!['quantity']++;
    } else {
      _cartItems[product.id] = {'product': product, 'quantity': 1};
    }
    notifyListeners();
  }

  void removeFromCart(Product product) {
    if (!_cartItems.containsKey(product.id)) return;

    if (_cartItems[product.id]!['quantity'] > 1) {
      _cartItems[product.id]!['quantity']--;
    } else {
      _cartItems.remove(product.id);
    }
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  int get totalItemCount =>
      _cartItems.values.fold(0, (sum, item) => sum + (item['quantity'] as int));

  double get totalPrice => _cartItems.values.fold(
    0.0,
    (sum, item) =>
        sum + (item['product'] as Product).price * (item['quantity'] as int),
  );
}
