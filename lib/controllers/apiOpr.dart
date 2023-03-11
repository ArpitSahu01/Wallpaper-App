import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiOperations{

  getTrendyWallpapers() async{
    final url = Uri.parse('https://api.pexels.com/v1/curated');
    final response = await http.get(url,headers: {
      "Authorization": "m125Nw2unOMcEALg6avbsGWMshWyrnFuT9ADUphwPXtLGqyeqLUOoubM",
    });
    Map<String,dynamic> json = jsonDecode(response.body);
    (json['photos'] as List<dynamic>).forEach((element) {
      print(element['url']);
    });
    
  }

}