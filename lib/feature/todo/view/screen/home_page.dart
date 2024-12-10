import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_sqfentity/feature/todo/view/screen/add_todo.dart';
import 'package:todo_sqfentity/feature/todo/view/screen/read_todo.dart';
import 'package:todo_sqfentity/feature/todo/view_model/home_view_model.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Todo With Sqfentity", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 28)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        child: ListView.builder(
          itemCount: home.myTodo.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: ListTile(
                    //tileColor: Colors.lightBlueAccent,
                    title: Text(maxLines: 1, "${home.myTodo[index].title}", style: TextStyle(fontSize: 22)),
                    subtitle: Text(maxLines: 1, "${home.myTodo[index].description}", style: TextStyle(fontSize: 18, overflow: TextOverflow.ellipsis)),
                    trailing: GestureDetector(
                      onTap: (){
                        _showDialog(home.myTodo[index].id!);
                        print("Delete Icon is Working");
                      },
                      child: Icon(Icons.delete)
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ReadTodo(title: home.myTodo[index].title, description: home.myTodo[index].description, index: index)),);
                      print("Tapped on ${index}");
                    },
                  ),
                ),
                SizedBox(height: 5)
                //Divider(color: Colors.white, thickness: 1,)
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the "Add New Item" screen
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddTodo()),);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
