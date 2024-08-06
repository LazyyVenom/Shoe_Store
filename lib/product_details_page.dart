import "package:flutter/material.dart";

class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailsPage({
    super.key,
    required this.product
    });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late int selectedSize;

  @override
  void initState() {
    super.initState();
    selectedSize = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(
            widget.product['title'] as String,
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
          const Spacer(),
          Image.asset(widget.product['imageUrl'] as String),
          const Spacer(),
          Container(
            height: 250,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 168, 165, 165),
              borderRadius: BorderRadius.vertical(top: Radius.circular(50))
            ),
            child: Column(
              children: [
                Text(
                  '\$${widget.product['price'] as double}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<int>).length,
                    itemBuilder: (context,index) {
                      final size = (widget.product['sizes'] as List<int>)[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          child: Chip(
                            label: Text(size.toString()),
                            backgroundColor: selectedSize == size
                                  ? Colors.amber
                                  : Colors.white,
                            ),
                        ),
                      );
                  }),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (selectedSize == 0) {
                      print("Nothing Selected");
                    }
                  }, 
                  child: const Text("Add to Cart"),
                  )
              ],
           ), 
          )
        ],
      ),
    );
  }
}