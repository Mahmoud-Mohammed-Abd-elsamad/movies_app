import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../../models/recomended_model.dart';
import '../../models/results.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit() : super(MovieDetailsInitial());

  List<Results> similarMoviesList = [];
  List<int> savedSimilarMoviesList = [];

                                                          //10
  Future<void> getSimilarMovies(String id) async {
    emit(MovieDetailsShowLoading());
    final response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/$id/similar?api_key=aac616a950f2f250237046cced9b04b1"));

    if (response.statusCode == 200) {

      RecomendModel recomendModel = RecomendModel.fromJson(jsonDecode(response.body));
      similarMoviesList = recomendModel.results??[];
      emit(GetSimilarMoviesSuccess());
    } else {
      emit(GetSimilarMoviesFailure(errorMessage: 'Failed to load data'));
      throw Exception('Failed to load data');
    }
  }

}
