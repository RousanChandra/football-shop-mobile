import 'package:flutter/material.dart';
import 'package:football_shop_mobile/screens/myproduct.dart';
import 'package:football_shop_mobile/widgets/left_drawer.dart';
import 'package:football_shop_mobile/screens/productlist_form.dart';
import 'package:football_shop_mobile/screens/product_entry_list.dart';
import 'package:football_shop_mobile/screens/login.dart'; // pastikan path ini benar
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  // Handler logout async: akan mengarahkan ke LoginPage() kalau sukses
  Future<void> _handleLogout(BuildContext context, CookieRequest request) async {
    try {
      // GANTI URL INI sesuai app Django kamu (ingat trailing slash)
      // Jika pakai Android emulator -> gunakan http://10.0.2.2:8000/auth/logout/
      final response = await request.logout("http://localhost:8000/auth/logout/");

      final message = response["message"] ?? "No response message";

      if (response['status'] == true) {
        final uname = response["username"] ?? "";
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("$message See you again, $uname."),
            behavior: SnackBarBehavior.floating,
          ));
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        }
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(message),
            behavior: SnackBarBehavior.floating,
          ));
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Logout failed: $e"),
          behavior: SnackBarBehavior.floating,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Football Shop'),
        centerTitle: true,
      ),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.list),
                label: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 14.0),
                  child: Text('All Products', style: TextStyle(fontSize: 16)),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  _showSnackBar(context, 'Kamu telah menekan tombol All Products');
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ProductEntryListPage()));
                },
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.person),
                label: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 14.0),
                  child: Text('My Products', style: TextStyle(fontSize: 16)),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyProductsPage(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.add_box),
                label: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 14.0),
                  child: Text('Create Product', style: TextStyle(fontSize: 16)),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  _showSnackBar(context, 'Kamu telah menekan tombol Create Product');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProductFormPage()),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),

            // Logout button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                icon: const Icon(Icons.logout),
                label: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 14.0),
                  child: Text('Logout', style: TextStyle(fontSize: 16)),
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () => _handleLogout(context, request),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
