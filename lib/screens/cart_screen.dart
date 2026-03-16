// ignore_for_file: deprecated_member_use

import 'package:b_shopping/models/product_models.dart';
import 'package:b_shopping/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final cartEntries = cart.cartItems.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BEE SHOP",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.green[900],
        foregroundColor: Colors.white,
        actions: [
          if (cartEntries.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_sweep),
              tooltip: "Clear Cart",
              onPressed: () => _confirmClearCart(context, cart),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: cartEntries.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      size: 64,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 12),
                    Column(
                      children: [
                        Text(
                          "Your cart is empty",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[900],
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              );
                            },
                            child: SizedBox(
                              width: double.infinity,
                              height: 40,
                              child: Row(
                                mainAxisAlignment: .center,
                                children: [
                                  Icon(Icons.add, size: 22),
                                  SizedBox(width: 10),
                                  Text(
                                    "Add Products",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartEntries.length,
                      itemBuilder: (context, index) {
                        final entry = cartEntries[index];
                        final Product product = entry['product'] as Product;
                        final int quantity = entry['quantity'] as int;

                        return Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                // Product Image
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    product.image,
                                    width: 70,
                                    height: 70,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, _, _) => Container(
                                      width: 70,
                                      height: 70,
                                      color: Colors.grey.shade200,
                                      child: const Icon(
                                        Icons.broken_image,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),

                                // Title & Price
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.title,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        "₹${(product.price * quantity).toStringAsFixed(2)}",
                                        style: TextStyle(
                                          color: Colors.green[900],
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Quantity Controls
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.remove_circle_outline,
                                        color: Colors.green[900],
                                      ),
                                      onPressed: () =>
                                          cart.removeFromCart(product),
                                    ),
                                    Text(
                                      "$quantity",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.add_circle_outline,
                                        color: Colors.green[900],
                                      ),
                                      onPressed: () => cart.addToCart(product),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // Total & Checkout
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 8,
                          offset: const Offset(0, -2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Total",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "₹${cart.totalPrice.toStringAsFixed(2)}",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[900],
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            cart.clearCart();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Order placed successfully!"),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[900],
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 14,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            "Checkout",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  void _confirmClearCart(BuildContext context, CartProvider cart) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Clear Cart"),
        content: const Text("Remove all items from your cart?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              cart.clearCart();
              Navigator.pop(context);
            },
            child: const Text("Clear", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
