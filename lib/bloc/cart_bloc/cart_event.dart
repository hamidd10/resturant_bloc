part of 'cart_bloc.dart';



abstract class CartEvent {
}

class AddItem extends CartEvent {
  final FoodParams food;

  AddItem(this.food);

}

class IncreaseQuantity extends CartEvent {
  final CartItem cartItem;

  IncreaseQuantity(this.cartItem);

}

class DecreaseQuantity extends CartEvent {
  final CartItem cartItem;

  DecreaseQuantity(this.cartItem);

}

class ClearCart extends CartEvent {}

