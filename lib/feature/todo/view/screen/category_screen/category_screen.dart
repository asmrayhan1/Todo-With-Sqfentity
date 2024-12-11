import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_sqfentity/feature/todo/view/screen/category_screen/category_view_screen.dart';
import 'package:todo_sqfentity/feature/todo/view_model/categories_view_model/category_view_model.dart';

class CategoryScreen extends ConsumerStatefulWidget {
  const CategoryScreen({super.key});

  @override
  ConsumerState<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends ConsumerState<CategoryScreen> {
  TextEditingController _titleController = TextEditingController();

  clearController(){
    _titleController.text = "";
  }

  void msgShow(bool ok){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(ok? 'Category successfully added!' : 'Invalid Input'),
        duration: Duration(seconds: 4),
        // Duration the snackbar is shown
        backgroundColor: Colors.green, // Background color of the SnackBar
        //behavior: SnackBarBehavior.floating,
        //margin: EdgeInsets.only(bottom: 100),
      ),
    );
  }

  // Function to show the dialog
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Category Name:', style: TextStyle(fontWeight: FontWeight.w400, color: Colors.blueAccent),),
          content: Container(
            width: 200,  // Custom width
            height: 150, // Custom height
            padding: EdgeInsets.all(15.0), // Padding inside the dialog
            child: TextField(
              controller: _titleController,
              maxLines: 1,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
                onPressed: () async {
                  if (_titleController.text.trim().length == 0) msgShow(false);
                  else {
                    await ref.read(categoryProvider.notifier).addCategory(
                      title: _titleController.text.trim(),
                    );
                    print("Input: ${_titleController.text.trim()}");
                    Navigator.of(context).pop();
                    msgShow(true);
                    clearController();
                  }
                },
                child: Text("Insert")
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

  void _msgShow(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Category successfully Deleted!'),
        duration: Duration(seconds: 4),
        // Duration the snackbar is shown
        backgroundColor: Colors.green, // Background color of the SnackBar
        //behavior: SnackBarBehavior.floating,
        //margin: EdgeInsets.only(bottom: 100),
      ),
    );
  }

  // Function to show the dialog
  void _showDialog12(int id) {
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
                  'Are you sure for delete it. If you delete it, you will lost your all data inside it',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () async{
                await ref.read(categoryProvider.notifier).deleteCategory(categoryId: id);
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
  void initState() {
    // TODO: implement initState
    ref.read(categoryProvider.notifier).categoryInitialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final home = ref.watch(categoryProvider);
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        children: [
           Card(
             child: ListTile(
               onTap: (){
                 _showDialog();
                 print("Add Category Working");
               },
               leading: Icon(Icons.add_circle_outline_sharp),
               title: Text("Create Category", style: TextStyle(color: Colors.blueAccent, fontSize: 20),),
             ),
           ),
          Expanded(
            child: ListView.builder(
              itemCount: home.myCategory.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Card(
                      child: ListTile(
                        //tileColor: Colors.lightBlueAccent,
                        title: Text(maxLines: 1, "${home.myCategory[index].title}", style: TextStyle(fontSize: 22)),
                        //subtitle: Text(maxLines: 1, "${home.myTodo[index].description}", style: TextStyle(fontSize: 18, overflow: TextOverflow.ellipsis)),
                        trailing: GestureDetector(
                            onTap: (){
                              _showDialog12(home.myCategory[index].id!);
                              print("Delete Icon is Working");
                            },
                            child: Icon(Icons.delete)
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryViewScreen(categoryName: home.myCategory[index].title, categoryId: home.myCategory[index].id,)));
                          print("Tapped on ${index}");
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
