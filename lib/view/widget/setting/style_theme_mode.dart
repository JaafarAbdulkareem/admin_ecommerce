import 'package:flutter/material.dart';

class StyleThemeMode extends StatelessWidget {
  final bool isDark;
  final void Function(bool) onChanged;

  const StyleThemeMode({
    super.key,
    required this.isDark,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!isDark),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: isDark ? Colors.black : Colors.white,
          border: Border.all(color: Colors.grey.shade300, width: 2),
        ),
        child: Stack(
          children: [
            Positioned(
              left: isDark ? 10 : 60,
              top: 10,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (child, animation) =>
                    ScaleTransition(scale: animation, child: child),
                child: isDark
                    ? const Row(
                        key: ValueKey("moon"),
                        children: [
                          Icon(Icons.brightness_2, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow, size: 12),
                        ],
                      )
                    : const Icon(Icons.wb_sunny,
                        color: Colors.amber, key: ValueKey("sun")),
              ),
            ),
            AnimatedAlign(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              alignment: isDark ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.all(5),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
