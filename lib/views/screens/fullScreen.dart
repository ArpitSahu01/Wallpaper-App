import 'package:flutter/material.dart';

class FullScreen extends StatelessWidget {
  String imgUrl;
   FullScreen({Key? key,required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
