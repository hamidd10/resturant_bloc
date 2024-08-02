enum Categories {
  all,
  pasta,
  kebab,
  doner,
  burger,
  steak,
}

class FoodParams {
  Categories category;
  final String icon;
  final String name;
  final String price;
  final String rating;
  final String description;

  FoodParams({
    required this.name,
    required this.category,
    required this.icon,
    required this.price,
    required this.rating,
    required this.description,
  });
}

class CartItem {
  final FoodParams foodParams;
  int quantity;

  CartItem({required this.foodParams, this.quantity = 1});
}