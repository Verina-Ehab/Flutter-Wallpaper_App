import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/contants/firestore_keys.dart';
import '../../home/data/models/image_model.dart';

abstract class FavoriteRemoteDataSource {

  Future<void> addToFavorites(ImageModel img);
  Future<void> removeFromFavorites(ImageModel img);
  Stream<List<ImageModel>> getFavoriteImgs();
}

class FavoriteRemoteDataSourceImp implements FavoriteRemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get userId => _auth.currentUser!.uid;

  // Function to add a img to favorites
  @override
  Future<void> addToFavorites(ImageModel img) async {
    try {
      await _firestore.collection(USERS_COLLECTION).doc(userId).update({
        FAV_LIST: FieldValue.arrayUnion([
          {IMG_ID: img.id, IMG_URL: img.url, IMG_PORTRAIT: img.portraitPath}
        ])
      });
    } catch (error) {
      log('Error adding to favorites: $error');
    }
  }

  // Function to remove a img from favorites
  @override
  Future<void> removeFromFavorites(ImageModel img) async {
    try {
      await _firestore.collection(USERS_COLLECTION).doc(userId).update({
        FAV_LIST: FieldValue.arrayRemove([
          {IMG_ID: img.id, IMG_URL: img.url, IMG_PORTRAIT: img.portraitPath}
        ])
      });
    } catch (error) {
      log('Error removing from favorites: $error');
    }
  }

  // Function to get the user's favorite imgs
  @override
  Stream<List<ImageModel>> getFavoriteImgs() {
    return _firestore
        .collection(USERS_COLLECTION)
        .doc(userId)
        .snapshots()
        .map((snapshot) {
      List<dynamic> favoriteList =
          (snapshot.data() as Map<String, dynamic>)[FAV_LIST] ?? [];

      return favoriteList.map((imgData) {
        // Check if this image is in the user's favorites
        // final isFavorite = favoriteList
        //     .any((favImage) => favImage['id'] == imageData['id']);
        return ImageModel(
          id: imgData[IMG_ID],
          url: imgData[IMG_URL],
          portraitPath: imgData[IMG_PORTRAIT],
          isFavorite: true,
        );
      }).toList();
    });
  }
}
