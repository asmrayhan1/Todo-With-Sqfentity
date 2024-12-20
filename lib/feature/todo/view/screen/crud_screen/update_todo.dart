import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../view_model/todos_view_model/todo_view_model.dart';

class UpdateTodo extends ConsumerStatefulWidget {
  final int? id;
  const UpdateTodo({super.key, required this.id});

  @override
  ConsumerState<UpdateTodo> createState() => _UpdateTodoState();
}

class _UpdateTodoState extends ConsumerState<UpdateTodo> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  void msgShow(bool ok){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(ok? 'Post edited successfully!' : 'Invalid Input'),
        duration: Duration(seconds: 4),
        // Duration the snackbar is shown
        backgroundColor: Colors.green, // Background color of the SnackBar
        //behavior: SnackBarBehavior.floating,
        //margin: EdgeInsets.only(bottom: 100),
      ),
    );
  }

  _buildText() async{
    await ref.read(homeProvider.notifier).dataFetchById(id: widget.id);
    _descriptionController.text = await ref.watch(homeProvider).readTodo[0].description;
    _titleController.text = await ref.watch(homeProvider).readTodo[0].title;
  }

  @override
  void initState() {
    // TODO: implement initState
    _buildText();
    super.initState();
  }

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
      body: Column(
        children: [
          SizedBox(height: 50),
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
                  await ref.read(homeProvider.notifier).updateTodo(
                    id: widget.id,
                    title: _titleController.text.trim(),
                    description: _descriptionController.text.trim(),
                  );
                  Navigator.of(context).pop();
                  msgShow(true);
                }
              },
              child: Text("Update", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w400))
          ),
        ],
      ),
    );
  }
}
