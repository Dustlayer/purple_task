import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:purple_task/core/constants/category_icons.dart';

class IconSelector extends StatefulWidget {
  const IconSelector({
    required this.selectedIcon,
    required this.onSelect,
    super.key,
  });

  final int selectedIcon;
  final ValueChanged<int> onSelect;

  @override
  State<IconSelector> createState() => _IconSelectorState();
}

class _IconSelectorState extends State<IconSelector> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => scrollController.animateTo(
        78.0 * categoryIcons.indexOf(widget.selectedIcon) - 40,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: Scrollbar(
        controller: scrollController,
        thumbVisibility: true,
        child: ListView.builder(
          controller: scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: categoryIcons.length,
          itemBuilder: (context, index) {
            final icon = categoryIcons[index];
            final isSelected = widget.selectedIcon == icon;
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 300),
              child: SlideAnimation(
                horizontalOffset: 100,
                child: FadeInAnimation(
                  child: Padding(
                    padding: isSelected
                        ? const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 4,
                          )
                        : const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 4,
                          ),
                    child: SizedBox(
                      width: 70,
                      child: Card(
                        color: Colors.grey.shade300,
                        elevation: isSelected ? 4 : 1,
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          autofocus: isSelected,
                          onFocusChange: (value) => widget.onSelect(icon),
                          onTap: () => widget.onSelect(icon),
                          child: Icon(
                            IconData(
                              categoryIcons[index],
                              fontFamily: 'AntIcons',
                              fontPackage: 'ant_icons',
                            ),
                            color: Colors.grey.shade800,
                            size: isSelected ? 30 : 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
