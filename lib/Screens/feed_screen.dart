import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/post_card.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          centerTitle: false,
          title: Text("Connect"),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.message_outlined))
          ],
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('posts').snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) => Container(
                      child: PostCard(
                        snap: snapshot.data!.docs[index].data(),
                      ),
                    ));
          },
        ));
  }
}
