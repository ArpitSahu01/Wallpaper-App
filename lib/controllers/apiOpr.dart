import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:wallpaper_guru/models/photosModel.dart';

class ApiOperations{

  static List<PhotosModel> trendingWallpapers = [];

  static Future<List<PhotosModel>> getTrendyWallpapers() async{

    final url = Uri.parse('https://api.pexels.com/v1/curated');
    final response = await http.get(url,headers: {
      "Authorization": "m125Nw2unOMcEALg6avbsGWMshWyrnFuT9ADUphwPXtLGqyeqLUOoubM",
    });
    Map<String,dynamic> json = jsonDecode(response.body);
    (json['photos'] as List<dynamic>).forEach((element) {
      trendingWallpapers.add( PhotosModel.fromAPI2App(element));
    });
    return trendingWallpapers;
  }

}