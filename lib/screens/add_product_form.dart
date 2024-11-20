import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:merchzie/main.dart';
import 'package:merchzie/screens/login.dart';
import 'package:merchzie/widgets/left_drawer.dart';
import 'package:provider/provider.dart';

class AddProductForm extends StatefulWidget {
  const AddProductForm({super.key});

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final _formKey = GlobalKey<FormState>();
  String _productName = '';
  int? _productStock;
  String _productDescription = '';

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Form Tambah Produk'),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Product Name Field
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nama Produk',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _productName = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama produk tidak boleh kosong';
                    } else if (value.length < 3) {
                      return 'Nama produk minimal 3 karakter';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                // Product Stock Field
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Jumlah Stok Produk',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      _productStock = int.tryParse(value);
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Jumlah stok produk tidak boleh kosong';
                    }
                    final stock = int.tryParse(value);
                    if (stock == null || stock < 0) {
                      return 'Jumlah stok harus berupa angka positif';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                // Product Description Field
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Deskripsi Produk',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _productDescription = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Deskripsi produk tidak boleh kosong';
                    } else if (value.length < 10) {
                      return 'Deskripsi produk minimal 10 karakter';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                // Buttons for Back and Submit
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // Aksi tombol Back
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey, // Warna tombol Back
                      ),
                      child: const Text('Back'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // Kirim data ke Django dan tunggu respons
                          final response = await request.postJson(
                            "http://127.0.0.1:8000/create-flutter/",
                            jsonEncode(<String, dynamic>{
                              'product_name': _productName,
                              'product_stock': _productStock.toString(),
                              'product_description': _productDescription,
                            }),
                          );

                          if (context.mounted) {
                            if (response['status'] == 'success') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Produk baru berhasil ditambahkan!"),
                                ),
                              );
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MyHomePage(title: ''),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Terdapat kesalahan, silakan coba lagi."),
                                ),
                              );
                            }
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, // Warna tombol Submit
                      ),
                      child: const Text('Submit'),
                    ),
                  ],
                ),
                // Add the Logout logic here if needed:
                ElevatedButton(
                  onPressed: () async {
                    // Assuming the logout action occurs here
                    final response = await request.logout(
                      "http://127.0.0.1:8000/auth/logout/", // Adjust URL here
                    );
                    String message = response["message"];
                    if (context.mounted) {
                      if (response['status']) {
                        String uname = response["username"];
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("$message Sampai jumpa, $uname."),
                        ));
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(message),
                          ),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Logout button color
                  ),
                  child: const Text('Logout'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
