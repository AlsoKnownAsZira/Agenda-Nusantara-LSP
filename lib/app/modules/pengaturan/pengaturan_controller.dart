import 'package:agenda_nusantara/app/data/database/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PengaturanController extends GetxController {
  final passwordSaatIniC = TextEditingController();
  final passwordBaruC = TextEditingController();

  Future<void> simpanPassword() async {
    final input = passwordSaatIniC.text.trim();
    final baru = passwordBaruC.text.trim();

    if (input.isEmpty || baru.isEmpty) {
      Get.snackbar(
        'Gagal',
        'Semua field harus diisi',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final currentPassword = await DatabaseHelper.instance.getPassword();
    if (input != currentPassword) {
      Get.snackbar(
        'Gagal',
        'Password saat ini salah',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    await DatabaseHelper.instance.updatePassword(baru);
    passwordSaatIniC.clear();
    passwordBaruC.clear();
    Get.snackbar(
      'Berhasil',
      'Password berhasil diubah',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.teal,
      colorText: Colors.white,
    );
  }

  @override
  void onClose() {
    passwordSaatIniC.dispose();
    passwordBaruC.dispose();
    super.onClose();
  }
}
