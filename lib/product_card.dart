import "package:flutter/material.dart";

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.image
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: 
      [
        Text(title),
        const SizedBox(height: 5,),
        Text('\$$price'),
        const SizedBox(height: 5,),
        Image(image: AssetImage(image))
      ]),
    );
  }
}