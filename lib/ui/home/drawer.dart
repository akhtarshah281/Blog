import 'package:firebase_practice/utils/functions.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: SizedBox(
        width: Utils(context).width * 0.75,
        height: Utils(context).height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DrawerHeaderItems(context),
              DrawerItems(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget DrawerHeaderItems(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.amber,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: CircleAvatar(
                radius: 63.0,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  child: Stack(
                    children: const [
                      CircleAvatar(
                        radius: 60,
                        child: ClipOval(
                          child: Icon(
                            Icons.person,
                            size: 60,
                          ),
                        ),
                      ),
                      // Align(
                      //   alignment: Alignment.bottomRight,
                      //   child: GestureDetector(
                      //     onTap: (){
                      //       // Pick image from Gallary / Camera:
                      //
                      //     },
                      //     child: CircleAvatar(
                      //       backgroundColor: Colors.white,
                      //       radius: 20.0,
                      //       child: Icon(
                      //         Icons.camera_alt,
                      //         size: 20.0,
                      //         color: Color(0xFF404040),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  radius: 60.0,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'firstName',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Text('akhtarshah281@gmail.com'),
          ],
        ),
      ),
    );
  }

  Widget DrawerItems(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  child: TextButton.icon(
                      onPressed: () {
                        print('profile called');
                      },
                      icon: Icon(Icons.person),
                      label: Text('Profile')),
                ),
                Container(
                  width: double.infinity,
                  child: TextButton.icon(
                      onPressed: () {
                        print('log out called');
                      },
                      icon: Icon(Icons.logout),
                      label: Text('Log Out')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
