import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget {
  final String word1;
  final String word2;
   CustomAppBar({Key? key, required this.word1,required this.word2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        text:  TextSpan(
          text: word1,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: " ${word2}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.orangeAccent,
              ),
            )
          ]
        ),

      ),
    );
  }
}
