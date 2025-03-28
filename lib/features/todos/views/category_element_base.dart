import 'package:flutter/material.dart';

import 'package:purple_task/core/ui/widgets/animated_progress_bar.dart';

class CategoryElementBase extends StatelessWidget {
  const CategoryElementBase({
    required this.icon,
    required this.name,
    required this.description,
    required this.progress,
    required this.color,
    super.key,
    this.iconSize,
    this.titleTextStyle,
  });

  final int icon;
  final String name;
  final String description;
  final double progress;
  final Color color;
  final double? iconSize;
  final TextStyle? titleTextStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              IconData(
                icon,
                fontFamily: 'AntIcons',
                fontPackage: 'ant_icons',
              ),
              size: iconSize,
              color: color,
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                name,
                style:
                    titleTextStyle ?? Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(description, style: Theme.of(context).textTheme.bodyMedium),
        Row(
          children: [
            Expanded(child: AnimatedProgressBar(color: color, value: progress)),
            const SizedBox(width: 8),
            Text(
              '${(progress * 100).toInt()}%',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ],
    );
  }
}
