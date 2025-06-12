import 'package:admin_ecommerce/core/constant/app_icon.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/core/function/translate_language.dart';
import 'package:admin_ecommerce/core/share/catched_svg_image.dart';
import 'package:admin_ecommerce/data/models/category_model.dart';
import 'package:flutter/material.dart';

class ItemListCategoryView extends StatelessWidget {
  const ItemListCategoryView({
    super.key,
    required this.data,
    required this.deleteOnTap, required this.updateOnTap,
  });
  final CategoryModel data;
  final VoidCallback deleteOnTap, updateOnTap;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: updateOnTap,
      child: Card(
        color: Theme.of(context).cardColor,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: CatchedSvgImage(image: data.image),
              ),
              Expanded(
                flex: 2,
                child: ListTile(
                  title: Text(
                    translateLanguage(
                        arabic: data.arabicName, english: data.englishName),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  subtitle: Text(
                    data.timeCreate,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
              IconButton(
                onPressed: deleteOnTap,
                icon: const Icon(
                  AppIcon.delete,
                  size: ConstantScale.iconDelete,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
