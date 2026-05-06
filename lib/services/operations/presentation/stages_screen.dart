import 'package:ashghal/core/dio_service.dart';
import 'package:ashghal/services/operations/cubit/stage_cubit.dart';
import 'package:ashghal/services/operations/cubit/stage_cubit_state.dart';
import 'package:ashghal/services/operations/domain/stage_entity.dart';
import 'package:ashghal/services/operations/presentation/widgets/stageTile.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ashghal/core/theme/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class StagesScreen extends StatelessWidget {
  //put id in constructor
  final int demandId;
  const StagesScreen({super.key, required this.demandId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('مراحل الطلب')),
      body: BlocProvider(
        create: (_) => StagesCubit()..getStages(demandId),
        child: BlocBuilder<StagesCubit, StagesState>(
          builder: (context, state) {
            if (state is StagesLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is StagesError) {
              return Center(child: Text(state.message));
            }

            if (state is StagesSuccess) {
              final stages = state.stages;

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: stages.length,
                itemBuilder: (context, index) {
                  return StageTile(
                    stage: stages[index],
                    isFirst: index == 0,
                    isLast: index == stages.length - 1,
                  );
                },
              );
            }
            else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}

