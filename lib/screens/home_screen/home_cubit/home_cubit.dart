import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../../../models/category_model.dart';
import '../../../models/popular_model.dart';
import '../../../models/recomended_model.dart';
import '../../../models/release_model.dart';
import '../../../models/results.dart';
import '../../../models/search_model.dart';
import '../../../shared/const.dart';
import '../../brows_screen/browse_screen.dart';
import '../../search_screen/search_screen.dart';
import '../../watch_list_screen/watch_list_screen.dart';
import '../home_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int bottomNavigationBarSelectedIcon = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const BrowseScreen(),
    const WatchListScreen()
  ];
  List<Results> popularResults = [];
  List<Results> recommendedMoviesResult = [];
  List<Results> releaseMoviesResult = [];
  List<int> savedPopularIndexList = [];
   List<int> savedReleaseIndexList = [];
   List<int> savedSimilarIndexList = [];
   List<int> savedRecommendedIndexList = [];
   List<Results> savedMoviesList = [];
  List<Results> searchDataList = [];
  List<Genres> categoriesList = [];
  bool savedMovie = false;
  int? savedMovieIndex ;
                                                                      //3
   checkIsItemSaved({required Results movyItem}){
     if(savedMoviesList.isEmpty){
       savedMovie = false;
       return;
     }
    for(int i = 0; i < savedMoviesList.length;i++){
      var moviesBox = Hive.box<Results>(Const.SAVED_MOVIES_BOX);
      savedMoviesList.clear();
      savedMoviesList = moviesBox.values.toList();


      if(savedMoviesList[i].posterPath == movyItem.posterPath){
        savedMovie = true;
        savedMovieIndex = i;
        break;
      }else{
        savedMovie = false;
      }
    }
   }

  Future<void> getPopularMovies() async {
    emit(ShowLoading());
    final response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/popular?api_key=aac616a950f2f250237046cced9b04b1&language=en-US&page=1"));

    if (response.statusCode == 200) {
      emit(GetPopularMoviesSuccess());
      PopularModel popularModel =
          PopularModel.fromJson(jsonDecode(response.body));
      popularResults = popularModel.results ?? [];
    } else {
      emit(GetPopularMovieFailure(errorMessage: 'Failed to load data'));

      throw Exception('Failed to load album');
    }                                                     //4
  }

  Future<void> getNewReleasesMovies() async {
    emit(ShowLoading());

    final response = await http.get(Uri.parse("${Const.BASE_URL}upcoming?api_key=${Const.API_KEY}"));

    if (response.statusCode == 200) {
      emit(GetNewReleasesMoviesSuccess());

      ReleaseModel releaseModel =
          ReleaseModel.fromJson(jsonDecode(response.body));
      releaseMoviesResult = releaseModel.results ?? [];
    } else {
      emit(GetNewReleasesMoviesFailure(errorMessage: 'Failed to load data'));

      throw Exception('Failed to load album');
    }
  }

  Future<void> getRecomendedMovies() async {
    emit(ShowLoading());
    final response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/top_rated?api_key=aac616a950f2f250237046cced9b04b1&language=en-US"));

    if (response.statusCode == 200) {
      emit(GetNewReleasesMoviesSuccess());

      RecomendModel recomendModel =
          RecomendModel.fromJson(jsonDecode(response.body));
      recommendedMoviesResult = recomendModel.results ?? [];
    } else {
      emit(GetNewReleasesMoviesFailure(errorMessage: 'Failed to load data'));

      throw Exception('Failed to load album');
    }
  }

  Future<void> searchMethod(String searchText) async {
    emit(ShowLoading());
    final response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/search/movie?include_adult=false&language=en-US&page=1'&query=$searchText&api_key=aac616a950f2f250237046cced9b04b1"));

    if (response.statusCode == 200) {

      emit(SearchFunctionSuccess());
      SearchModel searchModel = SearchModel.fromJson(jsonDecode(response.body));
      searchDataList = searchModel.results ?? [];

    } else {
      emit(SearchFunctionFailure(errorMessage: 'Failed to load data'));
      throw Exception('Failed to load data');
    }
  }


  Future<void> getCategoriesList() async {
    emit(ShowLoading());
    final response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/genre/movie/list?language=en&api_key=aac616a950f2f250237046cced9b04b1"));

    if (response.statusCode == 200) {

      emit(GetCategoriesListSuccess());
      CategoryModel categoryModel = CategoryModel.fromJson(jsonDecode(response.body));
      categoriesList = categoryModel.genres??[];

    } else {
      emit(GetCategoriesListFailure(errorMessage: 'Failed to load data'));
      throw Exception('Failed to load data');
    }
  }

  saveMovyItem({required Results movie ,required int index,required List saveList,
    required String savedIndexBoxName,required String savedIndexBoxKey}) async {
    try {
      var moviesBox = Hive.box<Results>(Const.SAVED_MOVIES_BOX);
      var saveIndexBox = Hive.box(savedIndexBoxName);

      saveList.add(index);
      await saveIndexBox.put(savedIndexBoxKey, saveList);

      await moviesBox.add((movie) );
      savedMoviesList.clear();
      savedMoviesList =  moviesBox.values.toList();

      emit(SaveMovyItemStateSuccess());

    } catch (ex) {
      emit(SaveMovyItemStateFailure(errorMessage: ex.toString()));
    }
  }

  fetchaAllMovies() {
    var moviesBox = Hive.box<Results>(Const.SAVED_MOVIES_BOX);
    var saveReleasesIndexBox = Hive.box(Const.SAVED_RELEAS_INDEX_BOX);
    var saveRecommendedIndexBox = Hive.box(Const.SAVED_RECOMMENDED_INDEX_BOX);
    var savePopularIndexBox = Hive.box(Const.SAVED_POPULAR_INDEX_BOX);
    savedMoviesList.clear();
    savedMoviesList =  moviesBox.values.toList();

    if(saveReleasesIndexBox.isNotEmpty){
      savedReleaseIndexList.clear();
      savedReleaseIndexList =  saveReleasesIndexBox.get(Const.SAVED_RELEAS_INDEX_BOX_KEY);
    }if(saveRecommendedIndexBox.isNotEmpty){
      savedRecommendedIndexList.clear();
      savedRecommendedIndexList =  saveRecommendedIndexBox.get(Const.SAVED_RECOMMENDED_INDEX_BOX_KEY);
    }if(savePopularIndexBox.isNotEmpty){
      savedPopularIndexList.clear();
      savedPopularIndexList =  savePopularIndexBox.get(Const.SAVED_POPULAR_INDEX_BOX_KEY);
    }


    emit(FetchMoviesSuccess());


  }
  deleteSavedMovyItem({required int savedMoviesIndex, required int index,required List saveList,
    required String savedIndexBoxName,required String savedIndexBoxKey }) async{
    var moviesBox = Hive.box<Results>(Const.SAVED_MOVIES_BOX);
    var saveIndexBox = Hive.box(savedIndexBoxName);

    try {
     await moviesBox.deleteAt(savedMoviesIndex);
      savedMoviesList.clear();
      savedMoviesList =  moviesBox.values.toList();
     saveList.remove(index);
     await saveIndexBox.put(savedIndexBoxKey, saveList);



      emit(DeleteMoviesSuccess());
    }catch(e){

      emit(DeleteMoviesFailure());

    }

  }

}
