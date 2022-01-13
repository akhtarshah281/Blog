import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_practice/base/base_vm.dart';
import 'package:firebase_practice/data/repositories/update/update_repo.dart';
import 'package:firebase_practice/ui/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class UpdateVM extends BaseVM {
  UpdateRepo repo = GetIt.I.get<UpdateRepo>();
  final DocumentSnapshot snapshot;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  String? imgUrl ;

  UpdateVM({required this.snapshot}) {
    firstNameController.text = snapshot.get('firstName');
    lastNameController.text = snapshot.get('lastName');
    imgUrl = snapshot.get("imageUrl");
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  // Future<dynamic> getImage({required BuildContext context}) async {
  //   isLoading = true;
  //   file = await ImagePicker().pickImage(
  //     source: ImageSource.camera,
  //     imageQuality: 20,
  //   );
  //   imageFile = File(file!.path);
  //   isLoading = false;
  // }

  // Future<void> uploadImage() async {
  //   if (file != null) {
  //     File imageFile = File(file!.path);
  //     Reference ref =
  //         FirebaseStorage.instance.ref('/user_profile_images/abc.jpg');
  //     await ref.putFile(imageFile);
  //     imageUrl = await ref.getDownloadURL();
  //     print('success');
  //   } else {
  //     print('failed');
  //   }
  // }

  Future<void> updateDataFun(
      {required BuildContext context, required File file}) async {
    String getfirstName = firstNameController.text.trim();
    String getlastName = lastNameController.text.trim();

    String? url = await uplaodImage(context: context, file: file);

    await updateData(
      context: context,
      firstName: getfirstName,
      lastName: getlastName,
      imageUrl: url,
    );
  }

  Future<void> updateData(
      {required BuildContext context,
      required String firstName,
      required String lastName,
      required String? imageUrl}) async {
    isLoading = true;
    await repo.updateData(
        firstName: firstName, lastName: lastName, imageUrl: imageUrl);
    Navigator.pushReplacementNamed(context, ProfileScreen.routeName);
    isLoading = false;
  }

  Future<dynamic> uplaodImage(
      {required BuildContext context, required File file}) async {
    isLoading = true;
    return await repo.uplaodImage(context: context, file: file);
  }
}
