import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/results.dart';
import '../../shared/components/similar-movies-widget.dart';
import '../../shared/const.dart';
import '../../shared/styles/colors.dart';
import 'movie_details_cubit.dart';

class MoviewDetails extends StatefulWidget {
   MoviewDetails({Key? key, required this.selectedPobularMovy}) : super(key: key);
  static String routeName = "MoviewDetails";
  final Results selectedPobularMovy;

  @override
  State<MoviewDetails> createState() => _MoviewDetailsState();
}

class _MoviewDetailsState extends State<MoviewDetails> {

  @override
  void initState() {
      context.read<MovieDetailsCubit>().getSimilarMovies("${widget.selectedPobularMovy.id}");
      super.initState();
  }
// w412,h290
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.LIGHt_BLACK_CLOLOR,
      appBar: AppBar(                                                     //6
        backgroundColor: AppColors.LIGHt_BLACK_CLOLOR,
        title: Center(
          child: Text(
            "${widget.selectedPobularMovy.originalTitle}",
            style: GoogleFonts.aBeeZee(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network("${Const.IMAGE_BASE_URL}${widget.selectedPobularMovy.backdropPath}"),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "${widget.selectedPobularMovy.originalTitle}",
                  style: GoogleFonts.aBeeZee(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text("${widget.selectedPobularMovy.releaseDate}",
                    style:
                        GoogleFonts.aBeeZee(fontSize: 14, color: Colors.white))
              ],
            ),
          ),

          ///first item
          const SizedBox(                                                          //11
            height: 20,
          ),

          Container(
            height: height * .22,
            width: double.infinity,
            color: AppColors.LIGHt_BLACK_CLOLOR,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Stack(
                    children: [
                      SizedBox(height: 200,width: 129,child: Image.network("${Const.IMAGE_BASE_URL}${widget.selectedPobularMovy.posterPath}")),
                      Positioned(
                        left: 8,
                        child: Image.asset(
                          "assets/icons/icon-awesome-bold.png",
                        ),
                      ),
                      const Positioned(left: 8,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 16),
                          child: GridView.builder(
                            itemCount: widget.selectedPobularMovy.genreIds!.length,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 100,
                                    childAspectRatio: 3 / 1.2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 5),
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.white.withOpacity(.6),
                                      width: 1),
                                ),
                                child: const Center(
                                    child: Text(
                                  "hellow",
                                  style: TextStyle(color: Colors.white),
                                )),
                              );
                            },
                          ),
                        )),
                        Text("${widget.selectedPobularMovy.overview}",maxLines: 3,style: const TextStyle(color: Colors.white),),
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              size: 30,
                              color: AppColors.GOLD_CLOLOR,
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Column(
                              children:[
                                const SizedBox(height: 6,),Text(
                                "${widget.selectedPobularMovy.voteAverage}",
                                style: GoogleFonts.aBeeZee(
                                    color: Colors.white,fontSize: 25),
                              ),]
                            )
                          ],
                        ),

                        //SizedBox(height: 120,)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          ///second item
          const SizedBox(
            height: 15,
          ),

          SimilarMoviesWidget(height: height,)
        ],
      ),
    );
  }
}

