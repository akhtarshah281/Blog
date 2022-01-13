import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_practice/base/base_vm.dart';
import 'package:firebase_practice/data/local_db/entities/posts_entity.dart';
import 'package:firebase_practice/data/repositories/home/home_repo.dart';
import 'package:firebase_practice/models/posts_model/post_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class HomeVM extends BaseVM {
  HomeRepo repo = GetIt.I.get<HomeRepo>();
  final BuildContext _context;
  List<PostsModel> dataList = [];
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  set isLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  // Constructor
  HomeVM(this._context) {
    internetCheck(context: _context);
  }

  Future<void> internetCheck({required BuildContext context}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // connected and get data from Firebase
      getPosts(context: context);
    } else {
      // not connected and get data from floor database
      getCachedPosts();
    }
  }

  Future<dynamic> getPosts({required BuildContext context}) async {
    isLoading = true;
    dynamic snapshot = await repo.getPosts();
    if (snapshot is QuerySnapshot) {
      (snapshot as QuerySnapshot).docs.forEach((documentSnapshot) {

        dataList.add(
          PostsModel(
              id: documentSnapshot.id,
              title: documentSnapshot.get('title'),
              desc: documentSnapshot.get('desc'),
              imageUrl: documentSnapshot.get('imageUrl'),
          ),
        );
        // PostsModel model = GetIt.instance.get<PostsModel>();
        //insert all data in floor database
        insertCachedPosts(
            id: documentSnapshot.id, title: documentSnapshot.get('title'), postDesc: documentSnapshot.get('desc'), imageUrl: documentSnapshot.get('imageUrl'));
      });
      isLoading = false;

    } else {
      isLoading = true;
    }
  }

  Future<void> insertCachedPosts({required String id,
    required String title,
    required String postDesc,
    required String imageUrl}) async {
    (await repo.database)
        .postsDao
        .insertPost(Posts(id, title, postDesc, imageUrl));
    notifyListeners();
  }

  Future<void> getCachedPosts() async {
    dataList.clear();
    List<Posts> list = await (await repo.database).postsDao.findAllPosts();
    notifyListeners();
  }
}
