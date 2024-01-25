part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class ShowLoading extends HomeState {}

class GetPopularMoviesSuccess extends HomeState {}

class GetPopularMovieFailure extends HomeState {
  final String errorMessage;

  GetPopularMovieFailure({required this.errorMessage});
}

class GetNewReleasesMoviesSuccess extends HomeState {}                    //5

class GetNewReleasesMoviesFailure extends HomeState {
  final String errorMessage;

  GetNewReleasesMoviesFailure({required this.errorMessage});
}

class GetRecommendedMoviesSuccess extends HomeState {}

class GetRecommendedMoviesFailure extends HomeState {
 final String errorMessage;

  GetRecommendedMoviesFailure({required this.errorMessage});
}

class NewStateww extends HomeState {}

class SearchFunctionSuccess extends HomeState {}

class SearchFunctionFailure extends HomeState {
  final String errorMessage;

  SearchFunctionFailure({required this.errorMessage});
}

class GetCategoriesListSuccess extends HomeState {}

class GetCategoriesListFailure extends HomeState {
  final String errorMessage;

  GetCategoriesListFailure({required this.errorMessage});
}

class SaveMovyItemStateSuccess extends HomeState {}

class SaveMovyItemStateFailure extends HomeState {

  final String errorMessage;

  SaveMovyItemStateFailure({required this.errorMessage});
}
class FetchMoviesSuccess extends HomeState {}

class DeleteMoviesSuccess extends HomeState {}

class DeleteMoviesFailure extends HomeState {}


