import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:media_scanner/media_scanner.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:zetaton_wallpaper/core/contants/api_constants.dart';
import 'package:zetaton_wallpaper/core/helpers/snackbar.dart';
import '../models/image_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<ImageModel>> getImagesList({int? pageNumber});
  Future<ImageModel> getImageById({required int id});
  Future<List<ImageModel>> getImagesBySearch({
    required String query,
    int? pageNumber,
  });
  Future<void> downloadImage(
      {required String imageUrl,
      required int imageId,
      required BuildContext context});
}

class HomeRemoteDataSourceImp implements HomeRemoteDataSource {
  final String apiKey = API_KEY;
  final String baseURL = BASE_URL;

  @override
  Future<List<ImageModel>> getImagesList({int? pageNumber}) async {
    String url = '';

    if (pageNumber == null) {
      url = "${baseURL}curated?per_page=80";
    } else {
      url = "${baseURL}curated?per_page=80&page=$pageNumber";
    }

    List<ImageModel> imagesList = [];

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': apiKey,
        },
      );

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        final jsonData = json.decode(response.body);

        for (final json in jsonData["photos"] as Iterable) {
          final image = ImageModel.fromJson(json);
          log(image.portraitPath.toString());
          imagesList.add(image);
        }
      }
    } catch (_) {}

    return imagesList;
  }

  @override
  Future<ImageModel> getImageById({required int id}) async {
    final url = "${baseURL}photos/$id";

    ImageModel image = ImageModel.emptyConstructor();

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': apiKey,
        },
      );

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        final jsonData = json.decode(response.body);

        image = ImageModel.fromJson(jsonData);
      }
    } catch (_) {}
    return image;
  }

  @override
  Future<List<ImageModel>> getImagesBySearch({
    required String query,
    int? pageNumber,
  }) async {
    pageNumber ?? 1;
    final url = "${baseURL}search?query=$query&per_page=80&page=$pageNumber";
    List<ImageModel> imagesList = [];

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': apiKey,
        },
      );

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        final jsonData = json.decode(response.body);

        for (final json in jsonData["photos"] as Iterable) {
          final image = ImageModel.fromJson(json);
          imagesList.add(image);
        }
      }
    } catch (_) {}

    return imagesList;
  }

  @override
  Future<void> downloadImage(
      {required String imageUrl,
      required int imageId,
      required BuildContext context}) async {
    try {
      // Check for storage permission
      // var status =
      await Permission.storage.request();
      final response = await http.get(Uri.parse(imageUrl));

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        final bytes = response.bodyBytes;
        // final directory = await getExternalStorageDirectory();
        // final downloadDirectory = Directory('${directory!.path}/Zetaton');
        final downloadDirectory =
            Directory('/storage/emulated/0/Download/Zetaton');
        // File file = new File('$directory/Zetaton');

        // Ensure the directory exists
        if (!await downloadDirectory.exists()) {
          await downloadDirectory.create(recursive: true);
        }

        if (kDebugMode) {
          print('Zetaton directory: ${downloadDirectory.path}');
        }

        // Construct the file path correctly
        final file = File('${downloadDirectory.path}/$imageId.png');
        await file.writeAsBytes(bytes);

        MediaScanner.loadMedia(path: file.path);

        if (context.mounted) {
          ScaffoldMessenger.of(context).clearSnackBars();

          showSuccessSnackBar(
              message: "File's been saved at: ${file.path}", context: context);
        }
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).clearSnackBars();

          showErrorSnackBar(
              message: "Storage permission denied.", context: context);
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).clearSnackBars();

        showErrorSnackBar(message: "An error occurred: $e", context: context);
      }
    }
  }
}
