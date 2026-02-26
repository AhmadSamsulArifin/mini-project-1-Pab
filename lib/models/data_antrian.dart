class DataAntrian {
  final String id;
  final int nomorAntrian;
  final String nama;
  final String nik;
  final String jenisPelayanan;
  final String noHp;

  const DataAntrian({
    required this.id,
    required this.nomorAntrian,
    required this.nama,
    required this.nik,
    required this.jenisPelayanan,
    required this.noHp,
  });

  DataAntrian salinDengan({
    String? id,
    int? nomorAntrian,
    String? nama,
    String? nik,
    String? jenisPelayanan,
    String? noHp,
  }) {
    return DataAntrian(
      id: id ?? this.id,
      nomorAntrian: nomorAntrian ?? this.nomorAntrian,
      nama: nama ?? this.nama,
      nik: nik ?? this.nik,
      jenisPelayanan: jenisPelayanan ?? this.jenisPelayanan,
      noHp: noHp ?? this.noHp,
    );
  }
}