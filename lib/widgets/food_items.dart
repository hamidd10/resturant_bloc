import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../bloc/foods_bloc/food_bloc.dart';
import '../screens/main/food_details_screen.dart';
import '../utils/params.dart';

class FoodItems extends StatelessWidget {
  const FoodItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodsBloc, FoodsState>(
      builder: (context, state) {
        if (state is FoodsLoaded || state is FilteredFoodsLoaded) {
          final foodsList = state is FoodsLoaded ? state.foods : (state as FilteredFoodsLoaded).filteredFoods;
          return SizedBox(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) => _footItem(context, foodsList[i]),
              itemCount: foodsList.length,
            ),
          );
        }
        if(state is FoodsInitial){
          final foodsList = state.foodList;
          return SizedBox(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) => _footItem(context, foodsList[i]),
              itemCount: foodsList.length,
            ),
          );
        }
        return Container();
      },
    );
  }
}

class BestFoodItems extends StatelessWidget {
  const BestFoodItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodsBloc, FoodsState>(
      builder: (context, state) {
          final bestFoodsList = context.read<FoodsBloc>().bestFoodsList;
          return SizedBox(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) => _footItem(context, bestFoodsList[i]),
              itemCount: bestFoodsList.length,
            ),
          );
      },
    );
  }
}

Widget _footItem(BuildContext context, FoodParams foodParams) {
  final color = Theme.of(context).colorScheme;
  return GestureDetector(
    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetailsScreen(foodParams: foodParams),)),
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 34),
      margin: const EdgeInsets.only(right: 44),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          // image
          Container(
            width: 150,
            height: 90,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset('assets/images/${foodParams.icon}.jpg', fit: BoxFit.cover),
            ),
          ),
          // price
          const Gap(12),
          Text('${foodParams.price} AFN', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: color.primary)),
          // name
          const Gap(8),
          Text(foodParams.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    ),
  );
}
