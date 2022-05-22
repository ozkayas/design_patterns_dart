//#region PIZZA

abstract class Pizza {
  abstract String name;

  @override
  String toString() {
    return name;
  }

  void bake() => print('Baking now...');
  void cut() => print('Cutting into slices ...');
  void box() => print('Place pizza in a box ...');
}

class NYStyleCheesePizza extends Pizza {
  @override
  String name = 'NY Style Cheese Pizza';
}

class NYStylePepperoniPizza extends Pizza {
  @override
  String name = 'NY Style Pepperoni Pizza';
}

class NYStyleClamPizza extends Pizza {
  @override
  String name = 'NY Style Clam Pizza';
}

class NYStyleVeggiePizza extends Pizza {
  @override
  String name = 'NY Style Veggie Pizza';
}

class ChicagoStyleCheesePizza extends Pizza {
  @override
  String name = 'Chicago Style Cheese Pizza';
}

class ChicagoStylePepperoniPizza extends Pizza {
  @override
  String name = 'Chicago Style Pepperoni Pizza';
}

class ChicagoStyleClamPizza extends Pizza {
  @override
  String name = 'Chicago Style Clam Pizza';
}

class ChicagoStyleVeggiePizza extends Pizza {
  @override
  String name = 'Chicago Style Veggie Pizza';
}
//#endregion

//#region PIZZA STORE
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

class NYStylePizzaStore extends PizzaStore {
  @override
  Pizza createPizza(String type) {
    switch (type) {
      case 'cheese':
        pizza = NYStyleCheesePizza();
        break;
      case 'pepperoni':
        pizza = NYStylePepperoniPizza();
        break;
      case 'clam':
        pizza = NYStyleClamPizza();
        break;
      case 'veggie':
        pizza = NYStyleVeggiePizza();
        break;
    }
    return pizza;
  }
}

class ChicagoStylePizzaStore extends PizzaStore {
  @override
  Pizza createPizza(String type) {
    switch (type) {
      case 'cheese':
        pizza = ChicagoStyleCheesePizza();
        break;
      case 'pepperoni':
        pizza = ChicagoStylePepperoniPizza();
        break;
      case 'clam':
        pizza = ChicagoStyleClamPizza();
        break;
      case 'veggie':
        pizza = ChicagoStyleVeggiePizza();
        break;
    }
    return pizza;
  }
}

//#endregion

void main() {
  var NYPizzaStore = NYStylePizzaStore();
  var chicagoPizzaStore = ChicagoStylePizzaStore();

  var cheesePizza = NYPizzaStore.orderPizza('cheese');
  print(cheesePizza.toString());

  var pepperoniPizza = chicagoPizzaStore.orderPizza('pepperoni');
  print(pepperoniPizza.toString());
}
