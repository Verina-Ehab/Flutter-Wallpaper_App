// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

import '../data/data_source/home_remote_data_source.dart';
import '../data/models/image_model.dart';
import '../../favorite/controller/favorite_provider.dart';

class HomeProvider extends ChangeNotifier {

  bool isFavorite = false;

  ScrollController scrollController = ScrollController();
  HomeRemoteDataSource remote = HomeRemoteDataSourceImp();
  List<ImageModel> _imagesList = [];
  int _pageNumber = 1;

  List<ImageModel> get images => _imagesList;
  int get pageNumber => _pageNumber;
  final favoriteProvider = FavoriteProvider();
  bool _isLoading = false;

  bool get isLoading => _isLoading;



  // - use constructor for initializing something at the fisrt of provider-
  HomeProvider() {
    _fetchImages();
  }

  Future<void> _fetchImages() async {
    // Fetch the images from the API
    startLoading();
    final newImages = await remote.getImagesList(pageNumber: _pageNumber);

    // Check if this img is in the user's favorites
    // final isFavorite = favoriteList
    //     .any((favImg) => favImg['id'] == imgData['id']);

    // Extend the existing images list instead of replacing it
    _imagesList.addAll(newImages);
    stopLoading();
    // Notify listeners about the change
    notifyListeners();
  }

  void startLoading() {
    _isLoading = true;
    notifyListeners();
  }

  void stopLoading() {
    _isLoading = false;
    notifyListeners();
  }

  void loadMorePages() {
    _pageNumber++;
    _fetchImages();
  }

  
  void toggleFavorite(ImageModel img) {
    // img.isFavorite = !img.isFavorite;

    if (img.isFavorite) {
      favoriteProvider.removeFromFavorites(img);
      img.isFavorite = false;
    } else {
      favoriteProvider.addToFavorites(img);
      img.isFavorite = true;
    }

    notifyListeners();
  }

  @override
  void dispose() {
    // Dispose of the scroll controller
    scrollController.dispose();
    super.dispose();
  }
}
