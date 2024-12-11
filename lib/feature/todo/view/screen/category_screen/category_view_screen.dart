import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_sqfentity/feature/todo/model/todo_model.dart';
import 'package:todo_sqfentity/feature/todo/view_model/todos_view_model/todo_view_model.dart';

import '../../../../../database/local/database_create.dart';
import '../crud_screen/add_todo.dart';
import '../crud_screen/read_todo.dart';

class CategoryViewScreen extends ConsumerStatefulWidget {
  final String categoryName;
  final int? categoryId;
  const CategoryViewScreen({super.key, required this.categoryName, required this.categoryId});
  @override
  ConsumerState<CategoryViewScreen> createState() => _CategoryViewScreenState();
}

class _CategoryViewScreenState extends ConsumerState<CategoryViewScreen> {

  @override
  void initState() {
    // TODO: implement initState
    ref.read(homeProvider.notifier).dataFetch(categoryId: widget.categoryId!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final home = ref.watch(homeProvider).tmpTodo;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back_ios_new, size: 23, color: Colors.white,)
        ),
        title: Text("       ${widget.categoryName}", style: TextStyle(fontSize: 25, color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        child: ListView.builder(
          itemCount: home.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Card(
                  child: ListTile(
                    //tileColor: Colors.lightBlueAccent,
                    title: Text(maxLines: 1, "${home[index].title}", style: TextStyle(fontSize: 22)),
                    subtitle: Text(maxLines: 1, "${home[index].description}", style: TextStyle(fontSize: 18, overflow: TextOverflow.ellipsis)),
                    trailing: GestureDetector(
                        onTap: (){
                          //_showDialog(home.myTodo[index].id!);
                          print("Delete Icon is Working");
                        },
                        child: Icon(Icons.delete)
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ReadTodo(title: home[index].title, description: home[index].description, index: index, id: home[index].id,)));
                      print("Tapped on ${index}");
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the "Add New Item" screen
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddTodo(categoryId: widget.categoryId)),);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
