

Rousan Chandra Syahbunan – 2406435894  

<details>
<Summary><b>Tugas 7</b></Summary>
1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.


Dalam Flutter, semua elemen tampilan adalah widget — mulai dari tombol, teks, gambar, hingga tata letak seperti Column dan Row.  

Semua widget ini tersusun dalam bentuk **pohon hierarki** yang disebut **widget tree**:

- **Parent** → widget yang membungkus widget lain
- **Child** → widget yang berada di dalam parent  

Contoh sederhana:

    Scaffold(
        body: Center(
        child: Text('Halo Flutter!'),
        ),
    )
- Scaffold → parent dari Center
- Center → parent dari Text
- Text → child dari Center

2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
   
MaterialApp → Membungkus seluruh aplikasi dan memberikan gaya Material Design.

Scaffold → Menyediakan struktur dasar layar (app bar, body, floating button, dll).

AppBar → Bagian atas aplikasi untuk judul atau tombol menu.

Center → Menempatkan child di tengah layar.

Column → Menyusun widget secara vertikal.

Row → Menyusun widget secara horizontal.

Text → Menampilkan teks.

Image → Menampilkan gambar.

ElevatedButton → Tombol dengan gaya material yang bisa ditekan.

ListView → Menampilkan daftar yang bisa digulir.

Container → Widget serbaguna untuk pengaturan posisi, warna, padding, margin, dll.

3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.

MaterialApp adalah widget utama yang menyediakan konfigurasi dasar aplikasi berbasis Material Design, seperti:

- Tema (ThemeData),

- Navigasi antar halaman (routes),

- Judul aplikasi (title),

- Home page pertama yang ditampilkan.

Biasanya MaterialApp diletakkan di paling atas (root widget) karena ia menjadi dasar dari seluruh struktur widget lain yang mengikuti standar tampilan Material Design milik Flutter.

Tanpa MaterialApp, banyak widget seperti Scaffold atau AppBar tidak akan berfungsi dengan benar karena mereka membutuhkan konteks dari Material Design system.

4. Perbedaan antara StatelessWidget dan StatefulWidget. kapan pemilihannya?

StatelessWidget:
- Tidak bisa berubah setelah dibangun (tidak memiliki state).
- Teks statis, ikon, tampilan yang tidak berubah.

StatefulWidget:
- Dapat berubah saat aplikasi berjalan (memiliki state).
- Tombol counter, form input, tampilan yang berubah setelah aksi pengguna.

Kapan memilihnya:
- Gunakan StatelessWidget bila konten tidak perlu berubah (misalnya teks, gambar tetap).
- Gunakan StatefulWidget bila tampilan tergantung pada interaksi pengguna atau data yang berubah.

5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?

BuildContext adalah objek yang menyimpan lokasi widget di dalam widget tree.
Ia penting karena digunakan Flutter untuk:

Menemukan posisi widget dalam hierarki.

Mengakses widget lain di atasnya (seperti Theme, MediaQuery, atau Navigator).

Biasanya digunakan di metode build(BuildContext context):

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Contoh BuildContext'),
          ),
        body: Center(
          child: Text(
        '  Ukuran layar: ${MediaQuery.of(context).size.width}',
          ),
        ),
      );
    }

6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

Jawab: 
Hot Reload : Menyimpan dan menerapkan perubahan kode langsung tanpa kehilangan state aplikasi (data tetap ada). Digunakan hanya saat mengubah tampilan UI atau teks.
Hot Restart: Memulai ulang seluruh aplikasi dari awal (state di-reset). Digunakan saat mengubah kode yang memengaruhi logika awal, seperti inisialisasi variabel global.
</details>
<details>
<Summary><b>Tugas 8</b></Summary>

1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
    
Jawab:

- Navigator.push()
Digunakan untuk menambahkan (push) halaman baru ke dalam navigation stack tanpa menghapus halaman sebelumnya.
Pengguna masih dapat kembali ke halaman sebelumnya dengan menekan tombol Back.
→ Pada aplikasi Football Shop, Navigator.push() cocok digunakan saat pengguna ingin membuka halaman Tambah Produk dari halaman utama, karena setelah menambahkan produk, pengguna mungkin ingin kembali ke halaman utama.

