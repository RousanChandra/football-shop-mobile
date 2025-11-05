

Rousan Chandra Syahbunan – 2406435894  

<details>
<Summary><b>Tugas 7</b></Summary>
Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.





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

