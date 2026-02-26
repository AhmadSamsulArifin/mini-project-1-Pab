import 'package:flutter/material.dart';
import '../models/data_antrian.dart';

class HalamanDetailAntrian extends StatelessWidget {
  final DataAntrian data;

  const HalamanDetailAntrian({
    super.key,
    required this.data,
  });

  String _formatNomor(int n) {
    return n.toString().padLeft(3, '0');
  }

  Widget _itemDetail({
    required IconData ikon,
    required String judul,
    required String isi,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 38,
            height: 38,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              ikon,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  judul,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  isi,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Antrian'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Header nomor antrian
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.green.shade200,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.confirmation_number),
                          const SizedBox(width: 8),
                          Text(
                            'Nomor ${_formatNomor(data.nomorAntrian)}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 18),
                    const Divider(height: 0),
                    const SizedBox(height: 6),

                    _itemDetail(
                      ikon: Icons.person,
                      judul: 'Nama',
                      isi: data.nama,
                    ),
                    const Divider(height: 0),

                    _itemDetail(
                      ikon: Icons.credit_card,
                      judul: 'NIK',
                      isi: data.nik,
                    ),
                    const Divider(height: 0),

                    _itemDetail(
                      ikon: Icons.description,
                      judul: 'Jenis Pelayanan',
                      isi: data.jenisPelayanan,
                    ),
                    const Divider(height: 0),

                    _itemDetail(
                      ikon: Icons.phone,
                      judul: 'No HP',
                      isi: data.noHp,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}