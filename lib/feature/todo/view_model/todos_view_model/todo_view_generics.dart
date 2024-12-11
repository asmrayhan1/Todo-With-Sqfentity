import '../../model/todo_model.dart';

class TodoGenerics{
  List<TodoModel> myTodo;
  List<TodoModel> tmpTodo;
  List<TodoModel> readTodo;

  TodoGenerics({this.myTodo = const [], this.tmpTodo = const [], this.readTodo = const []});

  TodoGenerics update({List<TodoModel>? todos, List<TodoModel>? tmp, List<TodoModel>? tmp2}){
    return TodoGenerics(
      myTodo: todos?? this.myTodo,
      tmpTodo: tmp?? this.tmpTodo,
      readTodo: tmp2?? this.readTodo
    );
  }
}