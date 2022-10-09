import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchSCreen extends StatefulWidget {
  const SearchSCreen({Key? key}) : super(key: key);

  @override
  State<SearchSCreen> createState() => _SearchSCreenState();
}

final TextEditingController searchController = TextEditingController();

class _SearchSCreenState extends State<SearchSCreen> {
  bool isShowUser = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: TextFormField(
          controller: searchController,
          decoration: InputDecoration(
              labelText: 'Search for a user',
              labelStyle: TextStyle(color: Colors.white)),
          onFieldSubmitted: (String _) {
            print(_);
            print(searchController.text);
            setState(() {
              isShowUser = true;
            });
          },
        ),
      ),
      body: isShowUser
          ? FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('users')
                  .where(
                    'username',
                    isGreaterThanOrEqualTo: searchController.text,
                  )
                  .get(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Builder(builder: (context) {
                    return ListView.builder(
                        itemCount: (snapshot.data! as dynamic).docs.length,
                        itemBuilder: (
                          context,
                          index,
                        ) {
                          return ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  (snapshot.data! as dynamic).docs[index]
                                      ['photoUrl'],
                                ),
                              ),
                              title: Text(
                                (snapshot.data! as dynamic).docs[index]
                                    ['username'],
                                style: TextStyle(color: Colors.black),
                              ));
                        });
                  });
                }
              },
            )
          : Text(
              "Posts",
              style: TextStyle(color: Colors.black),
            ),
    );
  }
}
