import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_sqfentity/feature/todo/model/todo_model.dart';
import 'package:todo_sqfentity/feature/todo/view_model/todos_view_model/todo_view_generics.dart';

import '../../../../database/local/database_create.dart';

final homeProvider = StateNotifierProvider<HomeController, TodoGenerics> ((ref) => HomeController());

class HomeController extends StateNotifier<TodoGenerics>{
  HomeController() : super(TodoGenerics());

  todoInitialize() async{
    final dataFetch = await Todo().select().orderBy('id').toList();
    List<TodoModel> currentTodos = dataFetch.map((e) => TodoModel.fromMap(e.toMap())).toList();
    state = state.update(todos: currentTodos);
  }

  addTodo({required String title, required String description}) async{
    await Todo(title: title, description: description).save();
    todoInitialize();
  }

  deleteTodo({required int id}) async{
    await Todo().select().id.equals(id).delete();
    todoInitialize();
  }

  updateTodo({required int? id, String? title, String? description}) async{
    await Todo().select().id.equals(id).update(TodoModel(title: title!, description: description!).toMap());
    todoInitialize();
  }
}