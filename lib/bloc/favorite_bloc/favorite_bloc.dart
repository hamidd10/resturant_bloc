import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../utils/params.dart';

part 'favorite_event.dart';

part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final List<FoodParams> _favorites = [];

  FavoriteBloc() : super(FavoriteInitial()) {
    on<LoadFavorites>((event, emit) {
      emit(FavoriteLoaded(List.from(_favorites)));
    });

    on<ToggleFavorite>((event, emit) {
      _toggleFavorite(event.food);
      emit(FavoriteLoaded(List.from(_favorites)));
    });
  }

  void _toggleFavorite(FoodParams food) {
    if (_favorites.contains(food)) {
      _favorites.remove(food);
    } else {
      _favorites.add(food);
    }
  }

  bool isFavorite(FoodParams food) {
    return _favorites.contains(food);
  }
}
