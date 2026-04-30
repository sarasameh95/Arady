import 'package:ashghal/core/theme/app_colors.dart';
import 'package:ashghal/services/operations/data/stage_model.dart';
import 'package:ashghal/services/operations/domain/stage_entity.dart';
import 'package:flutter/material.dart';

class StageTile extends StatelessWidget {
  final Stage stage;
  final bool isFirst;
  final bool isLast;

  const StageTile({super.key,
    required this.stage,
    required this.isFirst,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final color = _getColor(stage.status!);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// LEFT (Timeline)
        Column(
          children: [
            if (!isFirst)
              Container(width: 2, height: 20, color: Colors.grey.shade300),

            /// Circle
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: stage.status == StageStatus.completed
                  ? const Icon(Icons.check, color: Colors.white, size: 18)
                  : null,
            ),

            if (!isLast)
              Container(
                width: 2,
                height: 80,
                color: stage.status == StageStatus.completed
                    ? AppColors.primary
                    : Colors.grey.shade300,
              ),
          ],
        ),

        const SizedBox(width: 12),

        /// RIGHT (Card)
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: color.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(12),
              color: stage.status == StageStatus.current
                  ? color.withOpacity(0.05)
                  : Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title + Icon
                Row(
                  children: [
                    Icon(stage.stageIcon ?? Icons.assignment_turned_in , color: color),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        stage.newStatus,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: color,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                // /// Description
                // Text(
                //   stage.description,
                //   style: const TextStyle(color: Colors.black54),
                // ),
                //
                // const SizedBox(height: 8),

                /// Date
                if (stage.changedAt != null)
                  Text(
                    _formatDate(stage.changedAt!),
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),

                /// Current progress animation
                if (stage.status == StageStatus.current) ...[
                  const SizedBox(height: 10),
                  const LinearProgressIndicator(),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }

  Color _getColor(StageStatus status) {
    switch (status) {
      case StageStatus.completed:
        return AppColors.primary;
      case StageStatus.current:
        return Colors.blue;
      case StageStatus.upcoming:
        return Colors.grey;
    }
  }

  String _formatDate(DateTime date) {
    return "${date.day}/${date.month} - ${date.hour}:${date.minute}";
  }
}