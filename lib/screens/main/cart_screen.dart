import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app_bloc_design_pattern/utils/custom_snackbar.dart';
import '../../bloc/cart_bloc/cart_bloc.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
          return state.items.isNotEmpty
              ? Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final cartItem = state.items[index];
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: ListTile(
                        leading: Image.asset(
                          'assets/images/${cartItem.foodParams.icon}.jpg',
                          width: 50,
                          height: 50,
                        ),
                        title: Text(
                          cartItem.foodParams.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Row(
                          children: [
                            IconButton(
                              color: Colors.amber,
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                context.read<CartBloc>().add(
                                    DecreaseQuantity(cartItem));
                              },
                            ),
                            Text('${cartItem.foodParams.price} AFN x ${cartItem
                                .quantity}'),
                            IconButton(
                              color: Colors.amber,
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                context.read<CartBloc>().add(
                                    IncreaseQuantity(cartItem));
                              },
                            ),
                          ],
                        ),
                        trailing: Text(
                          '${int.parse(cartItem.foodParams.price) *
                              cartItem.quantity} AFN',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber
                  ),
                  onPressed: () {
                    context.read<CartBloc>().add(ClearCart());
                    CustomSnackBar(contentText: 'Order placed successfully!',backgroundColor: Colors.amber).show(context);
                  },
                  child: const SizedBox(
                      width: double.infinity,
                      child: Center(child: Text('ORDER',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))),
                ),
              ),
            ],
          )
              : const Center(child: Text('No item in the Cart'));
        }
        return const Center(child: Text('Something went wrong!'));
      },
    );
  }
}
