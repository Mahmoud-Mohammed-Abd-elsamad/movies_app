import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../screens/home_screen/home_cubit/home_cubit.dart';
import '../styles/colors.dart';

class CustomSearcAppBarr extends StatefulWidget {
  const CustomSearcAppBarr({required this.width,required this.height});

 final double width;
  final double height;

  @override
  State<CustomSearcAppBarr> createState() => _CustomSearcAppBarrState();
}

class _CustomSearcAppBarrState extends State<CustomSearcAppBarr> {



  @override
  Widget build(BuildContext context) {
    return    Container(
      height: widget.height * .06,
      width: widget.width * .9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(38)),
          color: AppColors.LIGHt_BLACK_CLOLOR),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
                style:
                const TextStyle(fontSize: 12.0, color:Colors.white),
                onChanged: (text){
                  context.read<HomeCubit>().searchMethod(text).then((value){
                    Future.delayed(const Duration(seconds: 5));
                  });
                  setState(() {

                  print("searchDataList${ context.read<HomeCubit>().searchDataList.length}");

                  });
                },
                showCursor: false,
                decoration: InputDecoration(

                    prefixIcon: Icon(Icons.search,color: Colors.white,),
                    hintText: "Search",
                    filled:true ,
                    hintStyle: TextStyle(
                        color: Colors.white.withOpacity(.4)),
                    focusedBorder: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: .5,

                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: .5,
                      ),
                    )),
              )),
        ],
      ),
    );
  }
}
