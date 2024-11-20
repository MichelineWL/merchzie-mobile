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

Tugas 7 
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

Tugas 8 
Nama : Micheline Wijaya Limbergh
NPM : 2306207013
Kelas : PBP D 

1. Const pada flutter berfungsi sebagai tempat untuk membuat objek yang akan dipakai berulang kali dengan tujuan flutter 
   tidak perlu membuat objek ketika build dilakukan. Dengan demikian, mengurangi memori dan mengefektifkan SEO.Const 
   digunakan saat kita membuat widget yang valuenya konstan seperti teks statis, icon, dan lainnya. Jangan digunakan saat
   widget yang dibuat dinamis seperti teks yang menampilkan counter yang akan berubah sesuai counter
2. Column dan Row digunakan untuk layouting UI dimana elemen akan diurukan secara vertikal atau horizontal. 
   Contoh implementasi layout column : 
   Column(
      children: [
         Text("Nama Produk"),
         TextFormField(),
         SizedBox(height: 16),
         ElevatedButton(onPressed: () {}, child: Text("Submit"))
      ],
   )
   Contoh implementasi layout row : 
   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         ElevatedButton(onPressed: () {}, child: Text("Back")),
         ElevatedButton(onPressed: () {}, child: Text("Submit")),
      ],
   )
3. Elemen input yang aku gunakan pada halaman form yang aku buat pada tugas kali ini : 
   TextFormField untuk name, amount, dan description product
   Yang tidak aku gunakan pada tugas ini : 
   Checkbox, Radiobutton, Switch
4. Cara atur theme dalam aplikasi flutter agar aplikasi yang dibuat konsisten:
   Saya mengimplementasikan tema pada aplikasi yang saya buat dengan menggunakan ThemeData dalam Material App berwarna ungu 
5. Cara menangani navigasi dalam aplikasi dengan banyak halaman pada flutter : 
   Flutter menggunakan stack dimana akan ada navigator.push dan navigator,pushReplacement
 

Tugas 9 
Nama : Micheline Wijaya Limbergh
NPM : 2306207013
Kelas : PBP D 

1. **Model untuk Pengambilan/Pengiriman Data JSON**  
   Membuat model untuk pengambilan atau pengiriman data JSON mempermudah pengelolaan dan validasi data. Dengan model, kita dapat memastikan bahwa data yang dikirimkan dan diterima sesuai dengan struktur yang diharapkan, mengurangi kesalahan tipe data atau field yang hilang. Tanpa model, kita bisa saja mengirim atau menerima data yang tidak sesuai, yang dapat menyebabkan error seperti format JSON yang tidak valid atau masalah deserialisasi.

2. **Fungsi dari Library `http`**  
   Library `http` digunakan untuk melakukan komunikasi antara aplikasi Flutter dan server melalui HTTP requests (GET, POST, PUT, DELETE). Pada tugas ini, `http` digunakan untuk mengirimkan data ke Django server atau mengambil data dari server. Fungsi utama `http` adalah mengelola request dan response, termasuk mengirim data dalam format JSON dan menerima data yang diterima dalam format JSON.

3. **Fungsi dari `CookieRequest`**  
   `CookieRequest` adalah class yang memudahkan manajemen request HTTP dengan cookie, biasanya untuk autentikasi dan sesi pengguna. Dengan `CookieRequest`, kita dapat menjaga sesi pengguna tetap aktif tanpa perlu mengirim ulang data login setiap kali. `CookieRequest` dibagikan ke semua komponen di aplikasi untuk memastikan bahwa autentikasi (misalnya token atau cookie sesi) tetap konsisten di seluruh aplikasi tanpa perlu mengulang proses login setiap kali.

4. **Mekanisme Pengiriman Data**  
   Pengiriman data dimulai dengan input dari pengguna di Flutter (seperti form di UI). Setelah data dimasukkan, aplikasi mengonversinya ke format JSON dan mengirimnya ke server menggunakan `http` POST request. Server kemudian memproses data tersebut, menyimpannya dalam database, dan mengirimkan response kembali. Flutter menerima response tersebut, memparsing JSON yang diterima, dan menampilkan data yang sesuai di UI.

5. **Mekanisme Autentikasi (Login, Register, Logout)**  
   Proses autentikasi dimulai dengan pengguna memasukkan data akun di Flutter (misalnya username dan password). Data ini dikirim ke server Django melalui `http` POST request. Django memverifikasi data, dan jika valid, mengirimkan token atau cookie sesi yang digunakan untuk mengidentifikasi pengguna di masa depan. Untuk login, token digunakan untuk mengautentikasi request selanjutnya. Untuk logout, token atau cookie sesi dihapus, dan pengguna diarahkan kembali ke halaman login.

6. **Implementasi Checklist Step-by-Step**  
   Berikut adalah langkah-langkah singkat untuk mengimplementasikan checklist:

1. **Registrasi Akun**: Buat form registrasi di Flutter, kirim data ke Django menggunakan HTTP POST, dan tampilkan pesan sukses atau gagal.
2. **Halaman Login**: Buat form login, kirim kredensial ke Django, dan terima token atau cookie untuk autentikasi.
3. **Integrasi Autentikasi**: Simpan token sesi setelah login dan gunakan untuk autentikasi pada request selanjutnya.
4. **Model Kustom di Django**: Buat model item di Django (misalnya `Product`), dengan atribut seperti name, price, dan description.
5. **Halaman Daftar Item**: Ambil data item dari Django menggunakan HTTP GET dan tampilkan nama, harga, dan deskripsi di Flutter.
6. **Tampilkan Informasi Item**: Gunakan widget Flutter untuk menampilkan nama, harga, dan deskripsi setiap item.
7. **Halaman Detail Item**: Navigasi ke halaman detail saat item ditekan dan tampilkan seluruh atribut item.
8. **Navigasi Kembali**: Tambahkan tombol untuk kembali ke halaman daftar item menggunakan `Navigator.pop()`.
9. **Filter Item Berdasarkan Pengguna**: Hanya tampilkan item yang terkait dengan pengguna yang login menggunakan filter di server Django.
