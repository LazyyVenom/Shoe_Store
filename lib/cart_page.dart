import "package:flutter/material.dart";
import "package:shoe_seller/global_vars.dart";

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart",style: Theme.of(context).textTheme.headlineLarge),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context,index) {
          final cartItem = cart[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imageUrl'] as String),
              radius: 30,
              ),
            trailing: IconButton(
              onPressed: () {
                
              },
              icon: const Icon(Icons.delete),
              color: Colors.red,
              ),
            title: Text(
              cartItem['title'] as String
            ),
            subtitle: Text(
              cartItem['size'].toString()
            ),
          );
      })
      );
  }
}