// ignore_for_file: non_constant_identifier_names

class GumballMachine {
  //States
  static final int SOLD_OUT = 0;
  static final int NO_QUARTER = 1;
  static final int HAS_QUARTER = 2;
  static final int SOLD = 3;

  int state = SOLD_OUT;
  int count = 0;

  //Constructor
  GumballMachine(this.count) {
    if (count > 0) {
      state = NO_QUARTER;
    }
  }

  //Methods
  void insertQuarter() {
    if (state == HAS_QUARTER) {
      print('Quarter returned');
    } else if (state == NO_QUARTER) {
      state = HAS_QUARTER;
      print('You inserted a quarted');
    } else if (state == SOLD_OUT) {
      print('You can not insert another quarter, the machine is sold out');
    } else if (state == SOLD) {
      print('Please wait we are already giving you a gumball');
    }
  }

  void ejectQuarter() {
    if (state == HAS_QUARTER) {
      print('Quarter returned');
      state = NO_QUARTER;
    } else if (state == NO_QUARTER) {
      print('You have not inserted a quarter');
    } else if (state == SOLD) {
      print('Sorry, you alreay turned the crank');
    } else if (state == SOLD_OUT) {
      print('You cannot eject, you have not inserted a quarter yet');
    }
  }

  void turnCrank() {
    if (state == SOLD) {
      print('Turning twice does not get you another gumball!!');
    } else if (state == NO_QUARTER) {
      print('You turned but there is no quarter');
    } else if (state == SOLD_OUT) {
      print('You turned but there are no gumballs');
    } else if (state == HAS_QUARTER) {
      print('You turned...');
      state = SOLD;
      dispense();
    }
  }

  void dispense() {
    if (state == SOLD) {
      print('A gumball comes rolling out the slot');
      count--;
      if (count == 0) {
        state = SOLD_OUT;
        print('Oops, out of gumballs');
      } else {
        state = NO_QUARTER;
      }
    } else if (state == NO_QUARTER) {
      print('You need to pay first');
    } else if (state == SOLD_OUT) {
      print('No gumball dispensed');
    } else if (state == HAS_QUARTER) {
      print('You need to turn the crank');
    }
  }

  @override
  String toString() {
    String info = 'Unknown';
    if (state == NO_QUARTER) {
      info = 'NO_QUARTER';
    } else if (state == SOLD_OUT) {
      info = 'SOLD_OUT';
    } else if (state == SOLD) {
      info = 'SOLD';
    } else if (state == HAS_QUARTER) {
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
