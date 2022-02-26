import 'package:flutter/material.dart';
import 'package:memebytes/screens/add_post_screen.dart';
import 'package:memebytes/screens/feed_screen.dart';
import 'package:memebytes/screens/search_screen.dart';

const webScreenSize = 600;

const homeScreenItems = [
  FeedScreen(),
  SearchScreen(),
  AddPostScreen(),
  Text("notif"),
  Text("profile"),
];
