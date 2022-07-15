// ignore_for_file: non_constant_identifier_names

import 'dart:math';

/// This 3.rd file has a new State Winner and add getters for states.

//#region STATES
abstract class State {
  abstract GumballMachine gumballMachine;
  void insertQuarter();
  void ejectQuarter();
  void turnCrank();
  void dispense();
}

class SoldOut implements State {
  @override
  GumballMachine gumballMachine;
  SoldOut({
    required this.gumballMachine,
  });
  @override
  void dispense() {
    print('No gumball dispensed');
  }

  @override
  void ejectQuarter() {
    print('You can not eject, you have not inserted a quarter yet');
  }

  @override
  void insertQuarter() {
    print('You can not insert another quarter, the machine is sold out');
  }

  @override
  void turnCrank() {
    print('You turned but there are no gumballs');
  }
}

class NoQuarter implements State {
  @override
  GumballMachine gumballMachine;
  NoQuarter({
    required this.gumballMachine,
  });

  @override
  void dispense() {
    print('You need to pay first');
  }

  @override
  void ejectQuarter() {
    print('You have not inserted a quarter');
  }

  @override
  void insertQuarter() {
    print('You inserted a quarter');
    gumballMachine.setState(gumballMachine.hasQuarterState);
  }

  @override
  void turnCrank() {
    print('You turned but there is no quarter');
  }
}

class HasQuarter implements State {
  @override
  GumballMachine gumballMachine;
  HasQuarter({
    required this.gumballMachine,
  });

  @override
  void dispense() {
    print('You need to turn the crank');
  }

  @override
  void ejectQuarter() {
    print('Quarter returned');
    gumballMachine.setState(gumballMachine.noQuarterState);
  }

  @override
  void insertQuarter() {
    print('You can not insert another quarter');
  }

  @override
  void turnCrank() {
    //The user turned the crank, now lets check if she is a winner
    int isWinner = Random().nextInt(10);

    if (isWinner == 0) {
      gumballMachine.setState(gumballMachine.winnerState);
    } else {
      gumballMachine.setState(gumballMachine.soldState);
    }

    dispense();
  }
}

class Sold implements State {
  @override
  GumballMachine gumballMachine;
  Sold({
    required this.gumballMachine,
  });

  @override
  void dispense() {
    gumballMachine.releaseBall();

    if (gumballMachine.count > 0) {
      gumballMachine.setState(gumballMachine.noQuarterState);
    } else {
      gumballMachine.setState(gumballMachine.soldOutState);
    }
  }

  @override
  void ejectQuarter() {
    print('Sorry you already turned the crank');
  }

  @override
  void insertQuarter() {
    print('Please wait, we are already giving you a gumble');
  }

  @override
  void turnCrank() {
    print('Turning twice does not get you another gumball');
  }
}

class Winner implements State {
  @override
  GumballMachine gumballMachine;
  Winner({
    required this.gumballMachine,
  });

  @override
  void dispense() {
    gumballMachine.releaseBall();

    if (gumballMachine.count > 0) {
      gumballMachine.releaseBall();
      print('YOU ARE A WINNER, you got two gumballs for your quarter');
      if (gumballMachine.count > 0) {
        gumballMachine.setState(gumballMachine.noQuarterState);
      } else {
        gumballMachine.setState(gumballMachine.soldOutState);
      }
    } else {
      gumballMachine.setState(gumballMachine.soldOutState);
    }
  }

  @override
  void ejectQuarter() {
    print('Sorry you already turned the crank');
  }

  @override
  void insertQuarter() {
    print('Please wait, we are already giving you a gumble');
  }

  @override
  void turnCrank() {
    print('Turning twice does not get you another gumball');
  }
}

//#endregion

class GumballMachine {
  //States
  late State _soldOutState;
  late State _noQuarterState;
  late State _hasQuarterState;
  late State _soldState;
  late State _winnerState;

  //State Getters
  State get soldOutState => _soldOutState;
  State get noQuarterState => _noQuarterState;
  State get hasQuarterState => _hasQuarterState;
  State get soldState => _soldState;
  State get winnerState => _winnerState;

  late State state;
  int count = 0;

  //Constructor
  GumballMachine(this.count) {
    _soldOutState = SoldOut(gumballMachine: this);
    _soldState = Sold(gumballMachine: this);
    _noQuarterState = NoQuarter(gumballMachine: this);
    _hasQuarterState = HasQuarter(gumballMachine: this);

    if (count > 0) {
      state = _noQuarterState;
    } else {
      state = _soldOutState;
    }
  }

  void setState(State newState) {
    state = newState;
  }

  void insertQuarter() => state.insertQuarter();
  void ejectQuarter() => state.ejectQuarter();
  void turnCrank() {
    state.turnCrank();
    state.dispense();
  }

  void releaseBall() {
    print('A gumball comes rolling out the slot...');
    if (count > 0) {
      count--;
    }
  }

  @override
  String toString() {
    String info = 'Unknown';
    if (state == _noQuarterState) {
      info = 'NO_QUARTER';
    } else if (state == _soldOutState) {
      info = 'SOLD_OUT';
    } else if (state == _soldState) {
      info = 'SOLD';
    } else if (state == _hasQuarterState) {
      info = 'HAS_QUARTER';
    }

    return '===> STATE: $info, INVENTORY: $count';
  }
}

void main() {
  GumballMachine gumballMachine = GumballMachine(5);

  print(gumballMachine.toString());

  gumballMachine.insertQuarter();
  gumballMachine.turnCrank();

  print(gumballMachine.toString());

  gumballMachine.insertQuarter();
  gumballMachine.ejectQuarter();
  gumballMachine.turnCrank();

  print(gumballMachine.toString());

  gumballMachine.insertQuarter();
  gumballMachine.turnCrank();
  gumballMachine.insertQuarter();
  gumballMachine.turnCrank();
  gumballMachine.ejectQuarter();

  print(gumballMachine.toString());

  gumballMachine.insertQuarter();
  gumballMachine.insertQuarter();
  gumballMachine.turnCrank();
  gumballMachine.insertQuarter();
  gumballMachine.turnCrank();
  gumballMachine.insertQuarter();
  gumballMachine.turnCrank();

  print(gumballMachine.toString());
}
