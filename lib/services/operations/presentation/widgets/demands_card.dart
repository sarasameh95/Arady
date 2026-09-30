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
            builder: (context) =>  StagesScreen(demandId: demand.id,),
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
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('${demand.demandTypeName}', style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),),
                      const Spacer(),
                     Text('رقم : ${demand.id}',
                     style: const TextStyle(fontSize: 12,))
                     // const Icon(Icons.arrow_forward_ios, color: AppColors.primary,),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text('الحالة الحالية : ${demand.statusName}',
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                      color: AppColors.secondary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                  const SizedBox(height: 8),
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.person, color: AppColors.primary,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('  ${demand.demandName} : المتقدم',
                          style: const TextStyle(
                            fontSize: 16,

                          ),
                        ),
                      ),
                    ],
                  ),
      
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.pin_drop , color: AppColors.primary,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('المكان : ${demand.areaName}',
                          style: const TextStyle(
                            fontSize:16
                          ),),
                      ),
                    ],
                  ),
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Icon(Icons.date_range , color: AppColors.primary,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child:
                  Text(
                    'بتاريخ : ${formatDate(demand.demandDate)}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.darkGrey
                    ),
                  ),
          ),],)

                ],
              ),
      
           // ],
         // ),
        ),
      ),
    );
  }
}
