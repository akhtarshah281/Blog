import 'dart:io';

import 'package:firebase_practice/ui/update/update_vm.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UpdateProfile extends StatefulWidget {
  static const String routeName = 'update';

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  // late UpdateVM updateVM;
  XFile? file;
  File? _imageFile;
  String? imageUrl;

  // bool cameraIconClicked = false;

  @override
  void initState() {
    super.initState();
  }

  // Future<bool> _onBackPressed() {
  //   return showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text('Are you sure?'),
  //           content: Text('You are going to exit the application!!'),
  //           actions: <Widget>[
  //             FlatButton(
  //               child: Text('NO'),
  //               onPressed: () {
  //                 Navigator.of(context).pop(false);
  //               },
  //             ),
  //             FlatButton(
  //               child: Text('YES'),
  //               onPressed: () {
  //                 Navigator.of(context).pop(true);
  //               },
  //             ),
  //           ],
  //         );
  //       });
  // }
  // Future<bool> _onBackPressed() async {
  //   bool goBack = false;
  //   await showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         content: Text('Exit From The App'),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               goBack = false;
  //               Navigator.pop(context);
  //             },
  //             child: Text('No'),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               goBack = true;
  //               Navigator.pop(context);
  //             },
  //             child: Text('Yes'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  //   return goBack;
  // }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    ImageProvider? provider;
    if (_imageFile != null) {
      provider = FileImage(_imageFile!);
    }

    return Consumer<UpdateVM>(builder: (context, vm, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 160.0, horizontal: 50),
              child: Container(
                  height: screenHeight / 2,
                  width: screenWidth,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(32)),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Stack(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 100,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: vm.firstNameController,
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide:
                                                BorderSide(color: Colors.grey),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: TextField(
                                        controller: vm.lastNameController,
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide:
                                                BorderSide(color: Colors.grey),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: screenWidth,
                                height: 50,
                                child: TextButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.lightBlue),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          // side: BorderSide(color: Colors.red)
                                        ))),
                                    onPressed: vm.isLoading
                                        ? null
                                        : () {
                                            vm.updateDataFun(
                                                context: context,
                                                file: _imageFile!);
                                          },
                                    child: vm.isLoading
                                        ? const SizedBox(
                                            width: 16,
                                            height: 16,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      Colors.white),
                                            ),
                                          )
                                        : const Text(
                                            'Update',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          )),
                              ))
                        ],
                      ))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 80),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 150,
                  height: 150,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: provider != null
                            ? CircleAvatar(
                                radius: 120,
                                backgroundImage: provider,
                              )
                            : CircleAvatar(
                                radius: 120,
                                backgroundImage:
                                    NetworkImage(vm.imgUrl.toString()),
                              ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () async {
                            XFile? file = await ImagePicker()
                                .pickImage(source: ImageSource.camera);
                            setState(() {
                              if (file != null) {
                                _imageFile = File(file.path);
                                // print(_imageFile!.path);
                              } else {
                                print('no image Selected');
                                return;
                              }
                            });
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22),
                              ),
                              child: Icon(Icons.camera_alt),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
