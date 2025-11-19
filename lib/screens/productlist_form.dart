import 'package:flutter/material.dart';
import 'package:football_shop_mobile/widgets/left_drawer.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:football_shop_mobile/screens/menu.dart';

class ProductFormPage extends StatefulWidget {
    const ProductFormPage({super.key});

    @override
    State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 0;
  String _description = "";
  String _category = "bola sepak"; // default
  String _thumbnail = "";
  bool _isFeatured = false; // default

  final List<String> _categories = [
      'bola sepak',
      'bola latihan',
      'pakaian',
      'sepatu sepak bola',
      'aksesoris',
      'gawang',
   ];

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text(
              'Add Product Form',
            ),
          ),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
        drawer:LeftDrawer(),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
            // === Name ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama Produk",
                    labelText: "Nama Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Produk tidak boleh kosong!";
                    }
                    return null;
                      },
                    ),
                  ),
                // price  
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Harga Produk",
                      labelText: "Harga Produk (Rp)",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (String? value) {
                      setState(() {
                        _price = int.tryParse(value ?? "0") ?? 0;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Harga produk tidak boleh kosong!";
                      }
                      if (int.tryParse(value) == null) {
                        return "Harga harus berupa angka!";
                      }
                      return null;
                    },
                  ),
                ),
                // deskripsi
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "Deskripsi Produk",
                      labelText: "Deskripsi Produk",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _description = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Deskripsi produk tidak boleh kosong!";
                      }
                      return null;
                    },
                  ),
                ),
                // === Category ===
                Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: DropdownButtonFormField<String>(
                   decoration: InputDecoration(
                     labelText: "Kategori",
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(5.0),
                     ),
                   ),
                   value: _category,
                   items: _categories
                       .map((cat) => DropdownMenuItem(
                             value: cat,
                             child: Text(
                                 cat[0].toUpperCase() + cat.substring(1)),
                           ))
                       .toList(),
                   onChanged: (String? newValue) {
                     setState(() {
                       _category = newValue!;
                     });
                   },
                 ),
            )   ,
                // === Thumbnail URL ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "URL Thumbnail (opsional)",
                      labelText: "URL Thumbnail",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _thumbnail = value ?? "";
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) return null; // boleh kosong
                      // pola URL sederhana
                      final urlPattern = RegExp(r'^(https?:\/\/)[\w\-]+(\.[\w\-]+)+[/#?]?.*$');
                      if (!urlPattern.hasMatch(value)) {
                        return "Masukkan URL yang valid (harus diawali http:// atau https://)";
                      }
                      return null;
                    },
                  ),
                ),
                  // === Is Featured ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SwitchListTile(
                    title: const Text("Tandai sebagai Produk Terbaik"),
                    value: _isFeatured,
                    onChanged: (bool value) {
                      setState(() {
                        _isFeatured = value;
                       });
                     },
                   ),
                ),
                // === Tombol Simpan ===
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.indigo),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // TODO: Replace the URL with your app's URL
                          // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
                          // If you using chrome,  use URL http://localhost:8000
                          
                          final response = await request.postJson(
                            "http://localhost:8000/create-flutter/",
                            jsonEncode({
                              "name": _name,
                              "description": _description,
                              "price":_price,
                              "thumbnail": _thumbnail,
                              "category": _category,
                              "is_featured": _isFeatured,
                            }),
                          );
                          if (context.mounted) {
                            if (response['status'] == 'success') {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Product successfully saved!"),
                              ));
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MenuPage()),
                              );
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Something went wrong, please try again."),
                              ));
                            }
                          }
                        }
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ]
            )
          ),
        ),
      );
    }
}