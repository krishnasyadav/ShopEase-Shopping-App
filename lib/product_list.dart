import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  final String subCategory;
  ProductListScreen(this.subCategory, {super.key});

  final List<String> products = [
    "Product 1",
    "Product 2",
    "Product 3",
    "Product 4",
    'Product 5',
    "Product 6",
    "Product 7",
    "Product 8",
    "Product 9",
    "Product 10",
  ];

  final List<String> productsImages = [
    "assets/images/book1.png",
    "assets/images/book2.png",
    "assets/images/book3.png",
    "assets/images/camera1.png",
    "assets/images/jeans.png",
    "assets/images/laptop1.png",
    "assets/images/laptop2.png",
    "assets/images/laptop3.png",
    "assets/images/mixerGrinder.png",
    "assets/images/shirt.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(subCategory)),
      body: GridView.builder(
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
                    child: Image.asset(productsImages[index])),
                Text(
                  products[index],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("${products[index]} added to cart")));
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
    );
  }
}
