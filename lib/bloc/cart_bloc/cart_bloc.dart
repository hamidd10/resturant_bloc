import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../utils/params.dart';

part 'cart_event.dart';
part 'cart_state.dart';



class CartItem {
  final FoodParams foodParams;
  int quantity;

  CartItem({required this.foodParams, this.quantity = 1});
}

class CartBloc extends Bloc<CartEvent, CartState> {
  final List<CartItem> _items = [];

  CartBloc() : super(CartLoaded([])) {

    on<AddItem>((event, emit) {
      _addItem(event.food);
      emit(CartLoaded(List.from(_items)));
    });

    on<IncreaseQuantity>((event, emit) {
      _increaseQuantity(event.cartItem);
      emit(CartLoaded(List.from(_items)));
    });

    on<DecreaseQuantity>((event, emit) {
      _decreaseQuantity(event.cartItem);
      emit(CartLoaded(List.from(_items)));
    });

    on<ClearCart>((event, emit) {
      _items.clear();
      emit(CartLoaded(List.from(_items)));
    });
  }

  void _addItem(FoodParams food) {
    int index = _items.indexWhere((item) => item.foodParams.name == food.name);
    if (index >= 0) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(foodParams: food, quantity: 1));
    }
  }

  void _increaseQuantity(CartItem cartItem) {
    cartItem.quantity++;
  }

  void _decreaseQuantity(CartItem cartItem) {
    if (cartItem.quantity > 1) {
      cartItem.quantity--;
    } else {
      _items.remove(cartItem);
    }
  }
}
