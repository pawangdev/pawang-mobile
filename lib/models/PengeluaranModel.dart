class PengeluaranModel {
  final String nama_pengeluaran;
  final double nominal_pengeluaran;
  final String kategori_pengeluaran;
  final String tanggal_pengeluaran;
  final String filePath;

  PengeluaranModel(
      {required this.nama_pengeluaran,
      required this.nominal_pengeluaran,
      required this.kategori_pengeluaran,
      required this.tanggal_pengeluaran,
      required this.filePath});

  Map<String, dynamic> toMap() {
    return {
      'nama_pengeluaran': nama_pengeluaran,
      'nominal_pengeluaran': nominal_pengeluaran,
      'kategori_pengeluaran': kategori_pengeluaran,
      'tanggal_pengeluaran': tanggal_pengeluaran,
      'file_path': filePath,
    };
  }
}
