import 'package:agenda_nusantara/app/modules/beranda/beranda_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BerandaChart extends StatelessWidget {
  const BerandaChart({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BerandaController>();
    return Obx(() {
      if (controller.barGroups.isEmpty) {
        return Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tugas Selesai per Hari',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 16),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Text(
                      'Belum ada tugas yang selesai',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }

      return Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tugas Selesai per Hari',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 180,
                child: BarChart(
                  BarChartData(
                    barGroups: controller.barGroups,
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            final idx = value.toInt();
                            if (idx < 0 || idx >= controller.barLabels.length) {
                              return const SizedBox();
                            }
                            return Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                controller.barLabels[idx],
                                style: const TextStyle(fontSize: 12),
                              ),
                            );
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 28,
                          getTitlesWidget: (value, meta) {
                            if (value % 1 != 0) return const SizedBox();
                            return Text(
                              value.toInt().toString(),
                              style: const TextStyle(fontSize: 11),
                            );
                          },
                        ),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    gridData: const FlGridData(show: false),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
