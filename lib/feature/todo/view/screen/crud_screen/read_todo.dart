import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_sqfentity/feature/todo/view/screen/crud_screen/update_todo.dart';
import 'package:todo_sqfentity/feature/todo/view_model/todos_view_model/todo_view_model.dart';

class ReadTodo extends ConsumerStatefulWidget {
  final String? title;
  final String? description;
  final int? index;
  final int? id;
  ReadTodo({super.key, required this.title, required this.description, required this.index, required this.id});

  @override
  ConsumerState<ReadTodo> createState() => _ReadTodoState();
}

class _ReadTodoState extends ConsumerState<ReadTodo> {
  @override
  void initState() {
    // TODO: implement initState
    print("Read Todo Id = ${widget.id}");
    ref.read(homeProvider.notifier).dataFetchById(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final home = ref.watch(homeProvider).readTodo;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back_ios_new, color: Colors.white)
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text((home.isNotEmpty? " ${home[0].title}" : "No Data Found"), style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),),
            SizedBox(height: 12),
            Expanded(child: SingleChildScrollView(child: Text((home.isNotEmpty? " ${home[0].description}" : "No Data Found"), style: TextStyle(fontSize: 20),))),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // Navigate to the "Add New Item" screen
          Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateTodo(id: widget.id)),);
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}
