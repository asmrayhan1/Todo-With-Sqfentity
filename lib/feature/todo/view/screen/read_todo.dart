import 'package:flutter/material.dart';
import 'package:todo_sqfentity/feature/todo/view/screen/update_todo.dart';

import 'add_todo.dart';

class ReadTodo extends StatelessWidget {
  final String? title;
  final String? description;
  final int? index;
  const ReadTodo({super.key, required this.title, required this.description, required this.index});

  @override
  Widget build(BuildContext context) {
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
            Text(" ${title}", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),),
            SizedBox(height: 12),
            Expanded(child: SingleChildScrollView(child: Text("${description}", style: TextStyle(fontSize: 20),))),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // Navigate to the "Add New Item" screen
          Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateTodo(index: index)),);
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}
