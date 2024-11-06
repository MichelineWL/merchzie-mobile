# merchzie

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
"# merchzie-mobile" 

Tugas 1 
Nama : Micheline Wijaya Limbergh
NPM : 2306207013
Kelas : PBP D 

1. Stateless widget --> widget yang tidak mengalami perubahan (Widget statis)
   Contoh : text paragraph
   Stateful widget --> widget yang mengalami perubahan dinamis
   Contoh : ketika button counter dipencet, tulisan counter : 1 akan increment berdasarkan intensitas
   pemencetan button tersebut
2. Widget yang saya gunakan:
   1. MaterialApp : widget utama untuk membuat aplikasi flutter berbasis material design
   2. Scaffold : struktur dasar untuk app bar, body, dan floating action button
   3. AppBar : untuk nampilin bar di paling atas 
   4. Center : konten terletak di tengah layar
   5. Column : untuk layouting secara vertikal
   6. ElevatedButton.icon : button dengan icon dan text
   7. SnackBar : untuk nampilin notifikasi ketika pengguna mencet tombol (event)
3. Fungsi setState() digunakan untuk ngasih tau flutter bahwa ada perubahan pada state widget sehingga
   pelu di reload atau rebuild karena ada pembaruan tampilan.
4. Perbedaan const dan final adalah const menandakan nilai dari variabel tetap konstan saat dicompile
   dan gabisa dirubah saat runtime, sedangkan final hanya bisa ditentukan sekali dan tetap setelah
   diinisialisasi, dimana dia juga bisa diatur selama runtime.
5. Cara mengimplementasikan : 
   1. Buat proyek baru "Merchzie"
   2. Buat github
   3. Buat menu.dart untuk rapiin struktur
   4. Ganti color 
   5. Buat tiga tombol memakai widget ElevatedButton.icon
   6. Buat snackbar 
   7. Manggil snackbar di tiap tombol dimana ketika onPressed dia bakal dipanggil
   8. Git add comit pull push

