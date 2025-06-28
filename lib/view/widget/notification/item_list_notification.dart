import 'package:admin_ecommerce/core/constant/app_color.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/data/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class ItemListNotification extends StatelessWidget {
  const ItemListNotification({
    super.key,
    required this.data,
  });
  final NotificationModel data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Card(
        color: Theme.of(context).cardColor,
        child: Center(
          child: ListTile(
            title: Text(
              data.title,
              style: Theme.of(context).textTheme.titleSmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              data.body,
              style: Theme.of(context).textTheme.bodySmall,
              maxLines: 3,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(
              Jiffy.parse(data.timeCreate, pattern: ConstantText.patternDate)
                  .fromNow(),
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: AppColor.primary,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
