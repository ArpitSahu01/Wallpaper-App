import 'package:flutter/material.dart';
import 'package:wallpaper_guru/controllers/apiOpr.dart';
import 'package:wallpaper_guru/models/photosModel.dart';
import 'package:wallpaper_guru/views/widgets/CustomAppBar.dart';
import 'package:wallpaper_guru/views/widgets/SearchBar.dart';

class SearchScreen extends StatefulWidget {
  String query;
   SearchScreen({Key? key,required this.query}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  List<PhotosModel> searchResults = [];

  getSearchResults() async{
    searchResults = await ApiOperations.searchWallpapers(widget.query);
    setState(() {
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSearchResults();
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
          SizedBox(height: 10,),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
                  itemCount: searchResults.length,
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
                    child: Image.network(searchResults[index].imgSrc,fit: BoxFit.cover,)),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
