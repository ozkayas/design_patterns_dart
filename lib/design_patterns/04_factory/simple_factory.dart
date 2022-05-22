//#region Pizza & Subclasses
abstract class Pizza {
  abstract String name;

  @override
  String toString() {
    return name;
  }
}

class CheesePizza extends Pizza {
  @override
  String name = 'Cheese Pizza';
}

class PepperoniPizza extends Pizza {
  @override
  String name = 'Pepperoni Pizza';
}

class ClamPizza extends Pizza {
  @override
  String name = 'Clam Pizza';
}

class VeggiePizza extends Pizza {
  @override
  String name = 'Veggie Pizza';
}
//#endregion

class SimplePizzaFactory {
  Pizza createPizza(String type) {
    late Pizza pizza;
    switch (type) {
      case 'cheese':
        pizza = CheesePizza();
        break;
      case 'pepperoni':
        pizza = PepperoniPizza();
        break;
      case 'clam':
        pizza = ClamPizza();
        break;
    }
    return pizza;
  }
}

class PizzaStore {
  SimplePizzaFactory factory;

  PizzaStore({
    required this.factory,
  });

  Pizza orderPizza(String type) {
    Pizza pizza = factory.createPizza(type);
    return pizza;
  }
}

void main() {
  var pizzaFactory = SimplePizzaFactory();
  var pizzaStore = PizzaStore(factory: pizzaFactory);

  var cheesePizza = pizzaStore.orderPizza('cheese');
  print(cheesePizza.toString());

  var pepperoniPizza = pizzaStore.orderPizza('pepperoni');
  print(pepperoniPizza.toString());
}
