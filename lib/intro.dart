import 'package:flutter/material.dart';  // Mengimpor paket material untuk widget Flutter
import 'main.dart';  // Mengimpor main.dart untuk menghubungkan dengan halaman utama

// Membuat kelas IntroPage yang merupakan halaman intro pada aplikasi
class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();  // Mengembalikan instance dari _IntroPageState
}

// State untuk halaman IntroPage
class _IntroPageState extends State<IntroPage> {
  int currentPage = 1;  // Variabel untuk menandakan halaman yang sedang ditampilkan (1 untuk halaman pertama, 2 untuk halaman kedua)

  // Fungsi untuk berpindah ke halaman kedua (halaman 2)
  void goToNextPage() {
    setState(() {
      currentPage = 2;  // Mengubah nilai currentPage ke 2 untuk menampilkan halaman kedua
    });
  }

  // Fungsi untuk pindah ke halaman utama setelah klik tombol "Mulai"
  void goToHomePage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),  // Mengganti halaman ke HomePage
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(  // Memastikan tampilan tidak terpotong oleh area sistem (status bar)
        child: SingleChildScrollView(  // Membuat halaman bisa di-scroll jika konten melebihi ukuran layar
          child: currentPage == 1 ? buildFirstPage() : buildSecondPage(),  // Menampilkan halaman pertama atau kedua sesuai dengan nilai currentPage
        ),
      ),
    );
  }

  // Fungsi untuk membangun halaman pertama
  Widget buildFirstPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),  // Memberikan padding untuk konten di halaman pertama
      child: Column(
        children: [
          Image.asset(
            'assets/awal1.jpg',  // Menampilkan gambar pertama pada halaman
            width: MediaQuery.of(context).size.width * 0.8,  // Lebar gambar disesuaikan dengan lebar layar (80%)
            height: MediaQuery.of(context).size.height * 0.4,  // Tinggi gambar disesuaikan dengan tinggi layar (40%)
            fit: BoxFit.contain,  // Agar gambar tidak terpotong dan tetap terlihat penuh
          ),
          const SizedBox(height: 20),  // Jarak antara gambar dan teks
          Text(
            "Temukan dunia lewat halaman demi halaman",  // Teks yang ditampilkan di halaman pertama
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,  // Mengubah gaya teks agar lebih tebal
                ),
            textAlign: TextAlign.center,  // Membuat teks rata tengah
          ),
          const SizedBox(height: 30),  // Jarak antara teks dan tombol
          ElevatedButton(
            onPressed: goToNextPage,  // Menjalankan fungsi goToNextPage saat tombol diklik
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,  // Warna latar belakang tombol sesuai tema aplikasi
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),  // Padding tombol
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),  // Membuat tombol dengan sudut yang melengkung
              ),
            ),
            child: const Text(
              "Lewati",  // Teks pada tombol
              style: TextStyle(color: Colors.white),  // Menentukan warna teks tombol menjadi putih
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk membangun halaman kedua
  Widget buildSecondPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),  // Padding untuk konten di halaman kedua
      child: Column(
        children: [
          Image.asset(
            'assets/awal2.png',  // Menampilkan gambar kedua pada halaman
            width: MediaQuery.of(context).size.width * 0.8,  // Lebar gambar disesuaikan dengan lebar layar (80%)
            height: MediaQuery.of(context).size.height * 0.4,  // Tinggi gambar disesuaikan dengan tinggi layar (40%)
            fit: BoxFit.contain,  // Agar gambar tidak terpotong dan tetap terlihat penuh
          ),
          const SizedBox(height: 20),  // Jarak antara gambar dan teks
          Text(
            "Buku terbaik, pilihanmu ada di sini",  // Teks yang ditampilkan di halaman kedua
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,  // Mengubah gaya teks agar lebih tebal
                ),
            textAlign: TextAlign.center,  // Membuat teks rata tengah
          ),
          const SizedBox(height: 30),  // Jarak antara teks dan tombol
          ElevatedButton(
            onPressed: goToHomePage,  // Menjalankan fungsi goToHomePage saat tombol diklik
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,  // Warna latar belakang tombol sesuai tema aplikasi
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),  // Padding tombol
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),  // Membuat tombol dengan sudut yang melengkung
              ),
            ),
            child: const Text(
              "Mulai",  // Teks pada tombol
              style: TextStyle(color: Colors.white),  // Menentukan warna teks tombol menjadi putih
            ),
          ),
        ],
      ),
    );
  }
}
