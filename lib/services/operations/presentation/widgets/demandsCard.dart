import 'package:ashghal/services/operations/domain/demands_entity.dart';
import 'package:ashghal/services/operations/presentation/stages_screen.dart';
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
    return InkWell(
      onTap: (){
        print('demand id :${demand.id}');
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (context) => const StagesScreen(),
          ),
        );
        //Navigator.pushNamed(context, '/demandDetails', arguments: demand.id);
      },
      child: Card(
        elevation: 3,
        color: lightColorScheme.onTertiary ,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
           child:
           //Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [ CircleAvatar(
          //       backgroundColor: lightColorScheme.primaryContainer,
          //       child: Icon(Icons.request_page_outlined , color: AppColors.primary,
          //       )
          //   ),
              Column(
                textDirection: TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(' طلب  ${demand.demandTypeName}', style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
                  const SizedBox(height: 8),
      
                  Text('المتقدم : ${demand.demandName}'
                    ,
                    style: const TextStyle(
                      fontSize: 16,
      
                    ),
                  ),
      
                  Text('المكان : ${demand.areaName}',
                    style: const TextStyle(
                      fontSize:16
                    ),),
                  Text(
                    'بتاريخ : ${formatDate(demand.demandDate)}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.darkGrey
                    ),
                  ),
                  const SizedBox(height: 10),
      
                  Text('الحالة الحالية : ${demand.statusName}',
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
      
                ],
              ),
      
           // ],
         // ),
        ),
      ),
    );
  }
}
