import 'package:agenda_nusantara/app/modules/beranda/beranda_controller.dart';
import 'package:agenda_nusantara/app/modules/beranda/beranda_view.dart';
import 'package:agenda_nusantara/app/modules/daftar_tugas/daftar_tugas_controller.dart';
import 'package:agenda_nusantara/app/modules/daftar_tugas/daftar_tugas_view.dart';
import 'package:agenda_nusantara/app/modules/login/login_controller.dart';
import 'package:agenda_nusantara/app/modules/login/login_view.dart';
import 'package:agenda_nusantara/app/modules/pengaturan/pengaturan_controller.dart';
import 'package:agenda_nusantara/app/modules/pengaturan/pengaturan_view.dart';
import 'package:agenda_nusantara/app/modules/tambah_penting/tambah_penting_controller.dart';
import 'package:agenda_nusantara/app/modules/tambah_penting/tambah_penting_view.dart';
import 'package:agenda_nusantara/app/modules/tambah_tugas/tambah_biasa_controller.dart';
import 'package:agenda_nusantara/app/modules/tambah_tugas/tambah_biasa_view.dart';
import 'package:agenda_nusantara/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: BindingsBuilder(() => Get.lazyPut(() => LoginController())),
    ),
    GetPage(
      name: AppRoutes.beranda,
      page: () => const BerandaView(),
      binding: BindingsBuilder(() => Get.lazyPut(() => BerandaController())),
    ),
    GetPage(
      name: AppRoutes.tambahPenting,
      page: () => const TambahPentingView(),
      binding: BindingsBuilder(() => Get.lazyPut(() => TambahPentingController())),
    ),
    GetPage(
      name: AppRoutes.tambahBiasa,
      page: () => TambahBiasaView(),
      binding: BindingsBuilder(() => Get.lazyPut(() => TambahBiasaController())),
    ),
    GetPage(
      name: AppRoutes.daftarTugas,
      page: () => const DaftarTugasView(),
      binding: BindingsBuilder(() => Get.lazyPut(() => DaftarTugasController())),
    ),
    GetPage(
      name: AppRoutes.pengaturan,
      page: () => const PengaturanView(),
      binding: BindingsBuilder(() => Get.lazyPut(() => PengaturanController())),
    ),
  ];
}
