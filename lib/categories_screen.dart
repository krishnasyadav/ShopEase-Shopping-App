import 'package:flutter/material.dart';

import 'package:shopease_app/product_list.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen(this.category, {super.key});
  final String category;

  final Map<String, List<String>> subCategories = {
    "Shirts": ["Casual", "Formal", "Printed"],
    "Jeans": ["Slim Fit", "Regular Fit"],
    "T-Shirts": ["Graphic", "Plain", "Polo"],
    "Shoes": ["Sneakers", "Formal", "Sports"],
    "Laptop": ["MacBook", "Gaming", "Coding"],
    "Electronics": ["Trimmer", "Mixer Grinders", "Camera"],
    "Books": ["Novel", "Science", "Mythology"],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category)),
      body: ListView(
        children: subCategories[category]!
            .map((sub) => ListTile(
                  title: Text(sub),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductListScreen(sub)),
                    );
                  },
                ))
            .toList(),
      ),
    );
  }
}
