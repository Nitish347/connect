import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled6/models/post.dart';
import 'package:untitled6/resources/storage_method.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //upload post
  Future<String> uploadPost(String description, String profIamge,
      Uint8List file, uid, String username) async {
    String res = "So me error occured";
    try {
      String postId = Uuid().v1();
      String photoUrl =
          await StorageMethod().uploadImageToStorage('post', file, true);
      Post post = Post(
          description: description,
          postId: postId,
          uid: uid,
          username: username,
          postUrl: photoUrl,
          datePublished: DateTime.now(),
          profIamge: profIamge,
          likes: []);
      _firestore.collection('posts').doc(postId).set(post.toJson());
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<void> likePost(String postId, String uid, List likes) async {
    try {
      if (likes.contains(uid)) {
        await _firestore.collection('posts').doc(postId).update(
          {
            'likes': FieldValue.arrayRemove([uid])
          },
        );
      } else {
        await _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayUnion([uid])
        });
      }
    } catch (e) {}
  }

  Future<void> postComment(String postId, String text, String uid, String name,
      String profilepic) async {
    try {
      if (text.isNotEmpty) {
        String commentId = Uuid().v1();
        _firestore
            .collection('posts')
            .doc(postId)
            .collection('comments')
            .doc(commentId)
            .set({
          'profilePic': profilepic,
          'name': name,
          'text': text,
          'commentId': commentId,
          'datePublished': DateTime.now(),
        });
      } else {
        print('text is empty');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> deletePost(String postId) async {
    try {
      await _firestore.collection('posts').doc(postId).delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
