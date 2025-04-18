import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purple_task/core/helpers.dart';
import 'package:purple_task/features/todos/controllers/categories_controller.dart';
import 'package:purple_task/features/todos/controllers/category_controller.dart';
import 'package:purple_task/features/todos/controllers/tasks_controller.dart';
import 'package:purple_task/features/todos/models/task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
class NoDueDateTasksInCategory extends _$NoDueDateTasksInCategory {
  @override
  List<Task> build(int categoryId) {
    final tasks = ref.watch(tasksNotifierProvider).valueOrNull;

    if (tasks == null) {
      return [];
    }
    final noDueDateTasks = tasks
        .where(
          (task) =>
              task.categoryId == categoryId &&
              !task.isDone &&
              task.dueDate == null,
        )
        .toList();
    return noDueDateTasks;
  }
}

@riverpod
class OverdueTasksInCategory extends _$OverdueTasksInCategory {
  @override
  List<Task> build(int categoryId) {
    final tasks = ref.watch(tasksNotifierProvider).valueOrNull;

    if (tasks == null) {
      return [];
    }
    final notDoneTasks = tasks.where(
      (task) =>
          task.categoryId == categoryId && !task.isDone && task.dueDate != null,
    );
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final overdueTasks = <Task>[];
    for (final task in notDoneTasks) {
      final taskDueDate = task.dueDate!.millisToDay();
      if (taskDueDate.isBefore(today)) {
        overdueTasks.add(task);
      }
    }
    overdueTasks.sort(
      (a, b) => a.dueDate!.compareTo(b.dueDate!),
    );
    return overdueTasks;
  }
}

@riverpod
class TodayTasksInCategory extends _$TodayTasksInCategory {
  @override
  List<Task> build(int categoryId) {
    final tasks = ref.watch(tasksNotifierProvider).valueOrNull;

    if (tasks == null) {
      return [];
    }
    final notDoneTasks = tasks.where(
      (task) =>
          !task.isDone && task.categoryId == categoryId && task.dueDate != null,
    );
    final todayTasks = <Task>[];
    for (final task in notDoneTasks) {
      final taskDueDate = task.dueDate!.millisToDay();
      if (taskDueDate.isToday) {
        todayTasks.add(task);
      }
    }
    return todayTasks;
  }
}

@riverpod
class TomorrowTasksInCategory extends _$TomorrowTasksInCategory {
  @override
  List<Task> build(int categoryId) {
    final tasks = ref.watch(tasksNotifierProvider).valueOrNull;

    if (tasks == null) {
      return [];
    }
    final notDoneTasks = tasks.where(
      (task) =>
          task.categoryId == categoryId && !task.isDone && task.dueDate != null,
    );
    final tomorrowTasks = <Task>[];
    for (final task in notDoneTasks) {
      final taskDueDate = task.dueDate!.millisToDay();
      if (taskDueDate.isTomorrow) {
        tomorrowTasks.add(task);
      }
    }
    return tomorrowTasks;
  }
}

@riverpod
class FutureTasksInCategory extends _$FutureTasksInCategory {
  @override
  List<Task> build(int categoryId) {
    final tasks = ref.watch(tasksNotifierProvider).valueOrNull;

    if (tasks == null) {
      return [];
    }
    final notDoneTasks = tasks.where(
      (task) =>
          task.categoryId == categoryId && !task.isDone && task.dueDate != null,
    );
    final futureTasks = <Task>[];
    for (final task in notDoneTasks) {
      final taskDueDate = task.dueDate!.millisToDay();
      if (taskDueDate.isAfterTomorrow) {
        futureTasks.add(task);
      }
    }
    futureTasks.sort((a, b) => a.dueDate!.compareTo(b.dueDate!));
    return futureTasks;
  }
}

