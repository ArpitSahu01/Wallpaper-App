import 'package:flutter/material.dart';
import 'package:wallpaper_guru/views/widgets/CustomAppBar.dart';
import 'package:wallpaper_guru/views/widgets/SearchBar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

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
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
                  itemCount: 30,
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
                    child: Image.network("https://images.pexels.com/photos/1114797/pexels-photo-1114797.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",fit: BoxFit.cover,)),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
