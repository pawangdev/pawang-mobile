class PengeluaranModel {
  late int? id;
  late String nama_pengeluaran;
  late double nominal_pengeluaran;
  late String kategori_pengeluaran;
  late String tanggal_pengeluaran;
  late String filePath;

  PengeluaranModel(
      {required this.nama_pengeluaran,
      required this.nominal_pengeluaran,
      required this.kategori_pengeluaran,
      required this.tanggal_pengeluaran,
      required this.filePath,
      this.id});

  PengeluaranModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nama_pengeluaran = map['nama_pengeluaran'];
    nominal_pengeluaran = map['nominal_pengeluaran'];
    kategori_pengeluaran = map['kategori_pengeluaran'];
    tanggal_pengeluaran = map['tanggal_pengeluaran'];
    filePath = map['filePath'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'nama_pengeluaran': nama_pengeluaran,
      'nominal_pengeluaran': nominal_pengeluaran,
      'kategori_pengeluaran': kategori_pengeluaran,
      'tanggal_pengeluaran': tanggal_pengeluaran,
      'file_path': filePath,
    };
  }
}
