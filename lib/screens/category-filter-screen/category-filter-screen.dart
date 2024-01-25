import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/const.dart';
import '../movie_details/movie_details.dart';
import 'category_filter_screen_cubit.dart';

class CategoryFilterScreen extends StatefulWidget {
  const CategoryFilterScreen({Key? key, required this.categoryId})
      : super(key: key);
  final String categoryId;

  @override
  State<CategoryFilterScreen> createState() => _CategoryFilterScreenState();
}

class _CategoryFilterScreenState extends State<CategoryFilterScreen> {
  @override
  void initState() {
    context
        .read<CategoryFilterScreenCubit>()
        .getListOfFilteredmovies(widget.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocBuilder<CategoryFilterScreenCubit, CategoryFilterScreenState>(
          builder: (BuildContext context, state) {
        if (state is CategoryFilterScreenShowLoading) {
          const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        } else if (state is CategoryFilterScreenFalure) {
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
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Expanded(
                  child: GridView.builder(
                itemCount: context.read<CategoryFilterScreenCubit>().listOfFilteredCategories.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 250,
                    mainAxisExtent: 250,
                    childAspectRatio: 3 / 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      //cubit.deleteSavedItem(0);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MoviewDetails(
                              selectedPobularMovy: context
                                  .read<CategoryFilterScreenCubit>()
                                  .listOfFilteredCategories[index],
                            ),
                          ));
                    },
                    child: Stack(
                      children: [
                        const Positioned(right: 30,top: 50,child: CircularProgressIndicator()),
                        Image.network(
                          "${Const.IMAGE_BASE_URL}${context.read<CategoryFilterScreenCubit>().listOfFilteredCategories[index].posterPath}",
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                  );
                },
              )),
            ],
          ),
        );
      }),
    );
  }
}
