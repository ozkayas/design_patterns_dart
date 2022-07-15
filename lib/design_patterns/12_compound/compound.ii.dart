// Implementing decorator page 500

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

//#region Goose Adapter
class Goose {
  void honk() => print('Honk');
}

class GooseAdapter implements Quackable {
  final Goose _goose;

  GooseAdapter(this._goose);

  void quack() => _goose.honk();
}
//#endregion

//Quackable Decorator in order to add counter behavior
class QuackCounter implements Quackable {
  final Quackable _quackable;
  static int _counter = 0;

  QuackCounter(this._quackable);

  @override
  void quack() {
    _quackable.quack();
    _counter++;
  }

  static int get counter => _counter;
}

void main() {
  Quackable mallardDuck = QuackCounter(MallardDuck());
  Quackable redHeadDuck = QuackCounter(RedHeadDuck());
  Quackable duckCall = QuackCounter(DuckCall());
  Quackable rubberDuck = QuackCounter(RubberDuck());
  Quackable gooseDuck = GooseAdapter(Goose());

  void simulate(Quackable duck) {
    duck.quack();
  }

  simulate(mallardDuck);
  simulate(redHeadDuck);
  simulate(duckCall);
  simulate(rubberDuck);
  simulate(gooseDuck);

  print('The ducks quacked ${QuackCounter.counter.toString()} times');
}
