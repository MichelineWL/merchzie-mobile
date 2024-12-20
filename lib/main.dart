import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:merchzie/widgets/left_drawer.dart'; // Pastikan mengimpor LeftDrawer
import 'package:merchzie/screens/add_product_form.dart'; // Impor halaman form produk
import 'package:merchzie/screens/list_productentry.dart'; // Impor halaman daftar produk

class CookieRequest {
  get(String s) {}

  postJson(String s, String jsonEncode) {}

  logout(String s) {}
  // Tambahkan logika CookieRequest sesuai kebutuhan.
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Merchzie App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple)
              .copyWith(secondary: Colors.deepPurple[400]),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: const LeftDrawer(), // Tambahkan ini agar LeftDrawer muncul
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: () {
                // Navigasi ke halaman ListProductEntry
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ListProductEntry(),
                  ),
                );
              },
              icon: const Icon(Icons.list),
              label: const Text("Lihat Daftar Produk"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                // Navigasi ke halaman form Tambah Produk
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddProductForm(),
                  ),
                );
              },
              icon: const Icon(Icons.add),
              label: const Text("Tambah Produk"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                _showSnackbar(context, "Kamu telah menekan tombol Logout");
              },
              icon: const Icon(Icons.logout),
              label: const Text("Logout"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}

class ListProductEntry extends StatelessWidget {
  const ListProductEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Produk'),
      ),
      body: Center(
        child: const Text('Ini adalah halaman Daftar Produk'),
      ),
    );
  }
}
