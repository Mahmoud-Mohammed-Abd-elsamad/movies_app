import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../screens/home_screen/home_cubit/home_cubit.dart';
import '../../screens/movie_details/movie_details.dart';
import '../const.dart';
import '../styles/colors.dart';
import 'awsome_componenet.dart';

class RealeaseItem extends StatefulWidget {
  const RealeaseItem({
    super.key,
    required this.height,
    required this.image,
    required this.checkIcon,
  });

  final String image;
  final bool checkIcon;
  final double height;


  @override
  State<RealeaseItem> createState() => _RealeaseItemState();
}

class _RealeaseItemState extends State<RealeaseItem> {
  var saved = false;
  @override
  Widget build(BuildContext context) {

   var cubit =  context.read<HomeCubit>();
   cubit.getNewReleasesMovies()
        .then((value) => Duration(seconds: 5));

    return Container(
      height: widget.height * .22,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (BuildContext context, state) {
          if (state is ShowLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (State is GetNewReleasesMoviesFailure) {
            return Center(
              child: Text("error}"),
            );
          }else if (cubit.releaseMoviesResult.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{
            return  Container(
              height: widget.height * .22,
              width: double.infinity,
              color: AppColors.LIGHt_BLACK_CLOLOR,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("New Releases ",
                        style: GoogleFonts.aBeeZee(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white)),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount:  cubit.releaseMoviesResult.length,
                        itemBuilder: (context, index) {

                          // for chec if movy saved or not when run app
                          cubit.checkIsItemSaved(movyItem: cubit.releaseMoviesResult[index]);


                          return InkWell(
                            onTap: (){
                              //cubit.deleteSavedItem(0);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MoviewDetails(
                                      selectedPobularMovy: context.read<HomeCubit>().releaseMoviesResult[index],),
                                  ));
                            },
                            child: Stack(
                              children: [
                                Image.network(
                                  "${Const.IMAGE_BASE_URL}${cubit.releaseMoviesResult[index].posterPath}",
                                  fit: BoxFit.fill,
                                ),
                                AwsomeComponent(list: context.read<HomeCubit>().savedReleaseIndexList, selectedMovie:  context.read<HomeCubit>().releaseMoviesResult[index],index: index, savedIndexBoxName: Const.SAVED_RELEAS_INDEX_BOX
                                  , savedIndexBoxKey:Const.SAVED_RELEAS_INDEX_BOX_KEY,)

                              ],
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
      ),
    );
  }
}
