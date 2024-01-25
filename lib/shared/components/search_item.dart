import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../const.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({
   required this.image, required this.name, required this.date, required this.description});

  final String image;
  final String name;
  final String date;
  final String description;


  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
          width: 140,
          child: Card(
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  child: Image.network("${Const.IMAGE_BASE_URL}$image")))),
      SizedBox(width: 15,),
      Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          Text("$name",style:TextStyle(color: Colors.white,fontSize:
          15,fontWeight:FontWeight.w500,),overflow: TextOverflow.ellipsis,
              ),
          SizedBox(height: 5,),
          Text("$date",style:TextStyle(color: Colors.white.withOpacity(.6),fontSize:
          13),),
            SizedBox(height: 5,),
          Text("Rosa Salazar, Christoph Waltz",style:TextStyle(color: Colors.white.withOpacity(.6),fontSize:
          13),)
        ],),
      )
    ],);
  }
}
