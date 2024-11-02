import 'package:flutter/material.dart';
import 'package:zetaton_wallpaper/features/home/data/models/image_model.dart';

import '../data/favourite_remote_data_source.dart';

class FavoriteProvider extends ChangeNotifier {
  final FavoriteRemoteDataSource remote = FavoriteRemoteDataSourceImp();
  // List<ImageModel> _favList = [];
  // List<ImageModel> get favList => _favList;

  // Function to add a img to favorites
  Future<void> addToFavorites(ImageModel img) async {
    remote.addToFavorites(img);
    notifyListeners();
  }

  // Function to remove a img from favorites
  Future<void> removeFromFavorites(ImageModel img) async {
    remote.removeFromFavorites(img);
    notifyListeners();
  }

  // Function to get the user's favorite imgs
  Stream<List<ImageModel>> getFavoriteImgs() {
    return remote.getFavoriteImgs();
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void startLoading() {
    _isLoading = true;
    notifyListeners();
  }

  void stopLoading() {
    _isLoading = false;
    notifyListeners();
  }
}
