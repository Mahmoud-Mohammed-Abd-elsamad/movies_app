import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/home_screen/home_cubit/home_cubit.dart';
import '../shared/styles/colors.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);
  static String routeName = "HomeLayout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {


  int bottomNavigationBarSelectedIcon = 0;

  @override
  Widget build(BuildContext context) {
    var homeCubit = BlocProvider.of<HomeCubit>(context);


    return Scaffold(
        backgroundColor: AppColors.BLACK_CLOLOR,



        bottomNavigationBar:BottomNavigationBar(
          currentIndex:homeCubit.bottomNavigationBarSelectedIcon  ,
          onTap: (index){
            homeCubit.bottomNavigationBarSelectedIcon = index;
            setState(() {
              print("$bottomNavigationBarSelectedIcon index $index");

            });

          },

          items: const [
            BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/icons/icon_home.png")),label: "HOME"),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/icons/search_icon.png")),label: "SEARCH"),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/icons/Icon_browse.png")),label: "BROWSE"),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/icons/icon_watch_list.png")),label: "WATCHLIST"),


          ],

        ),

        body:homeCubit.screens[homeCubit.bottomNavigationBarSelectedIcon],
    );
  }
}
