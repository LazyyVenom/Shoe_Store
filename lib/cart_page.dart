import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:shoe_seller/cart_provider.dart";

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Cart",
              style: Theme.of(context).textTheme.headlineLarge),
        ),
        body: ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final cartItem = cart[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(cartItem['imageUrl'] as String),
                  radius: 30,
                ),
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Delete Product?!"),
                          content: const Text("Product will be removed!"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                }, child: const Text("No")),
                            TextButton(
                                onPressed: () {
                                  context.read<CartProvider>().removeProduct(
                                    cartItem
                                  );
                                  Navigator.of(context).pop();
                                }, child: const Text("Yes"))
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.delete),
                  color: Colors.red,
                ),
                title: Text(cartItem['title'] as String),
                subtitle: Text(cartItem['size'].toString()),
              );
            }));
  }
}
