import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/search_item.dart';
import '../home_screen/home_cubit/home_cubit.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   var list = context.read<HomeCubit>().savedMoviesList;
    return Padding(
      padding: const EdgeInsets.only(top: 50,left: 20,right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text("Watch List",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.white),),
        Expanded(
          child: ListView.separated(itemCount: list.length,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(endIndent: 30,color: Colors.white.withOpacity(.8),height: 5,thickness: .6,);},
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15,top: 15),
                child: SearchItem(image:list[index].backdropPath??"", name: list[index].title??"",
                    date:list[index].releaseDate??"", description: list[index].overview?.substring(0,25)??""),
              );
            },
          ),
        ),

      ],),
    );
  }
}