void main() {
  // var rubberDuck = RubberDuck();
  // rubberDuck.performFly();
  // rubberDuck.performQuack();

  // var decoyDuck = DecoyDuck();
  // decoyDuck.performQuack();

  Duck mallardDuck = MallardDuck();
  mallardDuck.performFly();
  mallardDuck.performQuack();

  mallardDuck.flyBehavior = FlyNoWay();
  mallardDuck.performFly();
}

/// Abstract parent Duck class
abstract class Duck {
  FlyBehavior flyBehavior;
  QuackBehavior quackBehavior;

  Duck({required this.flyBehavior, required this.quackBehavior});

  performFly() => flyBehavior.fly();
  performQuack() => quackBehavior.quack();
  swim() => print('All ducks float, even decoys');
  display() {}
}

/// Behaviour Classes
abstract class FlyBehavior {
  fly();
}

abstract class QuackBehavior {
  quack();
}

/// Classes for behaviour implementation
class FlyWithWings implements FlyBehavior {
  @override
  fly() => print("I am flying with wings");
}

class FlyNoWay implements FlyBehavior {
  @override
  fly() => print("I cannot fly");
}

class Quack implements QuackBehavior {
  @override
  quack() => print("I quack");
}

class Squeak implements QuackBehavior {
  @override
  quack() => print("I squeak");
}

class MuteQuack implements QuackBehavior {
  @override
  quack() => print("<< Silence >>");
}

/// Sub-Classses to create concrete ducks

class MallardDuck extends Duck {
  MallardDuck() : super(flyBehavior: FlyWithWings(), quackBehavior: Quack());

  @override
  display() {
    print('I am a Mallard Duck');
  }
}

class RedHeadDuck extends Duck {
  RedHeadDuck() : super(flyBehavior: FlyWithWings(), quackBehavior: Quack());

  @override
  display() {
    print('I am a Red Head Duck');
  }
}

class RubberDuck extends Duck {
  RubberDuck() : super(flyBehavior: FlyNoWay(), quackBehavior: Squeak());

  @override
  display() {
    print('I am a Rubber Duck');
  }
}

class DecoyDuck extends Duck {
  DecoyDuck() : super(flyBehavior: FlyNoWay(), quackBehavior: MuteQuack());

  @override
  display() {
    print('I am a Decoy Duck');
  }
}
