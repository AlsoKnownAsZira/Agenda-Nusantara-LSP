import 'package:agenda_nusantara/app/data/database/database_helper.dart';
import 'package:agenda_nusantara/app/models/tugas_model.dart';
import 'package:get/get.dart';

class DaftarTugasController extends GetxController {
  final tugasList = <TugasModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadTugas();
  }

  Future<void> loadTugas() async {
    tugasList.value = await DatabaseHelper.instance.getAllTugas();
  }

  Future<void> toggleSelesai(TugasModel tugas) async {
    final newStatus = tugas.selesai == 0 ? 1 : 0;
    await DatabaseHelper.instance.updateSelesai(tugas.id!, newStatus);
    await loadTugas();
  }
}
