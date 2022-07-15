// Implementing abstrack factory pattern page 502

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

//#region Abstract Factory Pattern
abstract class AbstractDuckFactory {
  Quackable createMallardDuck();
  Quackable createRedHeadDuck();
  Quackable createDuckCall();
  Quackable createRubberDuck();
}

class DuckFactory implements AbstractDuckFactory {
  @override
  Quackable createMallardDuck() => MallardDuck();

  @override
  Quackable createRedHeadDuck() => RedHeadDuck();

  @override
  Quackable createDuckCall() => DuckCall();

  @override
  Quackable createRubberDuck() => RubberDuck();
}

class CountingDuckFactory implements AbstractDuckFactory {
  @override
  Quackable createMallardDuck() => QuackCounter(MallardDuck());

  @override
  Quackable createRedHeadDuck() => QuackCounter(RedHeadDuck());

  @override
  Quackable createDuckCall() => QuackCounter(DuckCall());

  @override
  Quackable createRubberDuck() => QuackCounter(RubberDuck());
}

//#endregion

void main() {
  final duckFactory = CountingDuckFactory();

  Quackable mallardDuck = duckFactory.createMallardDuck();
  Quackable redHeadDuck = duckFactory.createRedHeadDuck();
  Quackable duckCall = duckFactory.createDuckCall();
  Quackable rubberDuck = duckFactory.createRubberDuck();
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
