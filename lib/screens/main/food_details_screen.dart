import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/cart_bloc/cart_bloc.dart';
import '../../bloc/favorite_bloc/favorite_bloc.dart';
import '../../utils/custom_snackbar.dart';
import '../../utils/params.dart';

class FoodDetailsScreen extends StatelessWidget {
  final FoodParams foodParams;

  const FoodDetailsScreen({super.key, required this.foodParams});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(foodParams.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // images
            Image.asset('assets/images/${foodParams.icon}.jpg'),

            // price
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "${foodParams.price} AFN",
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber),
              ),
            ),

            // name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                foodParams.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            // description
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                foodParams.description,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),

      // floating buttons
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // add to cart button
          FloatingActionButton(
            heroTag: 'second',
            onPressed: () {
              context.read<CartBloc>().add(AddItem(foodParams));
              CustomSnackBar(contentText: 'Item added to the cart.', backgroundColor: Colors.amber).show(context);
            },
            child: const Icon(Icons.shopping_cart),
          ),
          const SizedBox(height: 16),

          // toggle favorite button
          BlocBuilder<FavoriteBloc, FavoriteState>(
            builder: (context, state) {
              bool isFavorite = false;
              if (state is FavoriteLoaded) {
                isFavorite = state.favorites.any((item) => item.name == foodParams.name);
              }

              return FloatingActionButton(
                heroTag: 'first',
                onPressed: () {
                  context.read<FavoriteBloc>().add(ToggleFavorite(foodParams));
                  if (isFavorite) {
                    CustomSnackBar(contentText: 'Item removed from the favorites.', backgroundColor: Colors.grey).show(context);
                  } else {
                    CustomSnackBar(contentText: 'Item added to the favorites.', backgroundColor: Colors.amber).show(context);
                  }
                },
                backgroundColor: isFavorite ? Colors.amber : Colors.grey,
                child: const Icon(Icons.favorite),
              );
            },
          ),
        ],
      ),
    );
  }
}
