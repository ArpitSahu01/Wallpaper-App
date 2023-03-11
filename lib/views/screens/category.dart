import 'package:flutter/material.dart';
import 'package:wallpaper_guru/views/widgets/CustomAppBar.dart';
import 'package:wallpaper_guru/views/widgets/SearchBar.dart';
import 'package:wallpaper_guru/views/widgets/catBlock.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: CustomAppBar(
          word1: "Wallpaper",
          word2: "Guru",
        ),
      ),
      body: Column(
        children: [

          Stack(
            children:[ Container(
              margin: EdgeInsets.only(bottom: 20,),
              child: Image.network(
                "https://images.pexels.com/photos/1110658/pexels-photo-1110658.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                height: 200,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
              Container(
                height: 200,
                color: Colors.black26,
              ),

              Positioned(
                left: 110,
                top: 65,
                child: Column(
                  children: [
                    Text(
                      'Category',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Mountains',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
                  ),
                  itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.circular(14)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.network(
                              "https://images.pexels.com/photos/1114797/pexels-photo-1114797.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                              fit: BoxFit.cover,
                            )),
                      )),
            ),
          ),
        ],
      ),
    );
  }
}
