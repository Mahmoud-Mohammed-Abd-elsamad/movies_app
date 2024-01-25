import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../screens/home_screen/home_cubit/home_cubit.dart';
import '../../screens/movie_details/movie_details.dart';
import '../../screens/movie_details/movie_details_cubit.dart';
import '../const.dart';
import '../styles/colors.dart';
import 'awsome_componenet.dart';

class SimilarMoviesWidget extends StatelessWidget {
  const SimilarMoviesWidget({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {

    //var list = context.read<MovieDetailsCubit>().similarMoviesList;
    print("${context.read<MovieDetailsCubit>().similarMoviesList.length} similar list , lenth >>>>>>>>>>>>>>>>>>>>>>>>>>> ");
    return BlocBuilder<MovieDetailsCubit,MovieDetailsState>(
      builder: (BuildContext context, state) {

        if(state is MovieDetailsShowLoading){

          return const Center(child: CircularProgressIndicator());
        }else if(state is GetSimilarMoviesFailure){
          return  Center(child: Text(state.errorMessage));
        }else if(state is GetSimilarMoviesSuccess){

          return Container(
            height: height * .29,
            width: double.infinity,
            color: AppColors.LIGHt_BLACK_CLOLOR,
            child: Padding(
              padding: EdgeInsets.only(right: 16,left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("More Like This",
                      style: GoogleFonts.aBeeZee(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white)),
                  SizedBox(height: 3),
                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: context.read<MovieDetailsCubit>().similarMoviesList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 196,
                          width: 100,
                          child: InkWell(
                            onTap: (){
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MoviewDetails(
                                      selectedPobularMovy: context.read<MovieDetailsCubit>().similarMoviesList[index],),
                                  ));
                            },
                            child: Card(
                              elevation: 12,
                              color: AppColors.LIGHt_BLACK_CLOLOR,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Image.network(
                                          "${Const.IMAGE_BASE_URL}${context.read<MovieDetailsCubit>().similarMoviesList[index].posterPath}",
                                          fit: BoxFit.fill,
                                        ),
                                       AwsomeComponent(list: context.read<HomeCubit>().savedSimilarIndexList, selectedMovie: context.read<MovieDetailsCubit>().similarMoviesList[index], savedIndexBoxName: '', savedIndexBoxKey: '',index: index, )
                                      ],
                                    ),
                                    Flexible(
                                      child: Column(
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
                                                  "${context.read<MovieDetailsCubit>().similarMoviesList[index].voteAverage}",
                                                  style: GoogleFonts.aBeeZee(
                                                      color: Colors.white),
                                                )
                                              ],
                                            ),
                                          ),
                                          Text(
                                            "${context.read<MovieDetailsCubit>().similarMoviesList[index].title}",
                                            style: GoogleFonts.aBeeZee(
                                                color: Colors.white,),maxLines: 2,
                                          ),
                                          Text(overflow:TextOverflow.ellipsis,
                                            "${context.read<MovieDetailsCubit>().similarMoviesList[index].releaseDate}",
                                            style: GoogleFonts.aBeeZee(
                                                color: Colors.white.withOpacity(.3),
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    )
                                  ]),
                            ),
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
        }else{
          return Center(child: CircularProgressIndicator(),);
        }
        },

    );
  }
}