- Navigator.pushReplacement()
Digunakan untuk mengganti (replace) halaman saat ini dengan halaman baru, sehingga halaman sebelumnya dihapus dari stack.
Pengguna tidak bisa kembali ke halaman sebelumnya menggunakan tombol Back.
→ Pada aplikasi Football Shop, Navigator.pushReplacement() cocok digunakan misalnya saat berpindah antar-halaman utama melalui Drawer (misalnya dari Halaman Utama ke Tambah Produk), agar halaman sebelumnya tidak menumpuk di stack dan navigasi tetap bersih.

2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
Jawab:
Prinsip utama

- Scaffold = kerangka halaman. Semua halaman layar utama pakai Scaffold sehingga memiliki struktur yang familiar: appBar, drawer (opsional), body, floatingActionButton, bottomNavigationBar.
- AppBar = header konsisten. Gunakan AppBar untuk judul halaman, tombol aksi (search, cart), dan navigasi (back/leading). Warna, font, dan tinggi diseragamkan lewat Theme.
- Drawer = navigasi top-level. Taruh link ke halaman-halaman setara (Home, Tambah Produk, Profil, dsb). Tutup drawer (Navigator.pop) sebelum berpindah halaman. Untuk navigasi antar halaman utama, gunakan pushReplacement() supaya stack tidak menumpuk.

3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
Jawab:

Penggunaan layout widget seperti Padding, SingleChildScrollView, dan ListView sangat penting untuk memastikan tampilan form tetap rapi, responsif, dan mudah digunakan pada berbagai ukuran layar.
- Padding Digunakan untuk memberikan jarak antar-elemen agar tampilan tidak terasa padat dan lebih rapi.
Misalnya, pada LeftDrawer, widget Padding digunakan di dalam DrawerHeader untuk memberi jarak antara teks judul Football Shop dengan deskripsinya. Hal ini membuat tampilan drawer lebih seimbang dan nyaman dibaca.

Contoh :
    
    Padding(padding: EdgeInsets.all(10)),
    
- SingleChildScrollView digunakan agar form dapat di-scroll ketika elemen-elemen di dalamnya melebihi tinggi layar. Ini sangat membantu agar pengguna tetap dapat mengakses tombol Save meskipun tampilan form panjang, terutama saat keyboard muncul di layar kecil.

Contoh :

    body: Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column( ... )
      )
    )
    
- ListView digunakan ketika terdapat banyak elemen input yang ingin ditampilkan secara vertikal dan dinamis. Dengan ListView, setiap komponen akan otomatis bisa di-scroll tanpa overflow error, menjaga tampilan form tetap responsif.

Contoh :

    child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            ...
            )


4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

Jawab:

Untuk menjaga konsistensi identitas visual, aplikasi Football Shop menggunakan tema global yang didefinisikan pada MaterialApp sehingga seluruh elemen UI berbagi palet warna dan gaya. Pendekatannya meliputi:

- Pilih warna brand (seed color) yang konsisten — mis. hijau/indigo untuk nuansa lapangan/produk sport.
- Atur ThemeData / ColorScheme di main.dart agar AppBar, tombol, teks, dan background mengikuti skema yang sama.
- Standarisasi komponen: AppBar, ElevatedButton, FloatingActionButton, dan input field memakai style yang konsisten lewat appBarTheme, elevatedButtonTheme, inputDecorationTheme.
- Gunakan variabel tema (mis. theme.dart) sehingga penggantian warna brand cukup diubah di satu tempat.
- Pertimbangkan aksesibilitas: pastikan kontras warna teks vs background memadai.

Pada aplikasi Football Shop, warna tema diatur melalui properti theme pada MaterialApp di file main.dart.
Dengan menggunakan ThemeData dan ColorScheme.fromSeed(), seluruh komponen aplikasi seperti AppBar, Button, dan FloatingActionButton akan otomatis mengikuti warna utama (seed color) yang ditentukan.

    MaterialApp(
      title: 'Football Shop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MenuPage(),
    );
Warna ungu tua (Colors.deepPurple) dipilih sebagai warna utama untuk memberikan kesan elegan dan profesional, sesuai citra toko olahraga yang modern.
Selain itu, setiap halaman menggunakan Scaffold dengan AppBar dan Drawer yang konsisten, sehingga identitas visual aplikasi tetap seragam di seluruh tampilan.

</details>




