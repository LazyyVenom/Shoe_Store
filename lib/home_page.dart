import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<String> filters = const ['All', 'Addidas', 'Nike', 'Bata'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Shoe\nCollection',
                    style: TextStyle(
                      fontSize: 35,
                    ),
                  ),
                  const Expanded(
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
            ],
          ),
        ),
      ),
    );
  }
}
