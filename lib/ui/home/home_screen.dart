import 'package:firebase_practice/ui/addPost/add_posts.dart';
import 'package:firebase_practice/ui/home/home_vm.dart';
import 'package:firebase_practice/utils/functions.dart';
import 'package:firebase_practice/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeVM>(builder: (context, vm, child) {
      return Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          actions: <Widget>[
            FlatButton(
              textColor: Colors.white,
              onPressed: () {
                Utils.nextScreen(
                    context: context, screenRouteName: AddPosts.routeName);
              },
              child: Icon(Icons.add),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            ),
          ],
          title: Center(child: const Text("Welcome")),
        ),
        body: ListView.builder(
            itemCount: vm.dataList.length,

            itemBuilder: (BuildContext context, int index) {
              return ListTile(

                  leading: CircleAvatar(backgroundImage: NetworkImage(vm.dataList[index].imageUrl),),
                  title: Text(vm.dataList[index].title));
            }),

      );
    });
  }
}
