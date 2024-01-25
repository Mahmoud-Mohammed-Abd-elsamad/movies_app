import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../screens/home_screen/home_cubit/home_cubit.dart';
import '../../screens/movie_details/movie_details.dart';
import '../const.dart';
import 'awsome_componenet.dart';

class PobularItem extends StatelessWidget {
  const PobularItem({
    super.key,
    required this.height,
    required this.width, required this.homeImage, required this.smallImage,
    required this.title, required this.realseDate, required this.index
  });

  final String homeImage;
  final String smallImage;
  final String title;
  final String realseDate;
  final double height;
  final double width;
  final int index;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Stack(
        children: [
          Container(
            height: height * .333,
            width: width,
          ),
          Image.network("${Const.IMAGE_BASE_URL}$homeImage",fit: BoxFit.cover,),

          Positioned(
              bottom: 0,
              child: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child:   Container(
                    height: 200,width: 129,
                    child: Stack(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MoviewDetails(
                                    selectedPobularMovy: context.read<HomeCubit>().popularResults[index],),
                                ));
                          },
                          child: Image.network(
                            "${Const.IMAGE_BASE_URL}$smallImage",
                            fit:BoxFit.fill,
                          ),
                        ),
                       AwsomeComponent(list: context.read<HomeCubit>().savedPopularIndexList,
                         index:index, selectedMovie: context.read<HomeCubit>().popularResults[index],
                         savedIndexBoxName: Const.SAVED_POPULAR_INDEX_BOX, savedIndexBoxKey: Const.SAVED_POPULAR_INDEX_BOX_KEY, )

                      ],
                    ),
                  ),)),

          Positioned(
            bottom: 20,
            left: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$title",
                  style: GoogleFonts.aBeeZee(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 8,
                ),
                Text("$realseDate",
                    style: GoogleFonts.aBeeZee(
                        fontSize: 14, color: Colors.white.withOpacity(.6)))
              ],
            ),
          )
        ],
      ),
    );
  }
}
