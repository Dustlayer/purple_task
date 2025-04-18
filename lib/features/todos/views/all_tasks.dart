import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purple_task/features/todos/providers/providers.dart';
import 'package:purple_task/features/todos/views/sliver_task_list_header.dart';
import 'package:purple_task/features/todos/views/sliver_tasks_list.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({
    required this.categoryId,
    super.key,
    this.shrinkWrap = false,
  });

  final int categoryId;
  final bool shrinkWrap;

  @override
  _AllTasksState createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  late final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context);
    return Consumer(
      builder: (context, ref, _) {
        final todayCompletedTasks =
            ref.watch(todayCompletedTasksInCategoryProvider(widget.categoryId));
        final yesterdayCompletedTasks = ref.watch(
          yesterdayCompletedTasksInCategoryProvider(widget.categoryId),
        );
        final pastCompletedTasks =
            ref.watch(pastCompletedTasksInCategoryProvider(widget.categoryId));
        final noDueDateTasks =
            ref.watch(noDueDateTasksInCategoryProvider(widget.categoryId));
        final overdueTasks =
            ref.watch(overdueTasksInCategoryProvider(widget.categoryId));
        final todayTasks =
            ref.watch(todayTasksInCategoryProvider(widget.categoryId));
        final tomorrowTasks =
            ref.watch(tomorrowTasksInCategoryProvider(widget.categoryId));
        final futureTasks =
            ref.watch(futureTasksInCategoryProvider(widget.categoryId));
        return CustomScrollView(
          key: const PageStorageKey('all tasks'),
          controller: _scrollController,
          shrinkWrap: widget.shrinkWrap,
          slivers: [
            SliverTasksList(list: noDueDateTasks),
            if (overdueTasks.isNotEmpty)
              SliverTaskListHeader(title: tr.overdueTasksHeader),
            SliverTasksList(list: overdueTasks, isOrderFixed: true),
            if (todayTasks.isNotEmpty) SliverTaskListHeader(title: tr.today),
            SliverTasksList(list: todayTasks),
            if (tomorrowTasks.isNotEmpty)
              SliverTaskListHeader(title: tr.tomorrow),
            SliverTasksList(list: tomorrowTasks),
            if (futureTasks.isNotEmpty) SliverTaskListHeader(title: tr.later),
            SliverTasksList(list: futureTasks, isOrderFixed: true),
            if (todayCompletedTasks.isNotEmpty)
              SliverTaskListHeader(title: tr.completedTodayTasksHeader),
            SliverTasksList(list: todayCompletedTasks, isOrderFixed: true),
            if (yesterdayCompletedTasks.isNotEmpty)
              SliverTaskListHeader(title: tr.completedYesterdayTasksHeader),
            SliverTasksList(list: yesterdayCompletedTasks, isOrderFixed: true),
            if (pastCompletedTasks.isNotEmpty)
              SliverTaskListHeader(title: tr.completedEarlierTasksHeader),
            SliverTasksList(list: pastCompletedTasks, isOrderFixed: true),
          ],
        );
      },
    );
  }
}
