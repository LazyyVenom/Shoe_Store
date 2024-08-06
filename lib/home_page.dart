import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Shoe\nCollection',
                style: TextStyle(
                  fontSize: 35, 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
