class Burger {
  final String name;
  final double price;
  final String assetName;
  final double weight;
  final String text;
  final List<Map<String, String>> ingredients;
  Burger(
    this.name,
    this.price,
    this.assetName,
    this.weight,
    this.text,
    this.ingredients,
  );
  static List<String> foodCategories = [
    "Cheese",
    "Chicken",
    "Fish",
    "Vegitarian",
  ];
  static List<String> ingredientCategories = [
    "Vegetables",
    "Meat",
    "Sauce",
    "Topping",
    "Carbohydrates",
  ];
  static List<Burger> burgers = [
    Burger(
      "King Size Burger",
      4.15,
      "assets/images/king-size-burger.jpg",
      625,
      "Egg, Mushroom, Worcestershire Sauce, Onion, Garlic, Medium Ground Beef",
      [
        {"name": "Cabbage", "assetName": "assets/images/cabbage.jpg"},
        {"name": "Cucumber", "assetName": "assets/images/cucumber.jpg"},
        {"name": "Onion", "assetName": "assets/images/onion.jpg"},
        {"name": "Tomato", "assetName": "assets/images/tomato.jpg"},
        {"name": "Bun", "assetName": "assets/images/bun.jpg"},
        {"name": "Cheddar", "assetName": "assets/images/cheddar.jpg"},
        {"name": "Beef", "assetName": "assets/images/beef.jpg"},
      ],
    ),
    Burger(
      "Cheese Burger",
      2.15,
      "assets/images/cheese-burger.jpg",
      325,
      "Egg, Mushroom, Worcestershire Sauce, Onion, Garlic, Medium Ground Beef",
      [
        {"name": "Cabbage", "assetName": "assets/images/cabbage.jpg"},
        {"name": "Cucumber", "assetName": "assets/images/cucumber.jpg"},
        {"name": "Onion", "assetName": "assets/images/onion.jpg"},
        {"name": "Tomato", "assetName": "assets/images/tomato.jpg"},
        {"name": "Bun", "assetName": "assets/images/bun.jpg"},
        {"name": "Cheddar", "assetName": "assets/images/cheddar.jpg"},
        {"name": "Beef", "assetName": "assets/images/beef.jpg"},
      ],
    ),
    Burger(
      "BBQ Burger",
      3.27,
      "assets/images/bbq-burger.jpg",
      625,
      "Egg, Mushroom, Worcestershire Sauce, Onion, Garlic, Medium Ground Beef",
      [
        {"name": "Cabbage", "assetName": "assets/images/cabbage.jpg"},
        {"name": "Cucumber", "assetName": "assets/images/cucumber.jpg"},
        {"name": "Onion", "assetName": "assets/images/onion.jpg"},
        {"name": "Tomato", "assetName": "assets/images/tomato.jpg"},
        {"name": "Bun", "assetName": "assets/images/bun.jpg"},
        {"name": "Cheddar", "assetName": "assets/images/cheddar.jpg"},
        {"name": "Beef", "assetName": "assets/images/beef.jpg"},
      ],
    ),
    Burger(
      "Beef Burger",
      3.15,
      "assets/images/beef-burger.jpg",
      625,
      "Egg, Mushroom, Worcestershire Sauce, Onion, Garlic, Medium Ground Beef",
      [
        {"name": "Cabbage", "assetName": "assets/images/cabbage.jpg"},
        {"name": "Cucumber", "assetName": "assets/images/cucumber.jpg"},
        {"name": "Onion", "assetName": "assets/images/onion.jpg"},
        {"name": "Tomato", "assetName": "assets/images/tomato.jpg"},
        {"name": "Bun", "assetName": "assets/images/bun.jpg"},
        {"name": "Cheddar", "assetName": "assets/images/cheddar.jpg"},
        {"name": "Beef", "assetName": "assets/images/beef.jpg"},
      ],
    ),
    Burger(
      "Veggie Burger",
      2.27,
      "assets/images/veggie-burger.jpg",
      625,
      "Egg, Mushroom, Worcestershire Sauce, Onion, Garlic, Medium Ground Beef",
      [
        {"name": "Cabbage", "assetName": "assets/images/cabbage.jpg"},
        {"name": "Cucumber", "assetName": "assets/images/cucumber.jpg"},
        {"name": "Onion", "assetName": "assets/images/onion.jpg"},
        {"name": "Tomato", "assetName": "assets/images/tomato.jpg"},
        {"name": "Bun", "assetName": "assets/images/bun.jpg"},
        {"name": "Cheddar", "assetName": "assets/images/cheddar.jpg"},
        {"name": "Beef", "assetName": "assets/images/beef.jpg"},
      ],
    ),
  ];
}
