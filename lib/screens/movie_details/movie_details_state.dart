part of 'movie_details_cubit.dart';

@immutable
abstract class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}          //11
class MovieDetailsShowLoading extends MovieDetailsState {}
class GetSimilarMoviesSuccess extends MovieDetailsState {}
class GetSimilarMoviesFailure extends MovieDetailsState {
  String errorMessage;
  GetSimilarMoviesFailure({required this.errorMessage});

}
