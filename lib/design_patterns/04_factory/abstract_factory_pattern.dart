//#region INGREDIENTS
abstract class Dough {}

abstract class Cheese {}

abstract class Sauce {}

class ThinCrustDough extends Dough {}

class VeryThinCrustDough extends Dough {}

class ThickCrustDough extends Dough {}

class MarinaraSauce extends Sauce {}

class BruschettaSauce extends Sauce {}

class PlumTomatoSauce extends Sauce {}

class Mozzarella extends Cheese {}

class GoatCheese extends Cheese {}

class ReggianoCheese extends Cheese {}
//#endregion

//#REGION PIZZA

abstract class Pizza {
  String? name = '';
  Cheese? cheese;
  Dough? dough;
  Sauce? sauce;

  // its non-sense to have such getter and setters if there is no control! and logic!
  // String get name => _name;
  // set name(String newName) => _name = newName;

  @override
  String toString() {
    return name ?? 'A delicious pizza';
  }

  void prepare();
  void bake() => print('Baking now...');
  void cut() => print('Cutting into slices ...');
  void box() => print('Place pizza in a box ...');
}

class CheesePizza extends Pizza {
  PizzaIngredientFactory ingredientFactory;

  CheesePizza({required this.ingredientFactory});

  @override
  void prepare() {
    cheese = ingredientFactory.createCheese();

    dough = ingredientFactory.createDough();

    sauce = ingredientFactory.createSauce();
  }
}

class ClamPizza extends Pizza {
  PizzaIngredientFactory ingredientFactory;

  ClamPizza({required this.ingredientFactory});

  @override
  void prepare() {
    cheese = ingredientFactory.createCheese();

    dough = ingredientFactory.createDough();

    sauce = ingredientFactory.createSauce();
  }
}

class VeggiePizza extends Pizza {
  PizzaIngredientFactory ingredientFactory;

  VeggiePizza({required this.ingredientFactory});

  @override
  void prepare() {
    cheese = ingredientFactory.createCheese();

    dough = ingredientFactory.createDough();

    sauce = ingredientFactory.createSauce();
  }
}
//#ENDREGION

//#region INGREDIENT FACTORIES
abstract class PizzaIngredientFactory {
  Dough createDough();
  Sauce createSauce();
  Cheese createCheese();
}

class NYPizzaIngredientFactory implements PizzaIngredientFactory {
  @override
  Cheese createCheese() => ReggianoCheese();

  @override
  Dough createDough() => ThinCrustDough();

  @override
  Sauce createSauce() => MarinaraSauce();
}

class ChicagoPizzaIngredientFactory implements PizzaIngredientFactory {
  @override
  Cheese createCheese() => Mozzarella();

  @override
  Dough createDough() => ThickCrustDough();

  @override
  Sauce createSauce() => PlumTomatoSauce();
}

class CaliforniaPizzaIngredientFactory implements PizzaIngredientFactory {
  @override
  Cheese createCheese() => GoatCheese();

  @override
  Dough createDough() => VeryThinCrustDough();

  @override
  Sauce createSauce() => BruschettaSauce();
}

//#endregion

abstract class PizzaStore {
  late Pizza pizza;
  Pizza orderPizza(String type) {
    pizza = createPizza(type);
    pizza.bake();
    pizza.cut();
    pizza.box();
    return pizza;
    // if (pizza != null) {
    //   return pizza!;
    // } else {
    //   throw Exception('No pizza found');
    // }
  }

  Pizza createPizza(String type);
}

class NYPizzaStore extends PizzaStore {
  @override
  Pizza createPizza(String type) {
    Pizza? pizza;
    PizzaIngredientFactory ingredientFactory = NYPizzaIngredientFactory();

    switch (type) {
      case 'cheese':
        pizza = CheesePizza(ingredientFactory: ingredientFactory);
        pizza.name = 'NY Style Cheese Pizza';
        break;
      case 'clam':
        pizza = ClamPizza(ingredientFactory: ingredientFactory);
        pizza.name = 'NY Style Clam Pizza';
        break;
      case 'veggie':
        pizza = VeggiePizza(ingredientFactory: ingredientFactory);
        pizza.name = 'NY Style Veggie Pizza';
        break;
    }
    return pizza!;
  }
}
