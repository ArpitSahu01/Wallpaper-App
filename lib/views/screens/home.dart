import 'package:flutter/material.dart';
import 'package:wallpaper_guru/controllers/apiOpr.dart';
import 'package:wallpaper_guru/models/photosModel.dart';
import 'package:wallpaper_guru/views/widgets/CustomAppBar.dart';
import 'package:wallpaper_guru/views/widgets/SearchBar.dart';
import 'package:wallpaper_guru/views/widgets/catBlock.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  List<PhotosModel> trendingWallList = [];
  @override
  void initState() {
    ApiOperations.getTrendyWallpapers().then((value) {
      trendingWallList = value;
      setState(() {

      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: CustomAppBar(word1: "Wallpaper",word2: "Guru",),
      ),
      body: Column(
        children: [
          SearchBar(),
          Container(
            margin:const EdgeInsets.symmetric(vertical: 20),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 30,
              itemBuilder: (context,index)=>CatBlock(),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
                itemCount: trendingWallList.length,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 400,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
              ), itemBuilder: (context,index)=>Container(
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(14)
                ),

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                    child: Image.network(trendingWallList[index].imgSrc,fit: BoxFit.cover,)),
              )),
            ),
          ),

        ],
      ),
    );
  }
}
