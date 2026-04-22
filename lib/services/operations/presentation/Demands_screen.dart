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
            print(state.message);
            return Center(child: Text('حدث خطأ ما برجاء المحاولة لاحقا'));
          }

          if (state is DemandsSuccess) {
            final demands = state.demandsList;

            if (demands.isEmpty) {
              return const Center(child: Text('ليس لديك طلبات مسجلة بعد ',
                style: TextStyle(color:AppColors.primary, fontSize: 20 ),));

            }

            return RefreshIndicator(
              onRefresh: () async {
                context.read<DemandsCubit>().getDemandsFromApi(); // 🔥 call API again
              },
              child: ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(), // important!
                padding: const EdgeInsets.all(16),
                itemCount: demands.length,
                separatorBuilder: (_, __) =>
                const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final demand = demands[index];
                  return DemandCard(demand: demand);
                },
              ),
            );
          }

          // initial state
          return const SizedBox.shrink();
        },
      ),
    );
  }


  /// Filter Button Widget
   Widget _filterButton(String text, {bool isActive = false}) {
    return InkWell(
      onTap: () async {
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
  
}
