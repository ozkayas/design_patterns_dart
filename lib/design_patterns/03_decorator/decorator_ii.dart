// Add sizes to beverages, page 99: Sharpen Your Pencil

enum BeverageSize { tall, grande, venti }

abstract class Beverage {
  final String _description = 'Unknown Beverage';

  BeverageSize _size = BeverageSize.tall;
  void setSize(BeverageSize size) => _size = size;
  BeverageSize getSize() => _size;

  String getDescription() => _description;

  double cost();
}

abstract class CondimentDecorator extends Beverage {
  late Beverage beverage;
  CondimentDecorator(this.beverage);

  // @override
  // String getDescription();

}

class Espresso extends Beverage {
  @override
  String getDescription() => 'Espresso';

  @override
  double cost() => 1.99;
}

class HouseBlend extends Beverage {
  @override
  String getDescription() => 'House Blend';

  @override
  double cost() => 0.89;
}

class DarkRoast extends Beverage {
  @override
  String getDescription() => 'Dark Roast';

  @override
  double cost() => 0.99;
}

class Decaf extends Beverage {
  @override
  String getDescription() => 'Decaf';

  @override
  double cost() => 1.05;
}

class Mocha extends CondimentDecorator {
  // Beverage beverage; // no need becuase it already has beverage field from parent.
  Mocha({required Beverage beverage}) : super(beverage);

  @override
  String getDescription() => '${beverage.getDescription()}, Mocha';

  @override
  double cost() => beverage.cost() + 0.2;
}

class Soy extends CondimentDecorator {
  Soy({required Beverage beverage}) : super(beverage);

  @override
  String getDescription() => '${beverage.getDescription()}, Soy';

  @override
  double cost() {
    double cost = beverage.cost();
    if (getSize() == BeverageSize.tall) {
      cost += 0.10;
    } else if (getSize() == BeverageSize.grande) {
      cost += 0.15;
    } else {
      cost += 0.20;
    }
    return cost;
  }
}

class Whip extends CondimentDecorator {
  Whip({required Beverage beverage}) : super(beverage);

  @override
  String getDescription() => '${beverage.getDescription()}, Mocha';

  @override
  double cost() => beverage.cost() + 0.2;
}

// MAIN FUNCTION HERE:::
void main() {
  Beverage espresso = Espresso();
  Beverage soy = Soy(beverage: espresso);

  print(soy.getDescription());
  // print(mocha.cost());
  // print(Soy(beverage: mocha).getDescription());
  // print(Soy(beverage: Soy(beverage: mocha)).cost());
  // print(Soy(beverage: mocha).cost());
  print(soy.getSize());
  print(soy.cost());

  soy.setSize(BeverageSize.venti);
  print(soy.getSize());
  print(soy.cost());
}
