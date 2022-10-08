// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/models/user.dart';
import 'package:untitled6/providers/user_provider.dart';
import 'package:untitled6/utils/global_variables.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  // String username = '';
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getUserName();
  // }

  // getUserName() async {
  //   // print('deepukjbs');
  //   String cred = FirebaseAuth.instance.currentUser!.uid;
  //   DocumentSnapshot snap =
  //       await FirebaseFirestore.instance.collection('users').doc(cred).get();
  //   // print('deepu');
  //   // print(cred);
  //   print(snap.data());
  //   // print("nitish");
  //   setState(() {
  //     username = (snap.data() as Map<String, dynamic>)['username'];
  //   });
  // }
  int _page = 0;
  late PageController pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  void navigationTab(int page) {
    pageController.jumpToPage(page);
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    // UserData user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
        bottomNavigationBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _page == 0 ? Colors.blueAccent : Colors.white,
              ),
              label: "Home",
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: _page == 1 ? Colors.blueAccent : Colors.white,
                ),
                label: "Search",
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add,
                  color: _page == 2 ? Colors.blueAccent : Colors.white,
                ),
                label: "Add",
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: _page == 3 ? Colors.blueAccent : Colors.white,
                ),
                label: "Notifications",
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: _page == 4 ? Colors.blueAccent : Colors.white,
                ),
                label: "Account",
                backgroundColor: Colors.black),
          ],
          onTap: navigationTab,
        ),
        body: PageView(
          children: homeScreenItems,
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          // onPageChanged: onPageChanged,
        ));
  }
}
