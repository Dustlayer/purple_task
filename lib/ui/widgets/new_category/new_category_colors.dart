import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../globals/strings/strings.dart';
import '../../../models/new_category.dart';
import '../../../ui/widgets/new_category/colors_list.dart';

class CategoryColor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(32.0, 24.0, 32.0, 0.0),
          child: Consumer<NewCategory>(
            builder: (_, value, __) => Text(
              value.name,
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ),
        SizedBox(height: 8.0),
        Expanded(child: ColorsList()),
        SizedBox(height: 4.0),
        Text(
          COLOR,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        Spacer(),
      ],
    );
  }
}
