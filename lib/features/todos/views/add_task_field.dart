import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:purple_task/core/constants/custom_styles.dart';

class AddTaskField extends StatefulWidget {
  const AddTaskField({
    required this.onAddTask,
    super.key,
  });

  final void Function(String) onAddTask;

  @override
  _AddTaskFieldState createState() => _AddTaskFieldState();
}

class _AddTaskFieldState extends State<AddTaskField> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    // for real time updates of text entry UI
    _controller.addListener(_updateField);
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _updateField() {
    setState(() {
      _hasText = _controller.text.trim().isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    return CupertinoTextField(
      controller: _controller,
      focusNode: _focusNode,
      placeholder: tr.addNewTaskInputPlaceholder,
      padding: const EdgeInsets.only(left: 8),
      style: CustomStyle.textStyleTaskName.copyWith(
        color: colorScheme.onSurface,
      ),
      suffix: IconButton(
        color: _hasText ? Colors.blue : Colors.grey,
        icon: const Icon(
          AntIcons.plusCircle,
        ),
        onPressed: _hasText
            ? () {
                widget.onAddTask(_controller.text);
                _controller.clear();
                _focusNode.requestFocus();
              }
            : null,
      ),
      onSubmitted: _hasText
          ? (_) {
              widget.onAddTask(_controller.text);
              _controller.clear();
              _focusNode.requestFocus();
            }
          : null,
      decoration: CustomStyle.inputDecoration.copyWith(
        color: colorScheme.surface,
      ),
    );
  }
}
