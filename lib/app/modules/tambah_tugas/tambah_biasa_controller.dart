import 'package:agenda_nusantara/app/data/database/database_helper.dart';
import 'package:agenda_nusantara/app/models/tugas_model.dart';
import 'package:agenda_nusantara/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TambahBiasaController extends GetxController {
  final judulC = TextEditingController();
  final deskripsiC = TextEditingController();
  final selectedDate = DateTime.now().obs;

  String get tanggalFormatted =>
      DateFormat('dd MMMM yyyy', 'id').format(selectedDate.value);

  Future<void> pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) selectedDate.value = picked;
  }

  Future<void> simpan() async {
    if (judulC.text.trim().isEmpty) {
      Get.snackbar(
        'Gagal',
        'Judul tugas tidak boleh kosong',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final tugas = TugasModel(
      judul: judulC.text.trim(),
      deskripsi: deskripsiC.text.trim(),
      tanggal: DateFormat('yyyy-MM-dd').format(selectedDate.value),
      kategori: 'biasa',
    );

    await DatabaseHelper.instance.insertTugas(tugas);
    Get.offAllNamed(AppRoutes.beranda);
  }

  @override
  void onClose() {
    judulC.dispose();
    deskripsiC.dispose();
    super.onClose();
  }
}
