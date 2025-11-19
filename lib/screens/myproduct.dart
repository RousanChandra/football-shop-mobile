import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class MyProductsPage extends StatefulWidget {
  const MyProductsPage({super.key});

  @override
  State<MyProductsPage> createState() => _MyProductsPageState();
}

class _MyProductsPageState extends State<MyProductsPage> {
  List<dynamic> products = [];
  bool loading = true;

  Future<void> fetchProducts() async {
    final request = context.read<CookieRequest>();
    final response = await request.get("http://localhost:8000/my-products/");

    setState(() {
      products = response;
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Products")),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : products.isEmpty
              ? const Center(child: Text("You have no products."))
              : ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final p = products[index];
                    return Card(
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Price: ${p["price"]}"),
                              Text("Category: ${p["category"] ?? '-'}"),
                              Text("Featured: ${p["isFeatured"] == true ? 'YES' : 'NO'}"),
                              const SizedBox(height: 5),
                              Text(
                                p["description"] ?? "",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                      ),
                    );
                  },
                ),
    );
  }
}
