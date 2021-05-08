import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../controllers/controllers.dart';
import '../../../globals/globals.dart';
import '../../../models/models.dart';

import '../widgets.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final tasksController = watch(tasksProvider.notifier);
        return Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Checkbox(
                    value: task.isDone,
                    onChanged: (value) {
                      final updatedTask = task.copyWith(
                        isDone: value,
                        doneTime: DateTime.now().millisecondsSinceEpoch,
                      );
                      tasksController.update(task: updatedTask);
                    },
                  ),
                ),
                Expanded(
                  child: Text(
                    task.name,
                    style: CustomStyle.textStyleTaskName,
                  ),
                ),
                CustomIconButton(
                  icon: const Icon(Icons.arrow_drop_down),
                  color: Colors.transparent,
                  onPressed: () {
                    tasksController.remove(task: task);
                  },
                )
              ],
            ),
            Container(
              height: 1,
              color: const Color(0xFFE0E0E0),
            ),
          ],
        );
      },
    );
  }
}
