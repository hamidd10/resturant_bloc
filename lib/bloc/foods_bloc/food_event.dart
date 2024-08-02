part of 'food_bloc.dart';


abstract class FoodsEvent  {
}

class LoadFoods extends FoodsEvent {}

class FilterFoods extends FoodsEvent {
  final Categories category;

  FilterFoods(this.category);

}
