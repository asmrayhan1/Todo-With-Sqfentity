import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_sqfentity/database/local/database_create.dart';
import 'package:todo_sqfentity/feature/todo/model/category_model.dart';
import 'package:todo_sqfentity/feature/todo/view_model/categories_view_model/category_view_generics.dart';

final categoryProvider = StateNotifierProvider<CategoryController, CategoryGenerics> ((ref) => CategoryController());

class CategoryController extends StateNotifier<CategoryGenerics> {
  CategoryController() : super(CategoryGenerics());

  categoryInitialize() async {
    final dataFetch = await Category().select().orderBy('id').toList();
    dataFetch.forEach((e){
      print(e.toMap());
    });
    List<CategoryModel> currentTodos = dataFetch.map((it) => CategoryModel.fromMap(it.toMap())).toList();
    state = state.update(currentCategory: currentTodos);
  }

  addCategory({required String title}) async {
    await Category(name: title).save().then((t){
      print("Title: ${title} - ${t}");
    });

    categoryInitialize();
  }

  deleteCategory({required int categoryId}) async {
    await Todo().select().categoryId.equals(categoryId).delete();
    await Category().select().id.equals(categoryId).delete();
    categoryInitialize();
  }
}