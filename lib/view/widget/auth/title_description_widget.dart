import 'package:flutter/material.dart';

class TitleDescriptionWidget extends StatelessWidget {
  const TitleDescriptionWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineLarge,
        // AppStyle.styleBold18(context).copyWith(
        //   color: AppColorText.primary,
        // ),
      ),
      subtitle: Text(
        subTitle,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .bodySmall, //AppStyle.styleLight14(context),
      ),
    );
  }
}
