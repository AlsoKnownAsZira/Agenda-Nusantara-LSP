import 'package:agenda_nusantara/app/modules/beranda/beranda_controller.dart';
import 'package:agenda_nusantara/app/modules/beranda/beranda_view.dart';
import 'package:agenda_nusantara/app/modules/login/login_controller.dart';
import 'package:agenda_nusantara/app/modules/login/login_view.dart';
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
      page: () => LoginView(),
      binding: BindingsBuilder(() => Get.lazyPut(() => LoginController())),
    ), //login page

    GetPage(
      name: AppRoutes.beranda,
      page: () => BerandaView(),
      binding: BindingsBuilder(() => Get.lazyPut(() => BerandaController())),
    ), //beranda page

    // GetPage(
    //   name: AppRoutes.daftarTugas,
    //   page: () => DaftarTugasView(),
    //   binding: BindingsBuilder(() => Get.put(DaftarTugasController())),
    // ), //daftar tugas page

    GetPage(
      name: AppRoutes.tambahBiasa,
      page: () => TambahBiasaView(),
      binding: BindingsBuilder(() => Get.lazyPut(() => TambahBiasaController())),
    ), //tambah biasa page
    GetPage(
      name: AppRoutes.tambahPenting,
      page: () => TambahPentingView(),
      binding: BindingsBuilder(
        () => Get.lazyPut(() => TambahPentingController()),
      ),
    ), //tambah penting page
    // GetPage(
    //   name: AppRoutes.pengaturan,
    //   page: () => PengaturanView(),
    //   binding: BindingsBuilder(() => Get.put(PengaturanController())),
    // ), //pengaturan page
  ];
}
