import 'package:flutter/material.dart';
import 'package:module7_assignment/cart_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductList(),
    );
  }
}

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Map<String, dynamic>> productInfo = [
    {"p_name": "Product 1", "price": 50, "counter": 0},
    {"p_name": "Product 2", "price": 20, "counter": 0},
    {"p_name": "Product 3", "price": 30, "counter": 0},
    {"p_name": "Product 4", "price": 40, "counter": 0},
    {"p_name": "Product 5", "price": 15, "counter": 0},
    {"p_name": "Product 6", "price": 55, "counter": 0},
    {"p_name": "Product 7", "price": 95, "counter": 0},
    {"p_name": "Product 8", "price": 20, "counter": 0},
    {"p_name": "Product 9", "price": 39, "counter": 0},
    {"p_name": "Product 10", "price": 23, "counter": 0},
    {"p_name": "Product 11", "price": 73, "counter": 0},
    {"p_name": "Product 12", "price": 60, "counter": 0},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: productInfo.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("${productInfo[index]["p_name"]}"),
              subtitle:
                  Text("\$${productInfo[index]["price"].toStringAsFixed(2)}"),
              trailing: Column(
                children: [
                  Text("Counter: ${productInfo[index]["counter"]}"),
                  SizedBox(
                    height: 25,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          productInfo[index]["counter"] += 1;
                          if (productInfo[index]["counter"] == 5) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("Congratulations!"),
                                    content: Text(
                                        "You've bought 5 ${productInfo[index]["p_name"]}!"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("OK")),
                                    ],
                                  );
                                });
                          }
                        });
                      },
                      child: const Text(
                        "Buy Now",
                        style: TextStyle(
                          height: 0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          num totalProductBought = 0;
          for (int i = 0; i < productInfo.length; i++) {
            totalProductBought += productInfo[i]["counter"];
          }
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => CartPage(totalProductBought)));
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
