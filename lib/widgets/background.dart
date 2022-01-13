import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  Widget child;

  Background({required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          ///Load Network Image as Background Full Screen
          // Container(
          //   constraints: BoxConstraints.expand(),
          //   decoration: BoxDecoration(
          //       image: DecorationImage(
          //           image: NetworkImage(
          //               "https://flutter-examples.com/wp-content/uploads/2020/02/dice.jpg"),
          //           fit: BoxFit.cover)),
          // ),
          ///Load Network Image as Background Full Screen using FittedBox
          // FittedBox(
          //     fit: BoxFit.fill,
          //     child: Image.asset('assets/images/background_image.jpg')),
          ///Load Local Image as Background Full Screen Using width & height Properties
          Image(
            image: AssetImage('assets/images/background_image.jpg'),
            alignment: Alignment.center,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          child
        ],
      ),
    );
  }
}
