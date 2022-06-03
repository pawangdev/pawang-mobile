class PengeluaranModel {
  late int? id;
  late String namaPengeluaran;
  late double nominalPengeluaran;
  late String kategoriPengeluaran;
  late String tanggalPengeluaran;
  late String filePath;

  PengeluaranModel(
      {required this.namaPengeluaran,
      required this.nominalPengeluaran,
      required this.kategoriPengeluaran,
      required this.tanggalPengeluaran,
      required this.filePath,
      this.id});

  PengeluaranModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    namaPengeluaran = map['nama_pengeluaran'];
    nominalPengeluaran = map['nominal_pengeluaran'];
    kategoriPengeluaran = map['kategori_pengeluaran'];
    tanggalPengeluaran = map['tanggal_pengeluaran'];
    filePath = map['file_path'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama_pengeluaran': namaPengeluaran,
      'nominal_pengeluaran': nominalPengeluaran,
      'kategori_pengeluaran': kategoriPengeluaran,
      'tanggal_pengeluaran': tanggalPengeluaran,
      'file_path': filePath,
    };
  }
}
