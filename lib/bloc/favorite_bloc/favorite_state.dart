part of 'favorite_bloc.dart';


abstract class FavoriteState  {
}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<FoodParams> favorites;

  FavoriteLoaded(this.favorites);

}
