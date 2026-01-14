import 'package:ashghal/services/operations/data/demands_data_source.dart';
import 'package:ashghal/services/operations/data/demands_model.dart';
import 'package:flutter/material.dart';
import 'package:ashghal/core/theme/app_colors.dart';

class DemandsScreen extends StatefulWidget {
  const DemandsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _DemandsScreenState();
}

class _DemandsScreenState extends State<DemandsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      return _operationItem(
                        time: index == 0 ? '2d ago' : '3d ago',
                        title: 'New Product View',
                        subtitle: 'Sally Mandrus, viewed your product',
                        isActive: index == 0,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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

  /// Operation Item Widget
   Widget _operationItem({
    required String time,
    required String title,
    required String subtitle,
    bool isActive = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          /// Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),

          /// Time
          Text(
            time,
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 12,
            ),
          ),

          const SizedBox(width: 8),

          /// Right Indicator
          Container(
            width: 4,
            height: 40,
            decoration: BoxDecoration(
              color: isActive ? AppColors.primary: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}
