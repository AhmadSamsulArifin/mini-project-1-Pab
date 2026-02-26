import 'package:flutter/material.dart';
import 'pages/halaman_beranda.dart';

void main() {
  runApp(const AplikasiAntrian());
}

class AplikasiAntrian extends StatelessWidget {
  const AplikasiAntrian({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Antrian Kecamatan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HalamanBeranda(),
    );
  }
}