@riverpod
class TodayCompletedTasksInCategory extends _$TodayCompletedTasksInCategory {
  @override
  List<Task> build(int categoryId) {
    final tasks = ref.watch(tasksNotifierProvider).valueOrNull;

    if (tasks == null) {
      return [];
    }
    final todayTasks = tasks.where(
      (task) =>
          task.categoryId == categoryId && task.isDone && task.doneTime != null,
    );
    final todayCompletedTasks = <Task>[];
    for (final task in todayTasks) {
      final taskDoneDate = task.doneTime!.millisToDay();
      if (taskDoneDate.isToday) {
        todayCompletedTasks.add(task);
      }
    }
    todayCompletedTasks.sort((b, a) => a.doneTime!.compareTo(b.doneTime!));
    return todayCompletedTasks;
  }
}

@riverpod
class YesterdayCompletedTasksInCategory
    extends _$YesterdayCompletedTasksInCategory {
  @override
  List<Task> build(int categoryId) {
    final tasks = ref.watch(tasksNotifierProvider).valueOrNull;

    if (tasks == null) {
      return [];
    }
    final yesterdayTasks = tasks.where(
      (task) =>
          task.categoryId == categoryId && task.isDone && task.doneTime != null,
    );
    final yesterdayCompletedTasks = <Task>[];
    for (final task in yesterdayTasks) {
      final taskDoneDate = task.doneTime!.millisToDay();
      if (taskDoneDate.isYesterday) {
        yesterdayCompletedTasks.add(task);
      }
    }
    yesterdayCompletedTasks.sort((b, a) => a.doneTime!.compareTo(b.doneTime!));
    return yesterdayCompletedTasks;
  }
}

@riverpod
class PastCompletedTasksInCategory extends _$PastCompletedTasksInCategory {
  @override
  List<Task> build(int categoryId) {
    final tasks = ref.watch(tasksNotifierProvider).valueOrNull;

    if (tasks == null) {
      return [];
    }

    final doneTasks =
        tasks.where((task) => task.categoryId == categoryId && task.isDone);
    final pastCompletedTasks = <Task>[];
    final completedTasksWithoutDoneTime = <Task>[];
    for (final task in doneTasks) {
      if (task.doneTime != null) {
        final taskDoneDate = task.doneTime!.millisToDay();
        if (taskDoneDate.isBeforeYesterday) {
          pastCompletedTasks.add(task);
        }
      } else {
        completedTasksWithoutDoneTime.add(task);
      }
    }
    pastCompletedTasks.sort((b, a) => a.doneTime!.compareTo(b.doneTime!));
    return [...pastCompletedTasks, ...completedTasksWithoutDoneTime];
  }
}

@riverpod
int numberOfAllActiveTasks(Ref ref) {
  final tasks = ref.watch(tasksNotifierProvider).valueOrNull;

  if (tasks == null) {
    return 0;
  }
  return tasks.where((element) => !element.isDone).length;
}

@riverpod
List<Task> uncategorizedTasks(Ref ref) {
  final tasks = ref.watch(tasksNotifierProvider).valueOrNull;

  if (tasks == null) {
    return [];
  }
  return tasks.where((task) => task.categoryId == -1).toList();
}

@riverpod
int numberOfActiveTasksInCategory(Ref ref, int? categoryId) {
  if (categoryId == null) {
    return 0;
  }
  final tasks = ref.watch(tasksNotifierProvider).valueOrNull;

  if (tasks == null) {
    return 0;
  }

  return tasks
      .where((task) => task.categoryId == categoryId && !task.isDone)
      .length;
}

@riverpod
double completionProgress(Ref ref, int categoryId) {
  final tasks = ref.watch(tasksNotifierProvider);
  final allTasksInCategory =
      tasks.valueOrNull?.where((task) => task.categoryId == categoryId);
  final completedTasksInCategory =
      allTasksInCategory?.where((task) => task.isDone);
  if (allTasksInCategory != null && allTasksInCategory.isNotEmpty) {
    return (completedTasksInCategory?.length ?? 0) / allTasksInCategory.length;
  }
  return 0;
}

@riverpod
Color appBackgroundColor(Ref ref) {
  final currentCategory = ref.watch(categoryNotifierProvider);
  final currentCategoryInList = ref
      .watch(categoriesNotifierProvider)
      .valueOrNull
      ?.firstWhereOrNull((element) => element.id == currentCategory?.id);
  return currentCategoryInList?.color ?? Colors.deepPurple;
}
