import 'package:firebase_practice/ui/profile/profile_screen.dart';
import 'package:firebase_practice/utils/functions.dart';
import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  _NavigationDrawerWidgetState createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Color.fromRGBO(50, 75, 205, 1),
        child: ListView(
          padding: padding,
          children: <Widget>[
            const SizedBox(height: 16),
            buildHeader(),
            const SizedBox(height: 16),
            buildMenuItems(
                icon: Icons.person,
                text: 'Profile',
                onclicked: () {
                  Utils.nextScreen(context: context, screenRouteName: ProfileScreen.routeName);
                }),
            const SizedBox(height: 16),
            buildMenuItems(
                icon: Icons.logout,
                text: 'Log Out',
                onclicked: () {
                  // To Do:

                }),
            Divider(
              color: Colors.white70,
            )
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Container();
  }

  Widget buildMenuItems(
      {required String text,
      required IconData icon,
      required VoidCallback? onclicked}) {
    final Color color = Colors.white;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        text,
        style: TextStyle(color: color),
      ),
      onTap: onclicked,
    );
  }
}
