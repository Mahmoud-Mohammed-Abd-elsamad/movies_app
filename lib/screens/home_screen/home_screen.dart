import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/pobular_item.dart';
import '../../shared/components/realease_item.dart';
import '../../shared/components/recomended_item.dart';
import 'home_cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = "HomeScreen";

// w412,h290
  @override
  Widget build(BuildContext context) {
    var homeCubit = context.read<HomeCubit>();
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return Column(
      children: [
        SizedBox(
          height: 325,
          child: BlocBuilder<HomeCubit, HomeState>(

            builder: (BuildContext context, state) {
              if (State is ShowLoading) {
                return const Center(child: CircularProgressIndicator(),);
              } else if (State is GetPopularMovieFailure) {
                return const Center(child: Text("error}"),);
              }else if (context.read<HomeCubit>().popularResults.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return CarouselSlider.builder(itemCount: context
                    .read<HomeCubit>()
                    .popularResults
                    .length, itemBuilder: (context, index, realIndex) {
                  // for chec if movy saved or not when run app
                  //homeCubit.checkIsItemSaved(movyItem: homeCubit.recommendedMoviesResult[index]);
                  return  PobularItem(height: height, width: width, homeImage:homeCubit.popularResults[index].backdropPath??"",
                    smallImage:homeCubit.popularResults[index].posterPath??""
                    , title:homeCubit.popularResults[index].title??"", realseDate:homeCubit.popularResults[index].releaseDate??'', index: index,);

                }, options: CarouselOptions(
              height: 325,
              aspectRatio: 16/9,
              viewportFraction: 01,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,),);
              }
            },
          ),
        ),

        ///first item
        const SizedBox(height: 20,),

        RealeaseItem(height: height, image: '', checkIcon: false,),

        ///second item
        const SizedBox(height: 15,),

        RecomendedItem(height: height,
          cheeIcin: false,
          )


      ],
    );
  }
}



