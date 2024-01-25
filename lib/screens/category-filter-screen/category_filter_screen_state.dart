part of 'category_filter_screen_cubit.dart';

@immutable
abstract class CategoryFilterScreenState {}

class CategoryFilterScreenInitial extends CategoryFilterScreenState {}
class CategoryFilterScreenShowLoading extends CategoryFilterScreenState {}
class CategoryFilterScreenSuccess extends CategoryFilterScreenState {}
class CategoryFilterScreenFalure extends CategoryFilterScreenState {
  final String errorMessage;
  CategoryFilterScreenFalure({required this.errorMessage} );
}
