import 'package:agenda_nusantara/app/modules/beranda/beranda_chart.dart';
import 'package:agenda_nusantara/app/modules/beranda/beranda_navigasi.dart';
import 'package:agenda_nusantara/app/modules/beranda/tugas_count.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'beranda_controller.dart';

class BerandaView extends GetView<BerandaController> {
  const BerandaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          'Beranda',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Halo, User!👋🏻",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("${DateTime.now().toString().substring(0, 10)}"),
              ],
            ),
            const SizedBox(height: 20),
            TugasCount(),
            const SizedBox(height: 20),
            BerandaChart(),
            BerandaNavigasi(),
          ],
        ),
      ),
    );
  }
}
