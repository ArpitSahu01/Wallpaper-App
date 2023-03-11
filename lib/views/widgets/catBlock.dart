import 'package:flutter/material.dart';

class CatBlock extends StatelessWidget {
  const CatBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 7),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://images.pexels.com/photos/2499769/pexels-photo-2499769.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              width: 100,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.black26),
          ),
          Positioned(
            left: 35,
            top: 15,
            child: Text(
              'Car',
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
