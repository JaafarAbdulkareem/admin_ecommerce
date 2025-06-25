import 'package:admin_ecommerce/data/models/report/item_grid_model.dart';
import 'package:flutter/material.dart';

class ItemGridReport extends StatelessWidget {
  const ItemGridReport({
    super.key,
    required this.data,
  });

  final ItemReportModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: data.color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: data.color,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  data.count.toString(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              data.title,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }
}
