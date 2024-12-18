import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

class TaskItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  IntColumn get categoryId =>
      integer().nullable().references(Categories, #id)();
  IntColumn get createdAt => integer().nullable()();
  IntColumn get dueAt => integer().nullable()();
  IntColumn get doneAt => integer().nullable()();
}

class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get color => integer()();
  IntColumn get icon => integer()();
}

class TaskItemsOrder extends Table {
  IntColumn get taskId => integer().references(TaskItems, #id)();
  IntColumn get position => integer()();
}

class CategoriesOrder extends Table {
  IntColumn get categoryId => integer().references(Categories, #id)();
  IntColumn get position => integer()();
}

@DriftDatabase(tables: [TaskItems, Categories])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'todo_database');
  }
}
