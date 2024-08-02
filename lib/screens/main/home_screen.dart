import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:restaurant_app_bloc_design_pattern/bloc/user_bloc/user_cubit.dart';

import '../../widgets/choice_chips.dart';
import '../../widgets/food_items.dart';
import '../../widgets/search_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // greeting
                Text('Welcome, ${context.read<UserCubit>().state}',style: textTheme.headlineSmall,),
                const Gap(8),
                Text('What do you want to eat today',style: textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold)),

                // search text field
                const Gap(16),
                const SearchField(),

                // categories
                const Gap(16),
                Text('Available for you',style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),),

                // Choice chip
                const Gap(16),
                ChoiceChips(),

                // food items
                const Gap(16),
                const FoodItems(),

                // best food of the week
                const Gap(16),
                Text('Best foods of the day',style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),),
                const Gap(16),
                const BestFoodItems(),
                const Gap(16),
            ],),
          ),
      ),
    );
  }
}
