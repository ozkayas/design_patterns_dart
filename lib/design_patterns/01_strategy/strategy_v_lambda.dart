/// Here I am refactoring code and use lambda, anonymous functions

// ignore_for_file: prefer_function_declarations_over_variables

void main() {
  // var rubberDuck = RubberDuck();
  // rubberDuck.performFly();
  // rubberDuck.performQuack();

  // var decoyDuck = DecoyDuck();
  // decoyDuck.performQuack();

  Duck mallardDuck = MallardDuck();
  mallardDuck.performFly();
  mallardDuck.performQuack();

  // mallardDuck.flyBehavior = FlyNoWay();
  mallardDuck.setflyBehavior(noFly);
  mallardDuck.performFly();
}

/// Abstract parent Duck class
abstract class Duck {
  FlyBehavior _flyBehavior;
  QuackBehavior _quackBehavior;

  Duck({required FlyBehavior flyBehavior, required QuackBehavior quackBehavior})
      : _flyBehavior = flyBehavior,
        _quackBehavior = quackBehavior;

  // set flyBehavior(newBehaviour) => _flyBehavior = newBehaviour;

  void setflyBehavior(newBehaviour) => _flyBehavior = newBehaviour;

  set quackBehavior(newBehaviour) => _quackBehavior = newBehaviour;

  void performFly() => _flyBehavior();
  void performQuack() => _quackBehavior();
  void swim() => print('All ducks float, even decoys');
  void display() {}
}

/* /// Behaviour Classes
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
} */

typedef FlyBehavior = void Function();
typedef QuackBehavior = void Function();

FlyBehavior rocketFly = () => print('I am a rocket');
FlyBehavior noFly = () => print('I can not fly');
var someOtherFly = (int x) => print('Hacker Fly');

QuackBehavior quack = () => print('I quack');

// void rocketFly(Object? object) => print('I am a rocket');

// class Quack implements QuackBehavior {
//   @override
//   quack() => print("I quack");
// }

// class Squeak implements QuackBehavior {
//   @override
//   quack() => print("I squeak");
// }

// class MuteQuack implements QuackBehavior {
//   @override
//   quack() => print("<< Silence >>");
// }

/// Sub-Classses to create concrete ducks

class MallardDuck extends Duck {
  MallardDuck() : super(flyBehavior: rocketFly, quackBehavior: quack);

  @override
  display() {
    print('I am a Mallard Duck');
  }
}

// class RedHeadDuck extends Duck {
//   RedHeadDuck() : super(flyBehavior: FlyWithWings(), quackBehavior: Quack());

//   @override
//   display() {
//     print('I am a Red Head Duck');
//   }
// }

// class RubberDuck extends Duck {
//   RubberDuck() : super(flyBehavior: FlyNoWay(), quackBehavior: Squeak());

//   @override
//   display() {
//     print('I am a Rubber Duck');
//   }
// }

// class DecoyDuck extends Duck {
//   DecoyDuck() : super(flyBehavior: FlyNoWay(), quackBehavior: MuteQuack());

//   @override
//   display() {
//     print('I am a Decoy Duck');
//   }
// }
