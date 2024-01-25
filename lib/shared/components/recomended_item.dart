import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../screens/home_screen/home_cubit/home_cubit.dart';
import '../../screens/movie_details/movie_details.dart';
import '../const.dart';
import '../styles/colors.dart';
import 'awsome_componenet.dart';

class RecomendedItem extends StatelessWidget {
  const RecomendedItem({
    super.key,
    required this.height,
    required this.cheeIcin,

  });

  final double height;
  final bool cheeIcin;


  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    cubit
        .getRecomendedMovies()
        .then((value) => Future.delayed(Duration(seconds: 5)));
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (BuildContext context, state) {
        if (state is ShowLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }else if (cubit.recommendedMoviesResult.isEmpty) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetRecommendedMoviesFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return Container(
            height: height * .29,
            width: double.infinity,
            color: AppColors.LIGHt_BLACK_CLOLOR,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Recomended",
                      style: GoogleFonts.aBeeZee(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white)),
                  SizedBox(height: 3),
                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: cubit.recommendedMoviesResult.length,
                      itemBuilder: (context, index) {

                        // for chec if movy saved or not when run app
                        cubit.checkIsItemSaved(movyItem: cubit.recommendedMoviesResult[index]);

                        return InkWell(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MoviewDetails(
                                    selectedPobularMovy: context.read<HomeCubit>().recommendedMoviesResult[index],),
                                ));
                          },
                          child: Card(
                            elevation: 12,
                            color: AppColors.LIGHt_BLACK_CLOLOR,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 120,
                                    width: 96,
                                    child: Stack(
                                      children: [
                                        cubit.recommendedMoviesResult.isEmpty ? Center(child: CircularProgressIndicator(),)  : Image.network(
                                          "${Const.IMAGE_BASE_URL}${cubit.recommendedMoviesResult[index].posterPath}",
                                          fit: BoxFit.fill,
                                        ),
                                        AwsomeComponent(list: context.read<HomeCubit>().savedRecommendedIndexList,
                                          selectedMovie: context.read<HomeCubit>().recommendedMoviesResult[index],
                                          savedIndexBoxName: Const.SAVED_RECOMMENDED_INDEX_BOX, savedIndexBoxKey: Const.SAVED_RECOMMENDED_INDEX_BOX_KEY, index: index,
                                        )
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 3, bottom: 2),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              size: 20,
                                              color: AppColors.GOLD_CLOLOR,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "${cubit.recommendedMoviesResult[index].voteAverage}",
                                              style: GoogleFonts.aBeeZee(
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "${cubit.recommendedMoviesResult[index].title?.substring(0, 8)}"
                                        "",
                                        style: GoogleFonts.aBeeZee(
                                            color: Colors.white),
                                      ),
                                      Text(
                                        "${cubit.recommendedMoviesResult[index].releaseDate}",
                                        style: GoogleFonts.aBeeZee(
                                            color: Colors.white.withOpacity(.3),
                                            fontSize: 12),
                                      ),
                                    ],
                                  )
                                ]),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 20,
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
