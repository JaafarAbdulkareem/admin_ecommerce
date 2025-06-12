import 'package:admin_ecommerce/core/constant/app_icon.dart';
import 'package:admin_ecommerce/core/function/translate_language.dart';
import 'package:admin_ecommerce/core/share/catch_svg_image.dart';
import 'package:admin_ecommerce/data/models/category_model.dart';
import 'package:flutter/material.dart';

class ItemListCategoryView extends StatelessWidget {
  const ItemListCategoryView({
    super.key,
    required this.data,
  });
  final CategoryModel data;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: CatchSvgImage(image: data.image),
          ),
          Expanded(
            flex: 2,
            child: ListTile(
              title: Text(
                translateLanguage(
                    arabic: data.arabicName, english: data.englishName),
              ),
              subtitle: Text(data.timeCreate),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(AppIcon.edit),
          ),
        ],
      ),
    );
  }
}
