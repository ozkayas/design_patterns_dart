/// ######## Implementation on Page 213 ##########

//#region Receiver Classes
class Light {
  Light({required this.name});
  String name;

  void on() => print("$name Ligths ON");
  void off() => print('$name Lights OFF');
}

class CeilingFan {
  CeilingFan({required this.name});
  String name;
  void on() => print("$name Ligths ON");
  void off() => print('$name Lights OFF');
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

class CeilingFanOnCommand extends Command {
  CeilingFan fan;
  CeilingFanOnCommand(this.fan);

  @override
  void execute() => fan.on();
}

class CeilingFanOffCommand extends Command {
  CeilingFan fan;
  CeilingFanOffCommand(this.fan);

  @override
  void execute() => fan.off();
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

  void setCommand(
      {required int slot, Command? onCommand, Command? offCommand}) {
    if (onCommand != null) onCommands[slot] = onCommand;
    if (offCommand != null) offCommands[slot] = offCommand;
  }

  void pressOnButton(int slot) {
    onCommands[slot].execute();
  }

  void pressOffButton(int slot) {
    offCommands[slot].execute();
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
  RemoteControl remoteControl = RemoteControl();

  Light livingRoomLight = Light(name: 'Living Room');
  Light kitchenLight = Light(name: 'Kitchen');
  CeilingFan fan = CeilingFan(name: 'Room');
  Stereo stereo = Stereo();
  GarageDoor garageDoor = GarageDoor();

  remoteControl.setCommand(
      slot: 0,
      onCommand: LivingRoomLightOnCommand(livingRoomLight),
      offCommand: LivingRoomLightOffCommand(livingRoomLight));
  remoteControl.setCommand(
      slot: 1,
      onCommand: KitchenLightOnCommand(kitchenLight),
      offCommand: KitchenLightOffCommand(kitchenLight));
  remoteControl.setCommand(
      slot: 2,
      onCommand: CeilingFanOnCommand(fan),
      offCommand: CeilingFanOffCommand(fan));
  remoteControl.setCommand(
      slot: 3,
      onCommand: StereoOnCommand(stereo),
      offCommand: StereoOffCommand(stereo));

  print(remoteControl.toString());

  remoteControl.pressOnButton(0);
  remoteControl.pressOnButton(1);
  remoteControl.pressOffButton(0);
  remoteControl.pressOffButton(1);
  remoteControl.pressOffButton(5);
}
