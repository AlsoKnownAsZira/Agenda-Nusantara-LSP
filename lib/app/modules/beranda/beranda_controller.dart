import 'package:agenda_nusantara/app/data/database/database_helper.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BerandaController extends GetxController {
  final selesai = 0.obs;
  final belumSelesai = 0.obs;
  final barGroups = <BarChartGroupData>[].obs;
  final barLabels = <String>[].obs;
  final selectedDate = DateTime.now().obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }
  String get tanggalFormatted =>
      DateFormat('dd MMMM yyyy', 'id').format(selectedDate.value);
  Future<void> loadData() async {
    final summary = await DatabaseHelper.instance.getTugasSummary();
    selesai.value = summary['selesai'] ?? 0;
    belumSelesai.value = summary['belumSelesai'] ?? 0;

    final perHari = await DatabaseHelper.instance.getTugasPerHari();
    final recent =
        perHari.length > 7 ? perHari.sublist(perHari.length - 7) : perHari;

    const hariNames = ['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Min'];
    barLabels.value = recent.map((e) {
      final tanggal = e['tanggal'] as String;
      final dt = DateTime.tryParse(tanggal);
      if (dt == null) return tanggal;
      return hariNames[dt.weekday - 1];
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
