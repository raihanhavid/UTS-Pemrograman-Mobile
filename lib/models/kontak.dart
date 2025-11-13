class Kontak {
  final String nama;
  final String telepon;
  final String avatarUrl; // Digunakan untuk CircleAvatar

  Kontak({required this.nama, required this.telepon, required this.avatarUrl});
}

// Data statis untuk 15 kontak
final List<Kontak> staticKontakList = [
  Kontak(
    nama: "Budi Santoso",
    telepon: "0812-3456-7890",
    avatarUrl: "icons/person_1.png",
  ),
  Kontak(
    nama: "Citra Dewi",
    telepon: "0811-2345-6789",
    avatarUrl: "icons/person_2.png",
  ),
  Kontak(
    nama: "Dian Permata",
    telepon: "0857-1234-5678",
    avatarUrl: "icons/person_3.png",
  ),
  Kontak(
    nama: "Eko Prasetyo",
    telepon: "0813-9876-5432",
    avatarUrl: "icons/person_4.png",
  ),
  Kontak(
    nama: "Fani Agustina",
    telepon: "0878-6543-2109",
    avatarUrl: "icons/person_5.png",
  ),
  Kontak(
    nama: "Gilang Ramadhan",
    telepon: "0821-1122-3344",
    avatarUrl: "icons/person_6.png",
  ),
  Kontak(
    nama: "Hana Nuraini",
    telepon: "0852-5566-7788",
    avatarUrl: "icons/person_7.png",
  ),
  Kontak(
    nama: "Indra Jaya",
    telepon: "0815-4433-2211",
    avatarUrl: "icons/person_8.png",
  ),
  Kontak(
    nama: "Joko Susilo",
    telepon: "0896-0011-2233",
    avatarUrl: "icons/person_9.png",
  ),
  Kontak(
    nama: "Kiki Amelia",
    telepon: "0819-1212-1212",
    avatarUrl: "icons/person_10.png",
  ),
  Kontak(
    nama: "Lina Marlina",
    telepon: "0822-3434-5656",
    avatarUrl: "icons/person_11.png",
  ),
  Kontak(
    nama: "Maman Suherman",
    telepon: "0853-7878-9090",
    avatarUrl: "icons/person_12.png",
  ),
  Kontak(
    nama: "Nita Wijaya",
    telepon: "0816-5656-7878",
    avatarUrl: "icons/person_13.png",
  ),
  Kontak(
    nama: "Owen Tan",
    telepon: "0877-1020-3040",
    avatarUrl: "icons/person_14.png",
  ),
  Kontak(
    nama: "Putri Cahyani",
    telepon: "0818-0505-1515",
    avatarUrl: "icons/person_15.png",
  ),
];

// Catatan: Untuk menjalankan ini, buat folder assets/icons/ dan isi dengan gambar placeholder atau gunakan Icons.person
