part of 'food_bloc.dart';


abstract class FoodsState  {
}

class FoodsInitial extends FoodsState {
  // food items
  final List<FoodParams> foodList =[
    FoodParams(
      name: 'Kebedeh Kebab',
      category: Categories.kebab,
      icon: 'kebab1',
      price: '250',
      rating: '7/10',
      description: 'Its a traditional kebab made of onion, garlic and meat combination become very delicious.',
    ),

    FoodParams(
      name: 'Kebab',
      category: Categories.kebab,
      icon: 'kebab2',
      price: '400',
      rating: '8.5/10',
      description: 'Its the most delicious kebab made of beef and it serve with onion and tomato',
    ),

    FoodParams(
      name: 'Liver Kebab',
      category: Categories.kebab,
      icon: 'kebab3',
      price: '180',
      rating: '6/10',
      description: 'This kebab is made from sheep liver and its amazing, you must try it.',
    ),

    FoodParams(
      name: 'Cheese Pasta',
      category: Categories.pasta,
      icon: 'pasta1',
      price: '130',
      rating: '4/10',
      description: 'Its a raw pasta the serve with tomato sauce and cheese, its the best combination of pasta and cheese.',
    ),

    FoodParams(
      name: 'Spicy Pasta',
      category: Categories.pasta,
      icon: 'pasta2',
      price: '200',
      rating: '5/10',
      description: 'Its a spicy pasta that serve with meat it is very spicy.',
    ),

    FoodParams(
      name: 'Vegan Pasta',
      category: Categories.pasta,
      icon: 'pasta3',
      price: '120',
      rating: '3/10',
      description: 'This pasta is for vegan people, it serve with sauce and cheese',
    ),

    FoodParams(
      name: 'Cheese Burger',
      category: Categories.burger,
      icon: 'burger1',
      price: '300',
      rating: '9/10',
      description: 'Our best item in this restaurant, this cheese burger is amazing.',
    ),

    FoodParams(
      name: 'HamBurger',
      category: Categories.burger,
      icon: 'burger2',
      price: '350',
      rating: '8/10',
      description: 'Its a combination of meat and mostly vegetable good for vegan people',
    ),

    FoodParams(
      name: 'T-bone Steak',
      category: Categories.steak,
      icon: 'steak1',
      price: '1900',
      rating: '8/10',
      description: 'This is a 3kg T-bone meat with it has a delicious sauce.',
    ),

    FoodParams(
      name: 'Fried Steak',
      category: Categories.steak,
      icon: 'steak2',
      price: '1200',
      rating: '7/10',
      description: 'This is fired Beef meat with delicious material.',
    ),

    FoodParams(
      name: 'Barbeque Steak',
      category: Categories.steak,
      icon: 'steak3',
      price: '1500',
      rating: '8/10',
      description: 'This Steak take 3 hours to cook its so delicious',
    ),

    FoodParams(
      name: 'Turkish Doner',
      category: Categories.doner,
      icon: 'doner',
      price: '300',
      rating: '6/10',
      description: 'Its a turkish Doner with two different meat chicken and beef',
    ),
  ];
}

class FoodsLoaded extends FoodsState {
  final List<FoodParams> foods;
  final List<FoodParams> bestFoodsList =[

    FoodParams(
      name: 'Kebab',
      category: Categories.kebab,
      icon: 'kebab2',
      price: '400',
      rating: '8.5/10',
      description: 'Its the most delicious kebab made of beef and it serve with onion and tomato',
    ),

    FoodParams(
      name: 'Cheese Pasta',
      category: Categories.pasta,
      icon: 'pasta1',
      price: '130',
      rating: '4/10',
      description: 'Its a raw pasta the serve with tomato sauce and cheese, its the best combination of pasta and cheese.',
    ),


    FoodParams(
      name: 'Vegan Pasta',
      category: Categories.pasta,
      icon: 'pasta3',
      price: '120',
      rating: '3/10',
      description: 'This pasta is for vegan people, it serve with sauce and cheese',
    ),

    FoodParams(
      name: 'HamBurger',
      category: Categories.burger,
      icon: 'burger2',
      price: '350',
      rating: '8/10',
      description: 'Its a combination of meat and mostly vegetable good for vegan people',
    ),

    FoodParams(
      name: 'T-bone Steak',
      category: Categories.steak,
      icon: 'steak1',
      price: '1900',
      rating: '8/10',
      description: 'This is a 3kg T-bone meat with it has a delicious sauce.',
    ),

    FoodParams(
      name: 'Turkish Doner',
      category: Categories.doner,
      icon: 'doner',
      price: '300',
      rating: '6/10',
      description: 'Its a turkish Doner with two different meat chicken and beef',
    ),
  ];

  FoodsLoaded(this.foods);

}


class FilteredFoodsLoaded extends FoodsState {
  final List<FoodParams> filteredFoods;

  FilteredFoodsLoaded(this.filteredFoods);

}
