import 'package:ashghal/services/operations/cubit/stage_cubit.dart';
import 'package:ashghal/services/operations/domain/stage_entity.dart';
import 'package:ashghal/services/operations/presentation/widgets/stageTile.dart';
import 'package:flutter/material.dart';
import 'package:ashghal/core/theme/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class StagesScreen extends StatelessWidget {
  //put id in constructor
  const StagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('مراحل الطلب')),
      body: BlocProvider(
        create: (_) => StagesCubit()..loadStages(),
        child: BlocBuilder<StagesCubit, List<Stage>>(
          builder: (context, stages) {
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
          },
        ),
      ),
    );
  }
}

