import 'package:admin_ecommerce/core/constant/app_icon.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/core/function/translate_language.dart';
import 'package:admin_ecommerce/core/share/cached_asset_image.dart';
import 'package:admin_ecommerce/data/models/product/product_model.dart';
import 'package:flutter/material.dart';

class ItemListProductView extends StatelessWidget {
  const ItemListProductView({
    super.key,
    required this.data,
    required this.deleteOnTap,
    required this.updateOnTap,
  });
  final ProductModel data;
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
                child: CachedAssetImage(image: data.image),
              ),
              Expanded(
                flex: 2,
                child: ListTile(
                  title: Text(
                    translateLanguage(
                      arabic: data.arabicName,
                      english: data.englishName,
                    ),
                    style: Theme.of(context).textTheme.titleSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    translateLanguage(
                      arabic: data.categoryArabicName,
                      english: data.categoryEnglishName,
                    ),
                    style: Theme.of(context).textTheme.labelLarge,
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
