import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../../models/category_filter_model.dart';
import '../../models/results.dart';

part 'category_filter_screen_state.dart';

class CategoryFilterScreenCubit extends Cubit<CategoryFilterScreenState> {
  CategoryFilterScreenCubit() : super(CategoryFilterScreenInitial());

  List<Results> listOfFilteredCategories = [];
  List<int> savedCategoryFilteredList = [];

  Future<void> getListOfFilteredmovies(String id) async {
    emit(CategoryFilterScreenShowLoading());
    try {
      final response = await http.get(Uri.parse(
          "https://api.themoviedb.org/3/discover/movie?with_genres=$id&api_key=aac616a950f2f250237046cced9b04b1"));

      if (response.statusCode == 200) {
        emit(CategoryFilterScreenSuccess());
        CategoryFilterModel categoryFilterModel =
            CategoryFilterModel.fromJson(jsonDecode(response.body));
        listOfFilteredCategories = categoryFilterModel.results ?? [];
      }
    } catch (e) {
      emit(CategoryFilterScreenFalure(errorMessage: 'Failed to load data'));
    }
  }
}
