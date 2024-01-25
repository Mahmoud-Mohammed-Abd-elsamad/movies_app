import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../category-filter-screen/category-filter-screen.dart';
import '../home_screen/home_cubit/home_cubit.dart';


class BrowseScreen extends StatelessWidget {
  const BrowseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = context.read<HomeCubit>().categoriesList;
    return BlocBuilder<HomeCubit,HomeState>(builder: (BuildContext context, state) {
      if (state is ShowLoading) {
        const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is GetCategoriesListFailure) {
        return Center(
          child: Text(state.errorMessage),
        );
      }
      return Padding(
        padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Browse Category ",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
                child: GridView.builder(
              itemCount: list.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryFilterScreen(categoryId: '${list[index].id}',),
                        ));
                  },
                  child: Stack(
                    children: [
                      Image.asset("assets/icons/search_image.png"),
                      Positioned(
                          top: 37,
                          left: 55,
                          child: Text(
                            "${list[index].name}",
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                );
              },
            )),
          ],
        ),
      );
    });
  }
}
