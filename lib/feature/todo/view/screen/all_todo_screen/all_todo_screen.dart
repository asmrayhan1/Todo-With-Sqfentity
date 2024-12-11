import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_sqfentity/feature/todo/view_model/categories_view_model/category_view_model.dart';

import '../../../view_model/todos_view_model/todo_view_model.dart';
import '../crud_screen/read_todo.dart';

class AllTodoScreen extends ConsumerStatefulWidget {
  const AllTodoScreen({super.key});

  @override
  ConsumerState<AllTodoScreen> createState() => _AllTodoScreenState();
}

class _AllTodoScreenState extends ConsumerState<AllTodoScreen> {
  @override
  void initState() {
    // TODO: implement initState
    ref.read(homeProvider.notifier).todoInitialize();
    super.initState();
  }

  void _msgShow(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Todo successfully Deleted!'),
        duration: Duration(seconds: 4),
        // Duration the snackbar is shown
        backgroundColor: Colors.green, // Background color of the SnackBar
        //behavior: SnackBarBehavior.floating,
        //margin: EdgeInsets.only(bottom: 100),
      ),
    );
  }

  // Function to show the dialog
  void _showDialog(int id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('   Warning', style: TextStyle(fontWeight: FontWeight.w400, color: Colors.redAccent),),
          content: Container(
            width: 200,  // Custom width
            height: 150, // Custom height
            padding: EdgeInsets.all(15.0), // Padding inside the dialog
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Are you sure for delete it. If you delete it, you will lost your data',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () async{
                await ref.read(homeProvider.notifier).deleteTodo(id: id);
                Navigator.of(context).pop();
                _msgShow();
              },
              child: Text('Delete'),
            ),
            SizedBox(width: 5),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final home = ref.watch(homeProvider);
    home.myTodo.forEach((e){
      //print(e.toMap());
    });
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      child: ListView.builder(
        itemCount: home.myTodo.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Card(
                child: ListTile(
                  //tileColor: Colors.lightBlueAccent,
                  title: Text(maxLines: 1, "${home.myTodo[index].title}", style: TextStyle(fontSize: 22)),
                  subtitle: Text(maxLines: 1, "${home.myTodo[index].description}", style: TextStyle(fontSize: 18, overflow: TextOverflow.ellipsis)),
                  trailing: GestureDetector(
                      onTap: (){
                        print("CategoryId = ${home.myTodo[index].categoryId}");
                        _showDialog(home.myTodo[index].id!);
                        print("Delete Icon is Working");
                      },
                      child: Icon(Icons.delete)
                  ),
                  onTap: () {
                    print("All Todo Id = ${ref.watch(homeProvider).myTodo[index].id}");
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ReadTodo(title: home.myTodo[index].title, description: home.myTodo[index].description, index: index, id: home.myTodo[index].id)),);
                    print("Tapped on ${index}");
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
