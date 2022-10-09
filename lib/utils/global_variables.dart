import 'package:flutter/material.dart';
import 'package:untitled6/Screens/feed_screen.dart';

import '../Screens/add_post_screen.dart';
import '../Screens/search_screen.dart';

const webScreenSize = 600;
const homeScreenItems = [
  FeedScreen(),
  SearchSCreen(),
  AddPostScreen(),
  Text(
    "home",
    style: TextStyle(color: Colors.blueAccent),
  ),
  Text(
    "home",
    style: TextStyle(color: Colors.blueAccent),
  ),
];
