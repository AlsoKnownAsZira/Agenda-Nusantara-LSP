class TugasModel {
  final int? id; // nullable karena primary key otomatis dari database
  final String judul;
  final String deskripsi;
  final String tanggal;
  final String kategori;
  final int selesai; // int karena sqlite tidak mendukung boolean

  TugasModel({
    this.id,
    required this.judul,
    required this.deskripsi,
    required this.tanggal,
    required this.kategori,
    this.selesai = 0,
  });

  Map<String, dynamic> toMap() { // untuk mengubah object menjadi map yang akan diinsert ke database
    return {
      'id': id,
      'judul': judul,
      'deskripsi': deskripsi,
      'tanggal': tanggal,
      'kategori': kategori,
      'selesai': selesai,
    };
  }

  factory TugasModel.fromMap(Map<String, dynamic> map) { // factory method digunakan untuk membuat instance dari model dari data yang diambil dari database
    return TugasModel(
      id: map['id'],
      judul: map['judul'],
      deskripsi: map['deskripsi'],
      tanggal: map['tanggal'],
      kategori: map['kategori'],
      selesai: map['selesai'],
    );
  }
}