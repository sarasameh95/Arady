import 'package:ashghal/core/theme/app_colors.dart';
import 'package:ashghal/services/operations/domain/stage_entity.dart';
import 'package:flutter/material.dart';

class StageTile extends StatelessWidget {
  final Stage stage;
  final bool isFirst;
  final bool isLast;
  final bool isCurrent;


  const StageTile({super.key,
    required this.stage,
    required this.isFirst,
    required this.isLast,
    required this.isCurrent,
  });

  @override
  Widget build(BuildContext context) {
   // final color = _getColor(isLast);

    return IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          /// LEFT TIMELINE
          SizedBox(
          width: 40,
          child: Column(
        children: [
          if (!isFirst)
            Expanded(child: Container(width: 2, height: 20, color: Colors.grey.shade300)),

          /// Circle
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: isCurrent ? lightColorScheme.primaryContainer : _getColor(isLast),
              shape: BoxShape.circle,
            ),
            child: isCurrent
                ? null
                : const Icon(Icons.check, color: Colors.white, size: 18) ,
          ),

          if (!isLast)
            Expanded(
              child: Container(
                width: 2,
                height: 80,
                 color:
                // stage.status == StageStatus.completed
                //     ? AppColors.primary
                //     :
                   AppColors.primary,
              ),
            ),
    ]
       ),
       ),
          const SizedBox(width: 12),

      /// RIGHT (Card)
      Expanded(
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withValues(alpha: 0.3)),
            borderRadius: BorderRadius.circular(12),
            // color: stage.status == StageStatus.current
            //     ? color.withOpacity(0.05)
            //     : Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title + Icon
              Row(
                children: [
                  isCurrent ? Icon(
                    Icons.flag, color: lightColorScheme.primaryContainer ):
                  Icon(_getIcon(isLast),color: _getColor(isLast),),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      stage.newStatus,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
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
                 // stage.changedAt!,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),

              /// Current progress animation
              // if (stage.status == StageStatus.current) ...[
              //   const SizedBox(height: 10),
              //   const LinearProgressIndicator(value: 0.1,),
              // ],
            ],
          ),
        ),
      ),
    ]
      ),
    );
  }

  Color _getColor(bool status) {
    if (status) {
        return Colors.grey;
    }
    else {
      return AppColors.primary;
    }
      // case StageStatus.current:
      //   return lightColorScheme.primaryContainer;
      // case StageStatus.upcoming:
      //   return Colors.grey;

  }
  IconData _getIcon(bool status) {
    if (status) {
      return Icons.check;
    }
    else {
      return Icons.assignment_turned_in;
    }
    // case StageStatus.current:
    //   return lightColorScheme.primaryContainer;
    // case StageStatus.upcoming:
    //   return Colors.grey;

  }


  String _formatDate(String date) {
    final dateTime = DateTime.parse(date);
    return "${dateTime.day}/${dateTime.month}/${dateTime.year} - ${dateTime.hour}:${dateTime.minute}";
  }
}