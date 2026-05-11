import 'package:agenda_nusantara/app/modules/beranda/beranda_controller.dart';
import 'package:agenda_nusantara/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TugasCount extends StatelessWidget {
  const TugasCount({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BerandaController>();
    return Obx(
      () => Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.daftarTugas);
              },
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Tugas Selesai',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${controller.selesai.value}',
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 40,
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
              onTap: () {
                Get.toNamed(AppRoutes.daftarTugas);
              },
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Tugas Belum Selesai',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${controller.belumSelesai.value}',
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 40,
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
    );
  }
}
