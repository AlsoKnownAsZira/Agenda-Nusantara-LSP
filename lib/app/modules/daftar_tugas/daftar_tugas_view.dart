import 'package:agenda_nusantara/app/models/tugas_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'daftar_tugas_controller.dart';

class DaftarTugasView extends GetView<DaftarTugasController> {
  const DaftarTugasView({super.key});

  String _formatTanggal(String tanggal) {
    try {
      final dt = DateTime.parse(tanggal);
      return DateFormat('dd MMM yyyy', 'id').format(dt);
    } catch (_) {
      return tanggal;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Daftar Tugas',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(() {
        if (controller.tugasList.isEmpty) {
          return const Center(
            child: Text(
              'Belum ada tugas',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: controller.tugasList.length,
          itemBuilder: (context, index) {
            final tugas = controller.tugasList[index];
            return _TugasItem(
              tugas: tugas,
              tanggalFormatted: _formatTanggal(tugas.tanggal),
              onToggle: () => controller.toggleSelesai(tugas),
            );
          },
        );
      }),
    );
  }
}

class _TugasItem extends StatelessWidget {
  final TugasModel tugas;
  final String tanggalFormatted;
  final VoidCallback onToggle;

  const _TugasItem({
    required this.tugas,
    required this.tanggalFormatted,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final isSelesai = tugas.selesai == 1;
    final isPenting = tugas.kategori == 'penting';

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      color: Colors.white,
      child: InkWell(
        onTap: onToggle,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          child: Row(
            children: [
              // Checkbox
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: isSelesai ? Colors.teal : Colors.transparent,
                  border: Border.all(
                    color: isSelesai ? Colors.teal : Colors.grey.shade400,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: isSelesai
                    ? const Icon(Icons.check, color: Colors.white, size: 16)
                    : null,
              ),
              const SizedBox(width: 14),

              // Judul + info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tugas.judul,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        decoration: isSelesai
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        color: isSelesai ? Colors.grey : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '$tanggalFormatted · ${isPenting ? 'Penting' : 'Biasa'}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),

              // Arrow
              Icon(
                Icons.play_arrow,
                color: isPenting ? Colors.red : Colors.green,
                size: 28,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
