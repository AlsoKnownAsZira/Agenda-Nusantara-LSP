import 'package:agenda_nusantara/app/data/database/database_helper.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BerandaController extends GetxController {
  final selesai = 0.obs;
  final belumSelesai = 0.obs;
  final barGroups = <BarChartGroupData>[].obs;
  final barLabels = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    final summary = await DatabaseHelper.instance.getTugasSummary();
    selesai.value = summary['selesai'] ?? 0;
    belumSelesai.value = summary['belumSelesai'] ?? 0;

    final perHari = await DatabaseHelper.instance.getTugasPerHari();
    final recent =
        perHari.length > 7 ? perHari.sublist(perHari.length - 7) : perHari;

    barLabels.value = recent.map((e) {
      final tanggal = e['tanggal'] as String;
      return tanggal.substring(8, 10);
    }).toList();

    barGroups.value = recent.asMap().entries.map((entry) {
      return BarChartGroupData(
        x: entry.key,
        barRods: [
          BarChartRodData(
            toY: (entry.value['jumlah'] as int).toDouble(),
            color: Colors.teal,
            width: 24,
          ),
        ],
      );
    }).toList();
  }
}
