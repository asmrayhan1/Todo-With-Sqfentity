import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_sqfentity/feature/todo/view/screen/all_todo_screen/all_todo_screen.dart';
import 'package:todo_sqfentity/feature/todo/view/screen/category_screen/category_screen.dart';

import 'add_todo.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Todo With Sqfentity", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 28)),
        ),
        body: Column(
          children: [
            TabBar(
              indicatorColor: Colors.orange,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: <Widget>[
                Text("All", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 23, color: currentTabIndex == 0? Colors.orange : Colors.black,),),
                Text("Category", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 23, color: currentTabIndex == 1? Colors.orange: Colors.black),),
              ],

              onTap: (index){
                setState(() {
                  currentTabIndex = index;
                });
              },
            ),

            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: TabBarView(
                  children: <Widget>[
                    AllTodoScreen(),
                    CategoryScreen(),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigate to the "Add New Item" screen
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddTodo()),);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
