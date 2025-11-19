import 'package:football_shop_mobile/screens/menu.dart';
import 'package:football_shop_mobile/screens/productlist_form.dart';
import 'package:flutter/material.dart';
import 'package:football_shop_mobile/screens/product_entry_list.dart';
// import 'package:football_news_mobile/screens/newslist_form.dart';


class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
                color: Colors.blue,
                ),
                child: Column(
                  children: [
                    Text(
                      'Football Shop',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    Text("Seluruh barang sepak bola tersedia di sini!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    fontSize: 15,
                    color: Colors.white70,
                    fontWeight: FontWeight.normal,
                        )
                    ),
                  ],
                ),
            ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Halaman Utama'),
              // Bagian redirection ke MyHomePage
              onTap: () {
                Navigator.pop(context); 
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MenuPage(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.post_add),
              title: const Text('Tambah Produk'),
              // Bagian redirection ke NewsFormPage
              onTap: () {
                Navigator.pop(context); 
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductFormPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_reaction_rounded),
              title: const Text('Product List'),
              onTap: () {
                  // Route to news list page
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProductEntryListPage()),
                  );
              },
          ),
        ],
      ),
    );
  }
}