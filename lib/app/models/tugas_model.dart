class TugasModel {
  final int? id;
  final String judul;
  final String deskripsi;
  final String tanggal;
  final String kategori;
  final int selesai;
  final String? completedAt;

  TugasModel({
    this.id,
    required this.judul,
    required this.deskripsi,
    required this.tanggal,
    required this.kategori,
    this.selesai = 0,
    this.completedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'judul': judul,
      'deskripsi': deskripsi,
      'tanggal': tanggal,
      'kategori': kategori,
      'selesai': selesai,
      'completed_at': completedAt,
    };
  }

  factory TugasModel.fromMap(Map<String, dynamic> map) {
    return TugasModel(
      id: map['id'],
      judul: map['judul'],
      deskripsi: map['deskripsi'],
      tanggal: map['tanggal'],
      kategori: map['kategori'],
      selesai: map['selesai'],
      completedAt: map['completed_at'] as String?,
    );
  }
}