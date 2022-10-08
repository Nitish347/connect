import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String bio;
  final List followers;
  final List following;

  UserData(
      {required this.email,
      required this.photoUrl,
      required this.uid,
      required this.username,
      required this.bio,
      required this.followers,
      required this.following});
  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'email': email,
        'bio': bio,
        'followers': [],
        'following': [],
        'photoUrl': photoUrl
      };

  static UserData fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserData(
        email: snapshot['email'],
        photoUrl: snapshot['photoUrl'],
        uid: snapshot['uid'],
        username: snapshot['username'],
        bio: snapshot['bio'],
        followers: snapshot['followers'],
        following: snapshot['following']);
  }
}
