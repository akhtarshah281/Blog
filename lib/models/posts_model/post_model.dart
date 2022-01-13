import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_practice/data/local_db/entities/posts_entity.dart';
import 'package:flutter/material.dart';

class PostsModel {
  final String id;
  final String title;
  final String desc;
  final String imageUrl;

  PostsModel({
    required this.id,
    required this.title,
    required this.desc,
    required this.imageUrl,

  });
}
