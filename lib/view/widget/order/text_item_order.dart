import 'package:flutter/material.dart';

class TextItemOrder extends StatelessWidget {
  const TextItemOrder({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelLarge,
        textAlign: TextAlign.center,
      ),
    );
  }
}
