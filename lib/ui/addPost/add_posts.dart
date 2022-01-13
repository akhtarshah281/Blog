import 'dart:io';

import 'package:firebase_practice/ui/addPost/add_post_vm.dart';
import 'package:firebase_practice/utils/screen_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddPosts extends StatefulWidget {
  static const String routeName = 'addPost';

  @override
  _AddPostsState createState() => _AddPostsState();
}

class _AddPostsState extends State<AddPosts> {
  XFile? file;
  File? _imageFile;
  String? imageUrl;

  @override
  Widget build(BuildContext context) {
    ImageProvider? provider;
    if (_imageFile != null) {
      provider = FileImage(_imageFile!);
    }

    return Consumer<AddPostVM>(builder: (context, vm, child) {
      return SafeArea(
          top: true,
          child: Scaffold(
            appBar: AppBar(
              title: Center(child: Text('Add Posts')),
            ),
            body: Container(
              width: getScreenWidth(context),
              height: getScreenHeight(context),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          provider != null
                              ? Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(20)),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.file(_imageFile!))
                              : Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(20)),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.asset(
                                    'assets/images/apple.png',
                                    fit: BoxFit.contain,
                                  )),
                          Positioned(
                            right: 15,
                            bottom: 15,
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
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Title: ',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: vm.titleController,
                        maxLines: 1,
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Description:',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: vm.descController,
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        //Normal textInputField will be displayed
                        maxLines: 5,
                        // when user presses enter it will adapt to it
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
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
                              onPressed: vm.isLoading
                                  ? null
                                  : () {
                                      vm.addPost(
                                          context: context, file: _imageFile!);
                                    },
                              child: vm.isLoading
                                  ? SizedBox(
                                      width: 16,
                                      height: 16,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.white),
                                      ),
                                    )
                                  : Text(
                                      'Add Post',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ));
    });
  }
}
