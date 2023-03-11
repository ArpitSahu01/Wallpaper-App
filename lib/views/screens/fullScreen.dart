import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';



class FullScreen extends StatelessWidget {
  String imgUrl;
   FullScreen({Key? key,required this.imgUrl}) : super(key: key);
   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();



   // Future<void> setWallpaperFromFile(BuildContext context) async{
   //    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Downloading Started...")));
   //    try{
   //
   //      var imageId = await ImageDownloader.downloadImage(imgUrl);
   //      if(imageId == null){
   //        return;
   //      }
   //
   //      var path = await ImageDownloader.findPath(imageId);
   //      ScaffoldMessenger.of(context).hideCurrentSnackBar();
   //      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successfully Set...")));
   //
   //    }on PlatformException catch(e){
   //      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error occurred $e")));
   //    }
   // }

Future<void> setWallpaperFromFile(BuildContext context) async{
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Setting as wallpaper')));
  int location = WallpaperManager.LOCK_SCREEN;
  var file = await DefaultCacheManager().getSingleFile(imgUrl);
  String result = await WallpaperManager.setWallpaperFromFile(file.path, location);

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Successfully set as wallpaper')));

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ElevatedButton(
        onPressed: () async{
          await setWallpaperFromFile(context);
        },
        child: const Text('Set Wallpaper'),
      ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(imgUrl),fit: BoxFit.cover),
        ),
      ),
    );
  }
}
