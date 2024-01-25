import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/results.dart';
import '../../screens/home_screen/home_cubit/home_cubit.dart';

class AwsomeComponent extends StatefulWidget {
  AwsomeComponent(
      {required this.list, required this.selectedMovie, this.index, required this.savedIndexBoxName, required this.savedIndexBoxKey});

  final Results selectedMovie;
  int? index = 0;
  final List list;
  final String savedIndexBoxName;
  final String savedIndexBoxKey;

  @override
  State<AwsomeComponent> createState() => _AwsomeComponentState();
}

class _AwsomeComponentState extends State<AwsomeComponent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (BuildContext context, state) {
        if (state is DeleteMoviesSuccess) {
          return Stack(children: [
            Image.asset(widget.list.contains(widget.index)
                ? "assets/icons/icon-awesome-bold.png"
                : "assets/icons/iconawsome.png"),
            InkWell(
              focusColor: Colors.amber,
              onTap: () {
                cubit.checkIsItemSaved(movyItem: widget.selectedMovie);
                if (cubit.savedMovie) {
                  cubit.deleteSavedMovyItem(
                      savedMoviesIndex: cubit.savedMovieIndex!,
                      index: widget.index!, saveList: widget.list
                      , savedIndexBoxName: widget.savedIndexBoxName,
                      savedIndexBoxKey: widget.savedIndexBoxKey);

                  print("awsome_Component savedMovie1${cubit.savedMovie}");
                } else {
                  cubit.saveMovyItem(
                      movie: widget.selectedMovie,
                      index: widget.index!,
                      savedIndexBoxName: widget.savedIndexBoxName,
                      savedIndexBoxKey: widget.savedIndexBoxKey, saveList: widget.list);
                  print("awsome_Component savedMovie2${cubit.savedMovie}");
                }
              },
              child: Icon(
                widget.list.contains(widget.index) ? Icons.check : Icons.add,
                color: Colors.white,
              ),
            )
          ]);
        }
        if (state is SaveMovyItemStateSuccess) {
          return Stack(children: [
            Image.asset(widget.list.contains(widget.index)
                ? "assets/icons/icon-awesome-bold.png"
                : "assets/icons/iconawsome.png"),
            InkWell(
              onTap: () {
                cubit.checkIsItemSaved(movyItem: widget.selectedMovie);
                if (cubit.savedMovie) {
                  cubit.deleteSavedMovyItem(
                      savedMoviesIndex: cubit.savedMovieIndex!,
                      index: widget.index!, saveList:widget.list, savedIndexBoxName: widget.savedIndexBoxName,
                      savedIndexBoxKey: widget.savedIndexBoxKey);
                  //cubit.savedReleaseIndexList.remove(widget.index);
                  widget.list.remove(widget.index);
                } else {
                  cubit.saveMovyItem(movie: widget.selectedMovie,
                      index: widget.index!,saveList: widget.list,
                      savedIndexBoxName: widget.savedIndexBoxName,
                      savedIndexBoxKey: widget.savedIndexBoxKey);
                }
              },
              child: Icon(
                widget.list.contains(widget.index) ? Icons.check : Icons.add,
                color: Colors.white,
              ),
            )
          ]);
        } else {
          print("state is $state done0");
          return Stack(children: [
            Image.asset(widget.list.contains(widget.index)
                ? "assets/icons/icon-awesome-bold.png"
                : "assets/icons/iconawsome.png"),
            InkWell(
              onTap: () {
                cubit.checkIsItemSaved(movyItem: widget.selectedMovie);
                if (cubit.savedMovie) {
                  cubit.deleteSavedMovyItem(
                      savedMoviesIndex: cubit.savedMovieIndex!,
                      index: widget.index!, saveList:widget.list,
                      savedIndexBoxName: widget.savedIndexBoxName, savedIndexBoxKey:widget.savedIndexBoxKey);
                  widget.list.remove(widget.index);
                } else {
                  cubit.saveMovyItem(movie: widget.selectedMovie,
                      index: widget.index!, saveList: widget.list,
                      savedIndexBoxName: widget.savedIndexBoxName,
                      savedIndexBoxKey: widget.savedIndexBoxKey);
                }
                print(
                    "$cubit.savedMovie)>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
              },
              child: Icon(
                widget.list.contains(widget.index) ? Icons.check : Icons.add,
                color: Colors.white,
              ),
            )
          ]);
        }
      },
    );
  }
}
