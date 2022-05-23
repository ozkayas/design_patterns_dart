/// ######## Implementation UNDO with ceiling fan page 221 ##########

//#region Receiver Classes
class Light {
  Light({required this.name});
  String name;

  void on() => print("$name Ligths ON");
  void off() => print('$name Lights OFF');
}

class CeilingFan {
  CeilingFan({required this.location});
  String location;

  final high = 3;
  final medium = 2;
  final low = 1;
  final off = 0;
  int speed = 0;

  void setLow() {
    speed = low;
    print("fan is on low");
  }

  void setMedium() {
    speed = medium;
    print("fan is on medium");
  }

  void setHigh() {
    speed = high;
    print("fan is on high");
  }

  void setOff() {
    speed = off;
    print("fan is off");
  }
}

class GarageDoor {
  void up() => print("Door Up");
  void down() => print('Door Down');
}

class Stereo {
  void on() => print("Stereo ON");
  void off() => print('Stereo OFF');
}

//#endregion

//#region Command
abstract class Command {
  void execute();
  void undo() {}
}

class NoCommand extends Command {
  @override
  void execute() {}
}

class LivingRoomLightOnCommand extends Command {
  Light light;
  LivingRoomLightOnCommand(this.light);

  @override
  void execute() => light.on();
}

class LivingRoomLightOffCommand extends Command {
  Light light;
  LivingRoomLightOffCommand(this.light);

  @override
  void execute() => light.off();
}

class KitchenLightOnCommand extends Command {
  Light light;
  KitchenLightOnCommand(this.light);

  @override
  void execute() => light.on();
}

class KitchenLightOffCommand extends Command {
  Light light;
  KitchenLightOffCommand(this.light);

  @override
  void execute() => light.off();
}

class CeilingFanLowCommand extends Command {
  CeilingFan fan;
  late int previousSpeed;
  CeilingFanLowCommand(this.fan);

  @override
  void execute() {
    previousSpeed = fan.speed;
    fan.setLow();
  }

  @override
  void undo() {
    switch (previousSpeed) {
      case 1:
        fan.setLow();
        break;
      case 2:
        fan.setMedium();
        break;
      case 3:
        fan.setHigh();
        break;
      case 0:
        fan.setOff();
        break;
    }
  }
}

class CeilingFanMediumCommand extends Command {
  CeilingFan fan;
  CeilingFanMediumCommand(this.fan);
  late int previousSpeed;

  @override
  void execute() {
    previousSpeed = fan.speed;
    fan.setMedium();
  }

  @override
  void undo() {
    switch (previousSpeed) {
      case 1:
        fan.setLow();
        break;
      case 2:
        fan.setMedium();
        break;
      case 3:
        fan.setHigh();
        break;
      case 0:
        fan.setOff();
        break;
    }
  }
}

class CeilingFanHighCommand extends Command {
  CeilingFan fan;
  CeilingFanHighCommand(this.fan);
  late int previousSpeed;

  @override
  void execute() {
    previousSpeed = fan.speed;
    fan.setHigh();
  }

  @override
  void undo() {
    switch (previousSpeed) {
      case 1:
        fan.setLow();
        break;
      case 2:
        fan.setMedium();
        break;
      case 3:
        fan.setHigh();
        break;
      case 0:
        fan.setOff();
        break;
    }
  }
}

class CeilingFanOffCommand extends Command {
  CeilingFan fan;
  CeilingFanOffCommand(this.fan);
  late int previousSpeed;

  @override
  void execute() {
    previousSpeed = fan.speed;
    fan.setOff();
  }

  @override
  void undo() {
    switch (previousSpeed) {
      case 1:
        fan.setLow();
        break;
      case 2:
        fan.setMedium();
        break;
      case 3:
        fan.setHigh();
        break;
      case 0:
        fan.setOff();
        break;
    }
  }
}

class StereoOnCommand extends Command {
  Stereo stereo;
  StereoOnCommand(this.stereo);

  @override
  void execute() => stereo.on();
}

class StereoOffCommand extends Command {
  Stereo stereo;
  StereoOffCommand(this.stereo);

  @override
  void execute() => stereo.off();
}

class GarageDoorUpCommand extends Command {
  GarageDoor garageDoor;
  GarageDoorUpCommand(this.garageDoor);

  @override
  void execute() => garageDoor.up();
}

class GarageDoorDownCommand extends Command {
  GarageDoor garageDoor;
  GarageDoorDownCommand(this.garageDoor);

  @override
  void execute() => garageDoor.down();
}

//#endregion

//#region Invoker Class

class RemoteControl {
  List<Command> onCommands = List.filled(7, NoCommand());
  List<Command> offCommands = List.filled(7, NoCommand());
  Command undoCommand = NoCommand();

  void setCommand(
      {required int slot, Command? onCommand, Command? offCommand}) {
    if (onCommand != null) onCommands[slot] = onCommand;
    if (offCommand != null) offCommands[slot] = offCommand;
  }

  void pressOnButton(int slot) {
    onCommands[slot].execute();
    undoCommand = onCommands[slot];
  }

  void pressOffButton(int slot) {
    offCommands[slot].execute();
    undoCommand = offCommands[slot];
  }

  void pressUndo() {
    print('... Undo Pressed ..');
    undoCommand.undo();
  }

  @override
  String toString() {
    String string = '';
    for (var i = 0; i < onCommands.length; i++) {
      string +=
          'slot $i => ON: ${onCommands[i].toString()} & OFF: ${offCommands[i].toString()} \n';
    }
    return string;
  }
}

//#endregion

void main() {
  RemoteControl remoteControlWithUndo = RemoteControl();

  // Light livingRoomLight = Light(name: 'Living Room');
  // Light kitchenLight = Light(name: 'Kitchen');
  CeilingFan fan = CeilingFan(location: 'Room');
  Stereo stereo = Stereo();
  // GarageDoor garageDoor = GarageDoor();

  remoteControlWithUndo.setCommand(
      slot: 0,
      onCommand: CeilingFanLowCommand(fan),
      offCommand: CeilingFanOffCommand(fan));
  remoteControlWithUndo.setCommand(
      slot: 1,
      onCommand: CeilingFanMediumCommand(fan),
      offCommand: CeilingFanOffCommand(fan));
  remoteControlWithUndo.setCommand(
      slot: 2,
      onCommand: CeilingFanHighCommand(fan),
      offCommand: CeilingFanOffCommand(fan));
  remoteControlWithUndo.setCommand(
      slot: 3,
      onCommand: StereoOnCommand(stereo),
      offCommand: StereoOffCommand(stereo));

  print(remoteControlWithUndo.toString());

  remoteControlWithUndo.pressOnButton(0);
  remoteControlWithUndo.pressOffButton(0);

  remoteControlWithUndo.pressOnButton(0);
  remoteControlWithUndo.pressOnButton(1);
  remoteControlWithUndo.pressUndo();

  remoteControlWithUndo.pressOnButton(1);
  remoteControlWithUndo.pressOnButton(2);
  remoteControlWithUndo.pressUndo();

  remoteControlWithUndo.pressOffButton(0);
}
