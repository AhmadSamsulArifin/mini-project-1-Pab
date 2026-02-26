import 'package:flutter/material.dart';
import '../models/data_antrian.dart';
import 'halaman_detail_antrian.dart';
import 'halaman_form_antrian.dart';

class HalamanBeranda extends StatefulWidget {
  const HalamanBeranda({super.key});

  @override
  State<HalamanBeranda> createState() => _HalamanBerandaState();
}

class _HalamanBerandaState extends State<HalamanBeranda> {
  final List<DataAntrian> _daftarAntrian = [];
  int _nomorTerakhir = 0;

  final TextEditingController _cariC = TextEditingController();
  String _kataKunci = '';

  String _formatNomor(int n) {
    return n.toString().padLeft(3, '0');
  }

  @override
  void dispose() {
    _cariC.dispose();
    super.dispose();
  }

  void _tampilkanPesan(String pesan, Color warna) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(pesan),
        backgroundColor: warna,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  List<DataAntrian> get _dataTampil {
    if (_kataKunci.isEmpty) return _daftarAntrian;

    return _daftarAntrian.where((d) {
      return d.nama.toLowerCase().contains(_kataKunci.toLowerCase()) ||
          d.nik.contains(_kataKunci) ||
          d.jenisPelayanan
              .toLowerCase()
              .contains(_kataKunci.toLowerCase()) ||
          d.noHp.contains(_kataKunci) ||
          _formatNomor(d.nomorAntrian).contains(_kataKunci);
    }).toList();
  }

  Future<void> _tambahData() async {
    final hasil = await Navigator.push<DataAntrian>(
      context,
      MaterialPageRoute(
        builder: (_) => const HalamanFormAntrian(),
      ),
    );

    if (hasil == null) return;

    setState(() {
      _nomorTerakhir++;
      final dataBaru =
          hasil.salinDengan(nomorAntrian: _nomorTerakhir);
      _daftarAntrian.add(dataBaru);
    });

    _tampilkanPesan("Data berhasil ditambahkan", Colors.green);
  }

  Future<void> _ubahData(int index) async {
    final dataSekarang = _daftarAntrian[index];

    final hasil = await Navigator.push<DataAntrian>(
      context,
      MaterialPageRoute(
        builder: (_) => HalamanFormAntrian(
          dataAwal: dataSekarang,
        ),
      ),
    );

    if (hasil == null) return;

    setState(() {
      _daftarAntrian[index] =
          hasil.salinDengan(nomorAntrian: dataSekarang.nomorAntrian);
    });

    _tampilkanPesan("Data berhasil diubah", Colors.blue);
  }

  void _hapusData(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Konfirmasi"),
        content: const Text("Yakin ingin menghapus data ini?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Batal"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _daftarAntrian.removeAt(index);
              });
              Navigator.pop(context);
              _tampilkanPesan(
                  "Data berhasil dihapus", Colors.red);
            },
            child: const Text("Hapus"),
          ),
        ],
      ),
    );
  }

  void _bukaDetail(DataAntrian data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            HalamanDetailAntrian(data: data),
      ),
    );
  }

  Widget _panelAtas() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Column(
        children: [
          TextField(
            controller: _cariC,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText:
                  "Cari (nama / NIK / pelayanan / HP / nomor)...",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onChanged: (value) {
              setState(() {
                _kataKunci = value;
              });
            },
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
                horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              "Total antrian: ${_daftarAntrian.length}",
              style:
                  const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tampilanKosong() {
    return const Center(
      child: Text(
        "Belum ada data antrian.\nTekan tombol + untuk menambah.",
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dataTampil = _dataTampil;

    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Antrian Pelayanan Kecamatan"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _tambahData,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          _panelAtas(),
          Expanded(
            child: _daftarAntrian.isEmpty
                ? _tampilanKosong()
                : ListView.builder(
                    itemCount: dataTampil.length,
                    itemBuilder: (context, index) {
                      final data = dataTampil[index];

                      return Padding(
                        padding:
                            const EdgeInsets.fromLTRB(
                                12, 8, 12, 8),
                        child: Card(
                          elevation: 2,
                          shape:
                              RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(
                                    14),
                          ),
                          child: ListTile(
                            contentPadding:
                                const EdgeInsets
                                    .symmetric(
                                        horizontal:
                                            16,
                                        vertical:
                                            10),
                            leading: Container(
                              width: 50,
                              height: 50,
                              alignment:
                                  Alignment.center,
                              decoration:
                                  BoxDecoration(
                                color: Colors
                                    .blue.shade50,
                                borderRadius:
                                    BorderRadius
                                        .circular(
                                            12),
                              ),
                              child: Text(
                                _formatNomor(data
                                    .nomorAntrian),
                                style:
                                    const TextStyle(
                                  fontWeight:
                                      FontWeight
                                          .bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            title: Text(
                              data.nama,
                              style:
                                  const TextStyle(
                                fontWeight:
                                    FontWeight
                                        .w700,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: Padding(
                              padding:
                                  const EdgeInsets
                                      .only(
                                          top:
                                              6),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                          Icons
                                              .description,
                                          size:
                                              16),
                                      const SizedBox(
                                          width:
                                              6),
                                      Text(
                                          "Pelayanan: ${data.jenisPelayanan}"),
                                    ],
                                  ),
                                  const SizedBox(
                                      height:
                                          4),
                                  Row(
                                    children: [
                                      const Icon(
                                          Icons
                                              .phone,
                                          size:
                                              16),
                                      const SizedBox(
                                          width:
                                              6),
                                      Text(
                                          "No HP: ${data.noHp}"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            isThreeLine:
                                true,
                            trailing:
                                Row(
                              mainAxisSize:
                                  MainAxisSize
                                      .min,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                      Icons
                                          .edit),
                                  onPressed: () =>
                                      _ubahData(
                                          index),
                                ),
                                IconButton(
                                  icon: const Icon(
                                      Icons
                                          .delete),
                                  onPressed: () =>
                                      _hapusData(
                                          index),
                                ),
                              ],
                            ),
                            onTap: () =>
                                _bukaDetail(
                                    data),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}