import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors.dart';


class MyThemeData {
   static ThemeData darkTheme = ThemeData(
       appBarTheme: const AppBarTheme(
         backgroundColor: Colors.transparent,
         elevation: 0,
         centerTitle: true,
       ),

       bottomNavigationBarTheme: BottomNavigationBarThemeData(
         selectedItemColor: AppColors.GOLD_CLOLOR,
         showUnselectedLabels: true,
          unselectedItemColor:AppColors.ICON_UN_SELECTED_COLOR ,
         unselectedLabelStyle: GoogleFonts.aBeeZee(textStyle: const TextStyle(
             fontSize: 8,color: AppColors.ICON_UN_SELECTED_COLOR,fontWeight: FontWeight.bold
         )),
         selectedLabelStyle:GoogleFonts.aBeeZee(textStyle: const TextStyle(
             fontSize: 8,fontWeight: FontWeight.bold
         )) ,
         backgroundColor: AppColors.LIGHt_BLACK_CLOLOR,
         type: BottomNavigationBarType.fixed,
         selectedIconTheme: const IconThemeData(  size: 40,
           color: AppColors.GOLD_CLOLOR
         ),unselectedIconTheme: const IconThemeData(size: 40,
           color: AppColors.ICON_UN_SELECTED_COLOR
       ),

       )
   );

}
