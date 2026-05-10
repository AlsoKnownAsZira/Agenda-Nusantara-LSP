import 'package:agenda_nusantara/app/modules/login/login_view.dart';
import 'package:get/get.dart';
import 'package:agenda_nusantara/app/routes/app_routes.dart';
import 'package:agenda_nusantara/app/modules/login/login_controller.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginView(),
      binding: BindingsBuilder(() => Get.put(LoginController())),
    ), //login page

    // GetPage(
    //   name: AppRoutes.beranda,
    //   page: () => BerandaView(),
    //   binding: BindingsBuilder(() => Get.put(BerandaController())),
    // ), //beranda page

    // GetPage(
    //   name: AppRoutes.daftarTugas,
    //   page: () => DaftarTugasView(),
    //   binding: BindingsBuilder(() => Get.put(DaftarTugasController())),
    // ), //daftar tugas page

    // GetPage(
    //   name: AppRoutes.tambahBiasa,
    //   page: () => TambahBiasaView(),
    //   binding: BindingsBuilder(() => Get.put(TambahBiasaController())),
    // ), //tambah biasa page

    // GetPage(
    //   name: AppRoutes.tambahPenting,
    //   page: () => TambahPentingView(),
    //   binding: BindingsBuilder(() => Get.put(TambahPentingController())),
    // ), //tambah penting page

    // GetPage(
    //   name: AppRoutes.pengaturan,
    //   page: () => PengaturanView(),
    //   binding: BindingsBuilder(() => Get.put(PengaturanController())),
    // ), //pengaturan page
  ];
}
