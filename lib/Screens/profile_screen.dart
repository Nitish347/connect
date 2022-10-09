import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../providers/user_provider.dart';
import '../utils/utils.dart';
import '../widgets/follow_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // var userData = {};
  // String uid = '';
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getUid();
  //   print(uid);
  //   // getData();
  // }
  //
  // //
  // getUid() async {
  //   String uidd = await FirebaseAuth.instance.currentUser!.uid;
  //   print(uidd);
  //   setState(() {
  //     uid = uidd;
  //   });
  // }
  //
  // getData() async {
  //   try {
  //     print(uid);
  //     var snap =
  //         await FirebaseFirestore.instance.collection('users').doc(uid)!.get();
  //     userData = snap.data()!;
  //     setState(() {});
  //   } catch (e) {
  //     showSnackbar(e.toString(), context);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final UserData user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Profile"),
        centerTitle: false,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(user.photoUrl),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildStatColumn(20, 'posts'),
                              SizedBox(
                                width: 10,
                              ),
                              buildStatColumn(105, 'followers'),
                              SizedBox(
                                width: 10,
                              ),
                              buildStatColumn(20, 'followings'),
                            ],
                          ),
                          FollowButton(
                            textColor: Colors.black,
                            text: 'Edit Profile',
                            borderColor: Colors.grey,
                            backgroundColor: Colors.white,
                            function: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    user.username,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 1),
                  child: Text(
                    user.bio,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  Column buildStatColumn(int num, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          num.toString(),
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: TextStyle(
              color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
