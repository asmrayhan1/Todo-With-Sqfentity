import '../../model/todo_model.dart';

class TodoGenerics{
  List<TodoModel> myTodo;

  TodoGenerics({this.myTodo = const []});

  TodoGenerics update({List<TodoModel>? todos}){
    return TodoGenerics(
      myTodo: todos?? this.myTodo
    );
  }
}