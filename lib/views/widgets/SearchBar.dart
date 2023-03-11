import 'package:flutter/material.dart';
import 'package:wallpaper_guru/views/screens/search.dart';

class SearchBar extends StatelessWidget {
  TextEditingController controller =TextEditingController();
   SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Color.fromARGB(66, 192, 192, 192),
        border: Border.all(color: Color.fromARGB(66, 57, 57, 57)),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          Expanded(child: TextField(
            decoration: const InputDecoration(
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              border: InputBorder.none,
              disabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
            ),
            onChanged: (value){
              controller.text = value;
            },
          )),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (ctx)=>SearchScreen(query: controller.text,)));
            },
            child: const Icon(Icons.search),
          )
        ],
      ),
    );
  }
}
