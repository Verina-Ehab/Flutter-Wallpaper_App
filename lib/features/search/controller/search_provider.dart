// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

import '../../home/data/models/image_model.dart';
import '../data/search_remote_data_source.dart';

class SearchProvider extends ChangeNotifier {
  List<ImageModel> _imagesList = [];
  int _pageNumber = 1;
  SearchRemoteDataSource remote = SearchRemoteDataSourceImp();

  List<ImageModel> get images => _imagesList;
  int get pageNumber => _pageNumber;

  Future<List<ImageModel>> getImagesBySearch() async {
    startLoading();
    _imagesList.clear();
    // Fetch the images from the API
    final newImages =
        await remote.getImagesBySearch(query: searchEditingController.text);
    // Extend the existing images list instead of replacing it
    _imagesList.addAll(newImages);
    stopLoading();
    // Notify listeners about the change
    notifyListeners();
    return _imagesList;
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

  TextEditingController searchEditingController = TextEditingController();
  ScrollController scrollController = ScrollController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    searchEditingController.dispose();
    focusNode.dispose();
    scrollController.dispose();
    super.dispose();
  }

  Future<List<ImageModel>> loadMorePages() async {
    _pageNumber++;
    // Fetch the images from the API
    final newImages = await remote.getImagesBySearch(
        pageNumber: pageNumber, query: searchEditingController.text);
    // Extend the existing images list instead of replacing it
    _imagesList.addAll(newImages);
    // Notify listeners about the change
    notifyListeners();
    return _imagesList;
  }
}
