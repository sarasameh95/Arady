import 'package:ashghal/services/operations/domain/demands_entity.dart';
import 'package:flutter/material.dart';
import 'package:ashghal/core/theme/app_colors.dart';
class DemandCard extends StatelessWidget {
  final Demand demand;

  const DemandCard({super.key, required this.demand});
  String formatDate(String date) {
    final dt = DateTime.parse(date);
    return dt.toIso8601String().split('T').first;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          textDirection: TextDirection.rtl,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${demand.demandName} : المتقدم بالطلب'
              ,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text('النوع: ${demand.demandTypeName}', style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
            Text('المكان: ${demand.areaName}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
            Text('الحالة الحالية: ${demand.statusName}',
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
            const SizedBox(height: 8),
            Text(
              'بتاريخ : ${formatDate(demand.demandDate)}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,),
            ),
          ],
        ),
      ),
    );
  }
}
