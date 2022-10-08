import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Post {
  final String description;
  final String uid;
  final String postId;
  final String username;
  final datePublished;
  final String postUrl;
  final String profIamge;
  final likes;

  Post(
      {required this.description,
      required this.postId,
      required this.uid,
      required this.username,
      required this.postUrl,
      required this.datePublished,
      required this.profIamge,
      this.likes});
  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'description': description,
        'postId': postId,
        'postUrl': postUrl,
        'datePublished': datePublished,
        'profIamge': profIamge,
        'likes': likes
      };

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Post(
        username: snapshot['username'],
        uid: snapshot['uid'],
        description: snapshot['description'],
        postId: snapshot['postId'],
        postUrl: snapshot['postUrl'],
        datePublished: snapshot['datePublished'],
        profIamge: snapshot['profIamge'],
        likes: snapshot['likes']);
  }
}
