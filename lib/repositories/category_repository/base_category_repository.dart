import '../../models/models.dart';

abstract class BaseCategoryRepository {
  Future<Category> add({required Category category});

  Future<Category> update({required Category category});

  Future<Category> remove({required Category category});

  Future<List<Category>> reorder({
    required int oldIndex,
    required int newIndex,
  });

  List<Category> getCategories();
}
