import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostCard extends StatelessWidget {
  final snap;
  PostCard({required this.snap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16)
                .copyWith(right: 0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(snap['profIamge']),
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snap['username'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      )
                    ],
                  ),
                )),
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => Dialog(
                                  child: ListView(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                shrinkWrap: true,
                                children: ['Delete', 'post']
                                    .map((e) => InkWell(
                                          onTap: () {},
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 12, horizontal: 20),
                                            child: Text(e),
                                          ),
                                        ))
                                    .toList(),
                              )));
                    },
                    icon: Icon(
                      Icons.more_vert_sharp,
                      color: Colors.black,
                    )),
              ],
            ),
          ),
          //image section......................................
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            child: Image.network(
              snap['postUrl'],
              fit: BoxFit.cover,
            ),
          ),
          //Like Comment...................................................................
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.comment_outlined,
                    color: Colors.black,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.send,
                    color: Colors.black,
                  )),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.bookmark_border_outlined,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                ),
              )
            ],
          ),
          //Description..........................................................
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  " ${snap['likes'].length}",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 15),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 8),
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: snap['username'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "  ${snap['description']}",
                            style: TextStyle(color: Colors.black),
                          ),
                        ]),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      'view all 200 comments',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    DateFormat.yMMMd().format(snap['datePublished'].toDate()),
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
