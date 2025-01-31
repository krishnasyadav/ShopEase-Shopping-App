import 'package:flutter/material.dart';

import 'package:shopease_app/categories_screen.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<String> categories = [
    "Shirts",
    "Jeans",
    "T-Shirts",
    "Shoes",
    "Laptop",
    "Electronics",
    "Books"
  ];
  final List<String> offers = ["50% Off on Shoes", "Buy 1 Get 1 Free"];
  final List<String> categoriesImages = [
    "assets/images/shirt.png",
    "assets/images/jeans.png",
    "assets/images/tshirt.png",
    "assets/images/shoes.png",
    "assets/images/laptop1.png",
    "assets/images/trimmer1.png",
    "assets/images/book1.png"
  ];

  final List<String> products = [
    "Nikon Camera",
    "Levi's Jeans",
    "White T-Shirt",
    "Hp Laptop",
    "Harry Potter Book",
    "vega Trimmer"
  ];

  final List<String> productImages = [
    "assets/images/camera1.png",
    "assets/images/jeans.png",
    "assets/images/tshirt.png",
    "assets/images/laptop1.png",
    "assets/images/book1.png",
    "assets/images/trimmer1.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ShopEase",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search products...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text("Categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  categories.length,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        Image.asset(categoriesImages[index], height: 50),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CategoryScreen(categories[index]),
                              ),
                            );
                          },
                          child: Text(categories[index]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 150,
                            width: 150,
                            child: Image.asset(productImages[index])),
                        Text(
                          products[index],
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content:
                                    Text("${products[index]} added to cart")));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                            foregroundColor: Colors.white,
                          ),
                          child: Text("Add to Cart"),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
