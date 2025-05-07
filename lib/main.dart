import 'package:flutter/material.dart';
import 'intro.dart'; 

void main() {
  runApp(const BukuBooksApp());
}

class BukuBooksApp extends StatelessWidget {
  const BukuBooksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BukuBooks',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const IntroPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentImageIndex = 0;
  String _searchQuery = "";

  final List<String> carouselImages = [
    'assets/gambar1.jpg',
    'assets/gambar2.jpg',
    'assets/gambar3.jpg',
  ];

  final List<Map<String, dynamic>> bestsellers = [
    {
      'image': 'assets/best1.jpg',
      'title': 'Laut Bercerita',
      'author': 'Leila S. Chudori',
      'price': 'Rp 99.000',
      'genre': 'Fiksi sejarah, drama, politik',
      'stock': false,
      'sinopsis': 'Laut Bercerita adalah kisah tentang Laut Biru, seorang aktivis mahasiswa yang hilang pada masa Orde Baru. Dalam novel ini, Leila S. Chudori menggambarkan dengan mendalam perjuangan, pengkhianatan, dan kehilangan yang dialami oleh para aktivis serta keluarga mereka. Dengan narasi yang kuat dan emosional, novel ini mengajak pembaca untuk merenungkan sejarah kelam Indonesia dan dampaknya terhadap individu dan keluarga.'
    },
    {
      'image': 'assets/best2.jpg',
      'title': 'Filosofi Teras',
      'author': 'Henry Manampiring',
      'price': 'Rp 85.000',
      'genre': 'Pengembangan Diri',
      'stock': false,
      'sinopsis': 'Apakah kamu sering merasa khawatir akan banyak hal? Baperan? Susah move on? Mudah tersinggung dan marah-marah di media sosial maupun dunia nyata? Lebih dari 2.000 tahun lalu, sebuah mazhab filsafat menemukan akar masalah dan juga solusi dari banyak emosi negatif. Stoisisme, atau Filosofi Teras, adalah filsafat Yunani-Romawi kuno yang bisa membantu kita mengatasi emosi negatif dan menghasilkan mental yang tangguh dalam menghadapi naik-turunnya kehidupan. Jauh dari kesan filsafat sebagai topik berat dan mengawang-awang, Filosofi Teras justru bersifat praktis dan relevan dengan kehidupan Generasi Milenial dan Gen-Z masa kini.'
    },
    {
      'image': 'assets/best3.jpg',
      'title': 'Atomic Habits',
      'author': 'James Clear',
      'price': 'Rp 130.000',
      'genre': 'Motivasi',
      'stock': false,
      'sinopsis': 'Panduan praktis untuk mengubah kebiasaan kecil menjadi hasil luar biasa dalam hidupmuAtomic Habits adalah buku yang mengungkapkan bagaimana kebiasaan kecil yang konsisten dapat mengubah hidup secara dramatis. Dengan pendekatan berbasis penelitian dan strategi yang mudah diterapkan, James Clear menunjukkan bagaimana membangun kebiasaan baik, menghentikan kebiasaan buruk, dan menciptakan perubahan jangka panjang yang signifikan. Ini adalah panduan untuk mengubah cara Anda berperilaku dengan langkah-langkah kecil yang dapat membawa hasil besar..'
    },
    {
      'image': 'assets/best4.jpg',
      'title': 'You Do You',
      'author': 'Fellexandro Ruby',
      'price': 'Rp 88.000',
      'genre': 'Pengembangan Diri',
      'stock': false,
      'sinopsis': 'Buku inspiratif tentang bagaimana menemukan dan mengejar passion tanpa terjebak ekspektasi sosial.'
    },
    {
      'image': 'assets/best5.jpg',
      'title': 'It Ends With Us',
      'author': 'Colleen Hoover',
      'price': 'Rp 120.000',
      'genre': 'Romance',
      'stock': false,
      'sinopsis': 'Novel emosional yang mengisahkan perjuangan seorang perempuan dalam hubungan yang kompleks dan penuh luka.'
    },
    {
      'image': 'assets/best6.jpg',
      'title': 'Bumi',
      'author': 'Tere Liye',
      'price': 'Rp 90.000',
      'genre': 'Fantasi',
      'stock': false,
      'sinopsis': 'Petualangan luar biasa anak-anak dengan kekuatan istimewa di dunia paralel bernama Dunia Pararel.'
    },
    {
      'image': 'assets/best7.jpg',
      'title': 'Negeri 5 Menara',
      'author': 'Ahmad Fuadi',
      'price': 'Rp 95.000',
      'genre': 'Fiksi Inspiratif',
      'stock': false,
      'sinopsis': 'Kisah persahabatan dan perjuangan enam santri dari berbagai daerah yang belajar di pondok pesantren modern.'
    },
    {
      'image': 'assets/best8.jpg',
      'title': 'Perahu Kertas',
      'author': 'Dee Lestari',
      'price': 'Rp 120.000',
      'genre': 'Drama Romantis',
      'stock': false,
      'sinopsis': 'Cinta dan mimpi dua insan muda yang terombang-ambing di antara kenyataan dan keinginan hati.'
    },
    {
      'image': 'assets/best9.jpg',
      'title': 'The Psychology of Money',
      'author': 'Morgan Housel',
      'price': 'Rp 120.000',
      'genre': 'Ekonomi',
      'stock': false,
      'sinopsis': 'Pandangan unik tentang bagaimana orang berpikir, merasa, dan bertindak terhadap uang.'
    },
    {
      'image': 'assets/best10.jpg',
      'title': 'Selamat Tinggal',
      'author': 'Tere Liye',
      'price': 'Rp 120.000',
      'genre': 'Drama',
      'stock': false,
      'sinopsis': 'Novel yang mengeksplorasi tema perjuangan dan keikhlasan dalam menghadapi perpisahan dan masa lalu.'
    },
  ];

