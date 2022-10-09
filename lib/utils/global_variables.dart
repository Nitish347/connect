import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/Screens/feed_screen.dart';
import 'package:untitled6/Screens/profile_screen.dart';

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
  ProfileScreen()
];
