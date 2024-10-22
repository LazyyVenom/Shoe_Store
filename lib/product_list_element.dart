import "package:flutter/material.dart";
import 'package:shoe_seller/global_vars.dart';
import 'package:shoe_seller/product_card.dart';
import 'package:shoe_seller/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const ['All', 'Addidas', 'Nike', 'Bata'];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    'Shoe\nCollection',
                    style: TextStyle(
                      fontSize: 35,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(50),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 120,
                child: ListView.builder(
                    itemCount: filters.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final String filter = filters[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedFilter = filter;
                            });
                          },
                          child: Chip(
                            padding: const EdgeInsets.all(10),
                            label: Text(filter),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            backgroundColor: selectedFilter == filter
                                ? Colors.amber
                                : Colors.white,
                          ),
                        ),
                      );
                    }),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context , index) {
                    final title = products[index]['title'];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                          return ProductDetailsPage(product: products[index]);
                        },)
                        );
                    },
                    child: ProductCard(
                      title: title as String,
                      price: products[index]['price'] as double,
                      image: products[index]['imageUrl'] as String
                      ),
                  );
                }),
              )
            ],
          ),
        ),
      );
  }
}