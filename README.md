

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


<details>
<Summary><b>Tugas 9</b></Summary>
1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?

Membuat model Dart (class seperti Product) itu penting karena:

a. Validasi tipe data (type-safety)

Kalau pakai Map<String, dynamic> langsung:

Semua nilai dianggap dynamic.

Tidak ada jaminan bahwa "price" itu double, "name" itu String, atau "is_featured" itu bool.

Ketika backend berubah struktur sedikit, Flutter bisa crash saat runtime.

Dengan model Dart:

Struktur data dikunci.

Setiap field punya tipe jelas.

Error muncul saat compile-time, bukan saat user sedang memakai aplikasi.

b. Null safety

Tanpa model:

Kamu bisa dengan mudah mengakses key yang tidak ada, hasilnya null, dan nanti error:
Null check operator used on a null value.

Tracking error jadi susah.

Dengan model:

Bisa memastikan nilai wajib tidak null.

Bisa memberi default value.

Ada mekanisme required.

c. Maintainability dan scalability

Saat project makin besar:

View → pakai model

Provider → pakai model

API service → pakai model

Kalau semuanya cuma Map:

Tidak ada dokumentasi struktur data.

Susah membaca kode.

Setiap halaman harus decode JSON berulang-ulang → rawan typo.

Model itu ibarat kontrak antara Flutter dan Django.
Tanpa model, kontraknya kacau dan rawan error.

2. Apa fungsi package http dan CookieRequest? Apa perbedaan perannya?
Package http

Untuk melakukan request HTTP biasa (GET, POST).

Tidak menyimpan cookie.

Tidak bisa login session Django secara otomatis.

Cocok untuk:

API publik

Request tanpa autentikasi

Akses REST biasa

CookieRequest (punya PBP Django Auth)

Dibuat khusus untuk komunikasi Flutter ↔ Django.

Menyimpan session cookie setelah login.

Meneruskan cookie secara otomatis di setiap request.

Sinkron dengan sistem auth Django.

Kesimpulan:
http → request biasa.
CookieRequest → request yang butuh cookie, login, dan autentikasi Django.

3. Mengapa instance CookieRequest perlu dibagikan ke semua komponen Flutter?

Karena:

CookieRequest menyimpan session login user.

Kalau tiap halaman bikin instance baru → cookie hilang → Django anggap kamu "belum login".

Tidak bisa fetch data yang butuh autentikasi.

Logout juga tidak sinkron.

Makanya, CookieRequest dibagikan lewat:

Provider(create: (_) => CookieRequest())


Agar:

Semua halaman memakai instance yang sama

Session tidak hilang

User tetap login selama aplikasi berjalan

4. Konfigurasi konektivitas yang wajib agar Flutter terhubung dengan Django
a. Menambahkan 10.0.2.2 pada ALLOWED_HOSTS

Android emulator tidak bisa akses localhost.
10.0.2.2 = alias dari localhost untuk emulator.

Jika tidak ditambahkan:

Django akan menolak request karena disallowed host.

Error: Invalid HTTP_HOST header.

b. Mengaktifkan CORS (django-cors-headers)

Diperlukan agar client (Flutter) boleh mengakses server Django.

Jika tidak:

Request akan diblokir oleh browser-policy/CORS.

Error: CORS blocked request.

c. Pengaturan cookie: SameSite=None + Secure=False

Session login Django dikirim lewat cookie.
Android/Web membutuhkan:

SameSite=None → boleh lintas domain

Secure=False → cookie tetap dikirim walau tidak HTTPS (untuk local dev)

Kalau salah:

Cookie tidak terkirim → login selalu gagal.

d. Menambahkan permission internet di Android

Di AndroidManifest.xml:

<uses-permission android:name="android.permission.INTERNET"/>


Jika tidak:

Flutter tidak bisa mengirim request

Semua API gagal

5. Mekanisme pengiriman data dari input → Django → kembali ke Flutter
1. User mengisi form di Flutter

Misal form Create Product.

2. Flutter mengirim POST request (via CookieRequest)

Berisi body JSON:

{
  "name": "...",
  "price": "...",
  "category": "..."
}

3. Django menerima request

Memvalidasi data

Menyimpan ke database (ORM)

Balikkan response JSON

4. Flutter menerima response

Decode JSON

Jika success, tampilkan notifikasi / kembali ke page sebelumnya

5. Flutter melakukan GET untuk menampilkan data

Flutter panggil endpoint seperti /get_products/

Django mengirim list JSON

Flutter convert JSON → model

Ditampilkan sebagai widget list

6. Mekanisme autentikasi login → register → logout
a. Register

User isi form register di Flutter.

Flutter POST ke Django /auth/register/.

Django create user baru.

Flutter mendapat response “success”.

b. Login

Flutter POST username/password ke /auth/login/.

Django cek user + password.

Kalau valid, Django mengirim session cookie.

CookieRequest menyimpannya.

Semua request selanjutnya otomatis memakai cookie itu.

Flutter navigate ke MenuPage (user masuk aplikasi).

c. Logout

Flutter memanggil request.logout().

Django menghapus session.

CookieRequest menghapus cookie.

Flutter kembali ke LoginPage.

7. Implementasi checklist secara step-by-step (versi detail)
A. Membuat model Django

Buat model Product (field name, price, category, thumbnail, dsb).

Buat migration → migrate.

B. Membuat endpoint JSON

get_products()

get_my_products()

create_product()

C. Mengaktifkan auth Django

Install PBP Django Auth.

Tambahkan di settings.

Buat endpoint login/logout/register.

D. Setup CORS & cookies

Install django-cors-headers.

Tambahkan ke INSTALLED_APPS + MIDDLEWARE.

Konfigurasi Allowed origins, SameSite, Secure, Host header.

E. Setup Flutter

Install provider + pbp_django_auth.

Tambahkan CookieRequest ke root (multi-provider).

Buat LoginPage, RegisterPage, MenuPage.

F. Buat model Dart

Product dengan factory fromJson.

G. Fetch data

Buat service untuk GET/POST request menggunakan CookieRequest.

Test endpoint dengan snackbar.

H. Buat UI

All Products list

My Products list

Create Product form

Drawer + navigasi

Logout button

I. Testing end-to-end

Register

Login

Create product

Fetch all products

Fetch user’s products

Logout
    
</details>






