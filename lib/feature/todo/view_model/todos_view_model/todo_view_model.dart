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

  addTodo({required String title, required String description, required int categoryId}) async{
    final check = await Todo(title: title, description: description, categoryId: categoryId).save();

    final current = await Todo().select().categoryId.equals(categoryId).orderByDesc('id').toList();
    List<TodoModel> myList = current.map((e) => TodoModel.fromMap(e.toMap())).toList();
    state = state.update(tmp: myList);

    print("After adding, categoryId = ${check}");
    todoInitialize();


    // final current = await Todo().select().categoryId.equals(6).orderByDesc('id').toList();
    // List<TodoModel> currentTodos = current.map((e) => TodoModel.fromMap(e.toMap())).toList();
    // currentTodos.forEach((e){
    //   print(e.toMap());
    // });
    // final n = state.myTodo.length;
    // print(state.myTodo[n-1].toMap());

  }

  deleteTodo({required int id}) async{
    await Todo().select().id.equals(id).delete();
    todoInitialize();
  }

  updateTodo({required int? id, String? title, String? description}) async{
    await Todo(id: id, title: title, description: description).save();//await //Todo().select().id.equals(id).update(TodoModel(title: title!, description: description!).toMap());

    final current = await Todo().select().id.equals(id).orderByDesc('id').toList();
    List<TodoModel> myList = current.map((e) => TodoModel.fromMap(e.toMap())).toList();
    state = state.update(tmp2: myList);
    todoInitialize();
  }

  dataFetchById({required int? id}) async{
    final current = await Todo().select().id.equals(id).orderByDesc('id').toList();
    List<TodoModel> myList = current.map((e) => TodoModel.fromMap(e.toMap())).toList();
    state = state.update(tmp2: myList);
  }

  dataFetch({required int? categoryId}) async{
    final current = await Todo().select().categoryId.equals(categoryId).orderByDesc('id').toList();
    List<TodoModel> myList = current.map((e) => TodoModel.fromMap(e.toMap())).toList();
    state = state.update(tmp: myList);
  }
}