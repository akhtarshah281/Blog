import 'package:firebase_practice/ui/profile/profile_vm.dart';
import 'package:firebase_practice/ui/update/update_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = 'profile';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? imageLink;

  _ProfileScreenState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Consumer<ProfileVm>(builder: (context, vm, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: vm.snapshot != null
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50.0, horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(children: [
                      Align(
                          alignment: Alignment.topCenter,
                          child: SizedBox(
                            child: CircleAvatar(
                              radius: 63.0,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                child: Stack(
                                  children: [
                                    vm.snapshot!.get('imageUrl') == null
                                            ? const CircleAvatar(
                                                radius: 60,
                                                child: Icon(
                                                  Icons.person,
                                                  size: 60,
                                                ),
                                              )
                                            : CircleAvatar(
                                                radius: 60,
                                                backgroundImage: NetworkImage(
                                                  vm.snapshot!.get('imageUrl'),
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
                                radius: 63.0,
                              ),
                            ),
                          )),
                    ]),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text('First Name: '),
                        ),
                        Expanded(
                          child: Text(vm.snapshot!.get('firstName')),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text('Last Name: '),
                        ),
                        Expanded(
                          child: Text(vm.snapshot!.get('lastName')),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                        width: screenWidth / 2,
                        height: 50,
                        child: TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.lightBlue),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  // side: BorderSide(color: Colors.red)
                                ))),
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, UpdateProfile.routeName,
                                  arguments: vm.snapshot);
                            },
                            child: Text(
                              'Edit Profile',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ))),
                  ],
                ))
            : Center(
                child: SizedBox(
                  width: 16,
                  height: 16,
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 4,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                    ),
                  ),
                ),
              ),
      );
    });
  }
}
