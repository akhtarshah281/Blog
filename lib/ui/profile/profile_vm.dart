import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_practice/base/base_vm.dart';
import 'package:firebase_practice/data/repositories/profile/profile_repo.dart';
import 'package:firebase_practice/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ProfileVm extends BaseVM {
  ProfileRepo repo = GetIt.I.get<ProfileRepo>();
  BuildContext _context;
  DocumentSnapshot? snapshot;

  bool _isLoading = true;

  bool get isLoading => _isLoading;

  set isLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  ProfileVm(this._context) {
    getUserData(context: _context);
  }
  Future<void> getUserData({required BuildContext context}) async {
    isLoading = true;
    dynamic response = await repo.getUserData();
    if (response is DocumentSnapshot) {
      snapshot = response;
      isLoading = false;
    } else {
      Utils.showSnackbar(context: context, mesg: 'could not get response');
    }
  }
}
