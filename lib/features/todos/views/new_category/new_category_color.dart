import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purple_task/core/constants/custom_styles.dart';
import 'package:purple_task/features/todos/controllers/new_category_controller.dart';
import 'package:purple_task/features/todos/views/color_selector.dart';
import 'package:purple_task/features/todos/views/new_category/new_category_base.dart';

class CategoryColor extends ConsumerWidget {
  const CategoryColor({
    required this.name,
    required this.color,
    required this.onNext,
    required this.focusNode,
    super.key,
  });

  final String name;
  final Color color;
  final VoidCallback onNext;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tr = AppLocalizations.of(context);
    return NewCategoryBase(
      focusNode: focusNode,
      color: color,
      onNext: onNext,
      customWidget: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(48, 20, 32, 4),
              child: Text(
                name,
                style: CustomStyle.textStyle24
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
            ),
            Expanded(
              child: ColorSelector(
                selectedColor: color,
                onSelect:
                    ref.read(newCategoryNotifierProvider.notifier).changeColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2),
              child: Text(
                tr.newCategoryColorLabel,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
