//#region Duck Classes
abstract class Quackable {
  void quack();
}

class MallardDuck implements Quackable {
  @override
  void quack() {
    print('quack');
  }
}

class RedHeadDuck implements Quackable {
  @override
  void quack() {
    print('quack');
  }
}

class DuckCall implements Quackable {
  @override
  void quack() {
    print('Kwak');
  }
}

class RubberDuck implements Quackable {
  @override
  void quack() {
    print('Squeak');
  }
}
//#endregion

class Goose {
  void honk() => print('Honk');
}

class GooseAdapter implements Quackable {
  final Goose _goose;

  GooseAdapter(this._goose);

  void quack() => _goose.honk();
}

void main() {
  Quackable mallardDuck = MallardDuck();
  Quackable redHeadDuck = RedHeadDuck();
  Quackable duckCall = DuckCall();
  Quackable rubberDuck = RubberDuck();
  Quackable gooseDuck = GooseAdapter(Goose());

  void simulate(Quackable duck) {
    duck.quack();
  }

  simulate(mallardDuck);
  simulate(redHeadDuck);
  simulate(duckCall);
  simulate(rubberDuck);
  simulate(gooseDuck);
}
