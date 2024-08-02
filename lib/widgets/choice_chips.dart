import 'package:flutter/material.dart';

import '../bloc/foods_bloc/food_bloc.dart';
import '../utils/params.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChoiceChips extends StatefulWidget {

  const ChoiceChips({super.key});

  @override
  State<ChoiceChips> createState() => _ChoiceChipsState();
}

class _ChoiceChipsState extends State<ChoiceChips> {

  int defaultChoiceIndex = 0;

  // categories list
  final List<String> choiceList = [
    'All',
    'Kebab',
    'Pasta',
    'Burger',
    'Doner',
    'Steak',
  ];


  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
        Wrap(
          spacing: 12,
          children: List.generate(
              choiceList.length,
              (i) => ChoiceChip(
                label: SizedBox(width: 50, child: Center(child: Text(choiceList[i]))),
                selected: defaultChoiceIndex == i,
                showCheckmark: false,
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),side: BorderSide(color: Colors.grey[100]!)),
                selectedColor: color.primary,
                pressElevation: 0,
                backgroundColor: Colors.grey[100],
                onSelected: (value) {
                  setState(() {
                    defaultChoiceIndex = value ? i : defaultChoiceIndex;
                  });
                  final categories = [
                    Categories.all,
                    Categories.kebab,
                    Categories.pasta,
                    Categories.burger,
                    Categories.doner,
                    Categories.steak,
                  ];
                  context.read<FoodsBloc>().add(FilterFoods(categories[i]));
                },
              )
            ,),
        )
      ],),
    );
  }
}
