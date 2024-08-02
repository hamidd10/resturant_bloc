part of 'cart_bloc.dart';




abstract class CartState {
}

class CartLoaded extends CartState {
  final List<CartItem> items;

  CartLoaded(this.items);

}
