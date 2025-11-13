class Berita {
  final String judul;
  final String sumber;
  final String tanggal;
  final String imageUrl;

  Berita({required this.judul, required this.sumber, required this.tanggal, required this.imageUrl});
}

// Data statis untuk Berita
final List<Berita> staticBeritaList = [
  Berita(
    judul: "OpenAI Announces New Platform for Custom Chatbots",
    sumber: "The Verge",
    tanggal: "2025/11/01",
    imageUrl: "assets/news_ai.png", // Ganti dengan path aset Anda
  ),
  Berita(
    judul: "Global Climate Summit Kicks Off in Dubai",
    sumber: "CNN",
    tanggal: "2025/11/05",
    imageUrl: "assets/news_climate.png", 
  ),
  Berita(
    judul: "Flutter 3.2 Update Brings Significant Performance Boosts",
    sumber: "Google Devs",
    tanggal: "2025/11/07",
    imageUrl: "assets/news_flutter.png",
  ),
  Berita(
    judul: "Local Sports Team Wins Championship Title",
    sumber: "Bandung Post",
    tanggal: "2025/10/29",
    imageUrl: "assets/news_sport.png",
  ),
];