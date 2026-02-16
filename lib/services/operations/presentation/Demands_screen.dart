import 'package:ashghal/core/dio_service.dart';
import 'package:ashghal/services/Login/presentation/widgets/appBar_title.dart';
import 'package:ashghal/services/operations/cubit/demands_cubit.dart';
import 'package:ashghal/services/operations/cubit/demands_cubit_state.dart';
import 'package:ashghal/services/operations/data/demands_model.dart';
import 'package:ashghal/services/operations/domain/demands_entity.dart';
import 'package:ashghal/services/operations/presentation/widgets/demandsCard.dart';
import 'package:flutter/material.dart';
import 'package:ashghal/core/theme/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class DemandsScreen extends StatefulWidget {
  const DemandsScreen({super.key});


  @override
  State<StatefulWidget> createState() => _DemandsScreenState();
}
//late Future<List<Demand>> futureDemands;

/*
Future<List<Demand>> loadDemands() async {
  print('loadDemands');
  final demands = await DemandService().getUserDemands();
  print(demands);
  return sortDemandsByLatest(demands);
}
List<Demand> sortDemandsByLatest(List<Demand> demands) {
  demands.sort(
        (a, b) => DateTime.parse(b.demandDate)
        .compareTo(DateTime.parse(a.demandDate)),
  );
  return demands;
}
*/
class _DemandsScreenState extends State<DemandsScreen> {

  @override
  Widget build(BuildContext context) {
   // futureDemands = loadDemands();
    return Scaffold(

      body: BlocBuilder<DemandsCubit, DemandsState>(
        builder: (context, state) {
          if (state is DemandsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is DemandsError) {
            return Center(child: Text(state.message));
          }

          if (state is DemandsSuccess) {
            final demands = state.demandsList;

            if (demands.isEmpty) {
              return const Center(child: Text('ليس لديك طلبات مسجلة بعد ',
                style: TextStyle(color:AppColors.primary, fontSize: 20 ),));

            }

            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: demands.length,
              separatorBuilder: (_, __) =>
              const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final demand = demands[index];
                return DemandCard(demand: demand);
              },
            );
          }

          // initial state
          return const SizedBox.shrink();
        },
      ),
      // FutureBuilder<List<Demand>>(
      //   future: futureDemands,
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(child: CircularProgressIndicator());
      //     }
      //
      //     if (snapshot.hasError) {
      //       return Center(child: Text(snapshot.error.toString()));
      //     }
      //
      //     final demands = snapshot.data!;
      //
      //     if (demands.isEmpty) {
      //       return const Center(child: Text('No demands found'));
      //     }
      //
      //     return ListView.separated(
      //       padding: const EdgeInsets.all(16),
      //       itemCount: demands.length,
      //       separatorBuilder: (_, __) => const SizedBox(height: 12),
      //       itemBuilder: (context, index) {
      //         final demand = demands[index];
      //
      //         return DemandCard(demand: demand);
      //       },
      //     );
      //   },
      // ),
    );
    /*return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const SizedBox(height: 12),

                /// Title
                const Text(
                  'الطلبات التي قمت بها',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                /// Filter Buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _filterButton('الكل', isActive: true),
                      const SizedBox(width: 8),
                      _filterButton('الأحدث'),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                /// List
                Expanded(
                  child: ListView.separated(
                    itemCount: 6,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      return
                      //   _operationItem(
                      //   time: index == 0 ? '2d ago' : '3d ago',
                      //   title: 'New Product View',
                      //   subtitle: 'Sally Mandrus, viewed your product',
                      //   isActive: index == 0,
                      // );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );*/
  }


  /// Filter Button Widget
   Widget _filterButton(String text, {bool isActive = false}) {
    return InkWell(
      onTap: () async {
     //   List<DemandsModel> list = await DemandsRemoteDataSource.getDemands();
        setState(() {
          isActive = !isActive;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: isActive?Border.all(color: AppColors.secondary): Border.all(color: Colors.grey.shade300),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isActive ? AppColors.primary: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  // /// Operation Item Widget
  //  Widget _operationItem({
  //   required String time,
  //   required String title,
  //   required String subtitle,
  //   bool isActive = false,
  // }) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  //     child: Row(
  //       children: [
  //         /// Text Content
  //         Expanded(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 title,
  //                 style: const TextStyle(
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //               const SizedBox(height: 4),
  //               Text(
  //                 subtitle,
  //                 style: TextStyle(
  //                   color: Colors.grey.shade600,
  //                   fontSize: 13,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //
  //         /// Time
  //         Text(
  //           time,
  //           style: TextStyle(
  //             color: Colors.grey.shade500,
  //             fontSize: 12,
  //           ),
  //         ),
  //
  //         const SizedBox(width: 8),
  //
  //         /// Right Indicator
  //         Container(
  //           width: 4,
  //           height: 40,
  //           decoration: BoxDecoration(
  //             color: isActive ? AppColors.primary: Colors.grey.shade300,
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
