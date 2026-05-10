import 'package:agenda_nusantara/app/data/database/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class LoginController extends GetxController {
  final usernameC = TextEditingController();
  final passwordC = TextEditingController();

  Future<void> login() async {
    final result = await DatabaseHelper.instance.login(
      usernameC.text.trim(),
      passwordC.text.trim(),
    );

    if (result) {
      Get.offAllNamed(AppRoutes.beranda);
    } else {
      Get.snackbar(
        'Login Gagal',
        'Username atau password salah',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onClose() {
    usernameC.dispose();
    passwordC.dispose();
    super.onClose();
  }
}