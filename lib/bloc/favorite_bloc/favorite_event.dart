part of 'favorite_bloc.dart';


abstract class FavoriteEvent  {
}

class ToggleFavorite extends FavoriteEvent {
  final FoodParams food;

  ToggleFavorite(this.food);

}

class LoadFavorites extends FavoriteEvent {}