  final List<Map<String, dynamic>> comingSoon = [
    {
      'image': 'assets/soon1.jpg',
      'title': 'Arah Langkah',
      'author': 'Fiersa Besari',
      'genre': 'Travelogue',
      'stock': false,
      'sinopsis': 'Kumpulan catatan perjalanan penuh makna dari sang penulis yang menyusuri berbagai tempat di Indonesia.'
    },
    {
      'image': 'assets/soon2.jpg',
      'title': 'The Ballad of Songbirds and Snakes',
      'author': 'Suzanne Collins',
      'genre': 'Dystopia',
      'stock': false,
      'sinopsis': 'Prekuel dari Hunger Games yang menceritakan asal usul musuh bebuyutan Katniss: Presiden Snow.'
    },
    {
      'image': 'assets/soon3.jpg',
      'title': 'Perjamuan Khong Guan',
      'author': 'Joko Pinurbo',
      'genre': 'Puisi',
      'stock': false,
      'sinopsis': 'Kumpulan puisi yang absurd dan reflektif tentang kehidupan sehari-hari dengan gaya khas Joko Pinurbo.'
    },
    {
      'image': 'assets/soon4.jpg',
      'title': 'The Ministry of Time',
      'author': 'Kaliane Bradley',
      'genre': 'Sci-Fi',
      'stock': false,
      'sinopsis': 'Novel science fiction yang menjelajahi waktu dan politik dalam setting dunia alternatif.'
    },
    {
      'image': 'assets/soon5.jpg',
      'title': 'Kita Pergi Hari Ini',
      'author': 'Ziggy',
      'genre': 'Drama',
      'stock': false,
      'sinopsis': 'Sebuah novel yang penuh nuansa, menyoroti dinamika keluarga dan perjalanan batin yang menyentuh hati.'
    },
  ];

  void _nextImage() {
    setState(() {
      _currentImageIndex = (_currentImageIndex + 1) % carouselImages.length;
    });
  }

  List<Map<String, dynamic>> _searchBooks(List<Map<String, dynamic>> books) {
    return books.where((book) {
      return book['title'].toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
  }

  void _navigateToDetail(Map<String, dynamic> book) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(book: book),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: Row(
    mainAxisSize: MainAxisSize.min, // Ini untuk memastikan ikon dan teks berada dalam satu baris
    children: const [
      Icon(
        Icons.book, // Ikon buku dari Material Icons
        color: Colors.white, // Warna ikon putih
        size: 30, // Ukuran ikon
      ),
      SizedBox(width: 8), // Memberi jarak antara ikon dan teks
      Text(
        'BukuBooks', // Teks judul aplikasi
        style: TextStyle(fontSize: 24), // Ukuran font teks
      ),
    ],
  ),
  backgroundColor: Colors.teal, // Warna background AppBar
  automaticallyImplyLeading: false, // Nggak ada tombol back otomatis
  bottom: PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
          });
        },
        decoration: InputDecoration(
          hintText: 'Cari Buku Yang Kamu Inginkan......',
          filled: true,
          fillColor: Colors.white,
          suffixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    ),
  ),
),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      carouselImages[_currentImageIndex],
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                      onPressed: _nextImage,
                    ),
                  ),
                ],
              ),
            ),
            if (_searchQuery.isNotEmpty) ...[
              _buildSectionTitle('Hasil Pencarian Buku'),
              _buildBookList(_searchBooks(bestsellers), showPrice: true),
              _buildBookList(_searchBooks(comingSoon), showPrice: false),
            ] else ...[
              _buildSectionTitle('Buku Populer'),
              _buildBookList(bestsellers, showPrice: true),
              _buildSectionTitle('Buku Yang Akan Di Rilis'),
              _buildBookList(comingSoon, showPrice: false),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildBookList(List<Map<String, dynamic>> books, {required bool showPrice}) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return GestureDetector(
            onTap: () => _navigateToDetail(book),
            child: Container(
              width: 150,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(book['image'], height: 120, width: 150, fit: BoxFit.cover),
                  ),
                  const SizedBox(height: 8),
                  Text(book['title'], style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text('by ${book['author']}'),
                  if (showPrice)
                    Text(book['price'], style: const TextStyle(color: Color.fromARGB(255, 76, 173, 175))),
                  if (!showPrice)
                    const Text('Rp ???', style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 8), // Add space between the text and the line
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> book;

  const DetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book['title']),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(book['image'], height: 250, fit: BoxFit.cover),
            const SizedBox(height: 20),
            Text(book['title'], style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text('by ${book['author']}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text(book.containsKey('price') ? book['price'] : 'Segera Hadir',
                style: const TextStyle(fontSize: 16, color: Colors.green)),
            const SizedBox(height: 10),
            Text("Genre: ${book['genre']}", style: const TextStyle(fontSize: 16)),
            Text("Stok: ${book['stock'] ? 'Tersedia' : 'Kosong'}", style: TextStyle(fontSize: 16, color: book['stock'] ? Colors.green : Colors.red)),
            const SizedBox(height: 16),
            Text("Sinopsis:", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(book['sinopsis'], style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                onPressed: book['stock']
                    ? () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Berhasil dibeli!')),
                        );
                      }
                    : null,
                child: const Text('Beli', style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
