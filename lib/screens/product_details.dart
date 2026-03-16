import 'package:b_shopping/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_models.dart';
import '../providers/cart_provider.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final cartEntry = cart.cartItems[product.id];
    final int quantity = cartEntry?['quantity'] ?? 0;
    final bool inCart = quantity > 0;
    final int cartCount = cart.totalItemCount;

    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        centerTitle: true,
        title: const Text("Product Details"),
        backgroundColor: Colors.green[900],
        foregroundColor: Colors.white,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CartScreen()),
                  );
                },
              ),

              if (cartCount > 0)
                Positioned(
                  right: 5,
                  top: 5,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      "$cartCount",
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),

      body: Column(
        children: [
          /// PRODUCT IMAGE SECTION
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.white),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                product.image,
                height: 220,
                fit: BoxFit.contain,
              ),
            ),
          ),

          /// PRODUCT DETAILS
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(25),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TITLE
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// PRICE
                  Row(
                    children: [
                      Text(
                        "₹${product.price.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800],
                        ),
                      ),

                      const SizedBox(width: 10),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green[100],
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          "Best Price",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// DESCRIPTION TITLE
                  const Text(
                    "Product Description",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),

                  const SizedBox(height: 8),

                  /// DESCRIPTION
                  Text(
                    product.description,
                    style: const TextStyle(color: Colors.black87, height: 1.4),
                  ),

                  const Spacer(),

                  /// ADD TO CART BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: inCart
                        ? Container(
                            decoration: BoxDecoration(
                              color: Colors.green[900],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                  onPressed: () => cart.removeFromCart(product),
                                ),

                                Text(
                                  "$quantity in cart",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                IconButton(
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  onPressed: () => cart.addToCart(product),
                                ),
                              ],
                            ),
                          )
                        : ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[900],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () => cart.addToCart(product),
                            icon: const Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                            ),
                            label: const Text(
                              "Add to Cart",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
