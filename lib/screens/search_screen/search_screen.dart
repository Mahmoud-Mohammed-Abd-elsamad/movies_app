import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/custom_search_app_barr.dart';
import '../../shared/components/search_item.dart';
import '../home_screen/home_cubit/home_cubit.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(left: 25.0, top: 50),
      child: Column(
        children: [
          CustomSearcAppBarr(
            width: width,
            height: height,
          ),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (BuildContext context, state) {
              var list = context.read<HomeCubit>().searchDataList;
              if (state is ShowLoading) {
                return const Center(
                  child: Column(children: [
                    SizedBox(
                      height: 220,

                    ),
                    CircularProgressIndicator()
                  ]),
                );
              } else if (state is SearchFunctionFailure) {
                Center(
                  child: Text(
                    state.errorMessage,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              } else if (state is SearchFunctionSuccess) {
                return Expanded(
                  child: ListView.separated(
                    itemCount: list.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        endIndent: 30,
                        color: Colors.white.withOpacity(.8),
                        height: 5,
                        thickness: .6,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15, top: 15),
                        child: SearchItem(
                            image: list[index].backdropPath ?? "",
                            name: list[index].title ?? "",
                            date: list[index].releaseDate ?? "",
                            description: "description"),
                      );
                    },
                  ),
                );
              }
                return Center(child: Padding(
                  padding: const EdgeInsets.only(top: 250),
                  child: Image.asset("assets/icons/icon_search_not_found_movies.png"),
                ),);
            },
          ),
        ],
      ),
    );
  }
}
