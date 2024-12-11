import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../view_model/todos_view_model/todo_view_model.dart';

class AddTodo extends ConsumerStatefulWidget {
  final int? categoryId;
  const AddTodo({super.key, this.categoryId});

  @override
  ConsumerState<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends ConsumerState<AddTodo> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  void msgShow(bool ok){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(ok? 'Post successfully added!' : 'Invalid Input'),
        duration: Duration(seconds: 4),
        // Duration the snackbar is shown
        backgroundColor: Colors.green, // Background color of the SnackBar
        //behavior: SnackBarBehavior.floating,
        //margin: EdgeInsets.only(bottom: 100),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100),
          Text("Title", style: TextStyle(color: Colors.redAccent, fontSize: 22)),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _titleController,
              minLines: 1,
              maxLines: 10,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          SizedBox(height: 90),
          Text("Description", style: TextStyle(color: Colors.redAccent, fontSize: 22),),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _descriptionController,
              minLines: 1,
              maxLines: 10,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          SizedBox(height: 70),
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                  if (states.contains(WidgetState.pressed)) {
                    return Colors.green; // Color when button is pressed
                  }
                  return Colors.blue; // Default color
                }),
              ),
              onPressed: () async {
                if (_titleController.text.trim().length == 0 || _descriptionController.text.trim().length == 0) msgShow(false);
                else {
                  await ref.read(homeProvider.notifier).addTodo(
                    title: _titleController.text.trim(),
                    description: _descriptionController.text.trim(),
                    categoryId: widget.categoryId?? 0
                  );
                  Navigator.of(context).pop();
                  msgShow(true);
                }
              },
              child: Text("Insert", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w400))
          ),
        ],
      ),
    );
  }
}
