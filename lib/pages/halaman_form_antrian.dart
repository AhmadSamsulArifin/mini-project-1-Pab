import 'package:flutter/material.dart';
import '../models/data_antrian.dart';

class HalamanFormAntrian extends StatefulWidget {
  final DataAntrian? dataAwal;

  const HalamanFormAntrian({
    super.key,
    this.dataAwal,
  });

  @override
  State<HalamanFormAntrian> createState() => _HalamanFormAntrianState();
}

class _HalamanFormAntrianState extends State<HalamanFormAntrian> {
  final _kunciForm = GlobalKey<FormState>();

  late final TextEditingController _namaC;
  late final TextEditingController _nikC;
  late final TextEditingController _hpC;

  String? _jenisTerpilih;

  final List<String> _daftarPelayanan = [
    'Pembuatan KTP',
    'Pembuatan KK',
    'Surat Domisili',
    'Surat Pindah',
    'Legalisasi Dokumen',
    'Layanan Lainnya',
  ];

  bool get modeEdit => widget.dataAwal != null;

  @override
  void initState() {
    super.initState();

    _namaC = TextEditingController(text: widget.dataAwal?.nama ?? '');
    _nikC = TextEditingController(text: widget.dataAwal?.nik ?? '');
    _hpC = TextEditingController(text: widget.dataAwal?.noHp ?? '');

    _jenisTerpilih = widget.dataAwal?.jenisPelayanan;
  }

  @override
  void dispose() {
    _namaC.dispose();
    _nikC.dispose();
    _hpC.dispose();
    super.dispose();
  }

  String? _wajibIsi(String? value, String label) {
    if (value == null || value.trim().isEmpty) return '$label wajib diisi';
    return null;
  }

  String? _validasiNik(String? value) {
    final nik = (value ?? '').trim();
    if (nik.isEmpty) return 'NIK wajib diisi';
    if (nik.length != 16) return 'NIK harus 16 digit';
    if (int.tryParse(nik) == null) return 'NIK harus angka';
    return null;
  }

  String? _validasiHp(String? value) {
    final hp = (value ?? '').trim();
    if (hp.isEmpty) return 'No HP wajib diisi';
    if (int.tryParse(hp) == null) return 'No HP harus angka';
    if (hp.length < 10 || hp.length > 13) return 'No HP 10–13 digit';
    return null;
  }

  void _simpan() {
    final valid = _kunciForm.currentState?.validate() ?? false;
    if (!valid) return;

    final jenis = _jenisTerpilih;
    if (jenis == null || jenis.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Silakan pilih jenis pelayanan')),
      );
      return;
    }

    final hasil = DataAntrian(
      id: widget.dataAwal?.id ?? DateTime.now().microsecondsSinceEpoch.toString(),
      nomorAntrian: widget.dataAwal?.nomorAntrian ?? -1,
      nama: _namaC.text.trim(),
      nik: _nikC.text.trim(),
      jenisPelayanan: jenis,
      noHp: _hpC.text.trim(),
    );

    Navigator.pop(context, hasil);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(modeEdit ? 'Ubah Data Antrian' : 'Tambah Antrian'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _kunciForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Form Data Warga',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  TextFormField(
                    controller: _namaC,
                    decoration: InputDecoration(
                      labelText: 'Nama',
                      prefixIcon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (v) => _wajibIsi(v, 'Nama'),
                  ),
                  const SizedBox(height: 14),

                  TextFormField(
                    controller: _nikC,
                    decoration: InputDecoration(
                      labelText: 'NIK (16 digit)',
                      prefixIcon: const Icon(Icons.credit_card),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: _validasiNik,
                  ),
                  const SizedBox(height: 14),

                  DropdownButtonFormField<String>(
                    value: _jenisTerpilih,
                    decoration: InputDecoration(
                      labelText: 'Jenis Pelayanan',
                      prefixIcon: const Icon(Icons.description),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    items: _daftarPelayanan.map((item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _jenisTerpilih = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Pilih jenis pelayanan';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 14),

                  TextFormField(
                    controller: _hpC,
                    decoration: InputDecoration(
                      labelText: 'No HP',
                      prefixIcon: const Icon(Icons.phone),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: _validasiHp,
                  ),
                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _simpan,
                      icon: const Icon(Icons.save),
                      label: Text(modeEdit ? 'Simpan Perubahan' : 'Simpan'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}