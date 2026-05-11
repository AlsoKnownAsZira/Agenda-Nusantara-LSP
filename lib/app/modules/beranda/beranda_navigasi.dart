import 'package:agenda_nusantara/app/modules/beranda/beranda_controller.dart';
import 'package:agenda_nusantara/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BerandaNavigasi extends StatelessWidget {
  const BerandaNavigasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.tambahPenting),
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 45,
                          width: 45,
                          child: const Icon(Icons.add, color: Colors.white),
                        ),
                        const Text(
                          'Tambah Tugas Penting',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.tambahBiasa),
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 45,
                          width: 45,
                          child: const Icon(Icons.add, color: Colors.white),
                        ),
                        const Text(
                          'Tambah Tugas Biasa',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  await Get.toNamed(AppRoutes.daftarTugas);
                  Get.find<BerandaController>().loadData();
                },
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 45,
                          width: 45,
                          child: const Icon(Icons.list, color: Colors.white),
                        ),
                        const Text(
                          'Daftar Tugas',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.pengaturan),
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 45,
                          width: 45,
                          child: const Icon(Icons.settings, color: Colors.white),
                        ),
                        const Text(
                          'Pengaturan',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
