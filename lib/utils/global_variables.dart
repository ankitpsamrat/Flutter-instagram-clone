import 'package:flutter/material.dart';
import 'package:instagram/screens/add_post_screen.dart';
import 'package:instagram/screens/feed_screen.dart';
import 'package:instagram/screens/search_screen.dart';

const webScreenSize = 600;

const homeScreenItems = [
  FeedScreen(),
  SearchScreen(),
  AddPostScreen(),
  Text('noti'),
  Text('pro'),
];


// List<Widget> homeScreenItems = [
//   const FeedScreen(),
//   const SearchScreen(),
//   const AddPostScreen(),
//   const Text('notifications'),
//   ProfileScreen(
//     uid: FirebaseAuth.instance.currentUser!.uid,
//   ),
// ];
