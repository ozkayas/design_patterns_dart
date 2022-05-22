// Now we modify the update method, so observers only get what values they need, not all the state

// Interface for Subject (observable)
abstract class ISubject {
  void registerObserver(IObserver o);
  void removeObserver(IObserver o);
  void notifyObservers();
}

// Interface for Observer
abstract class IObserver {
  void update();
}

// Interface for Display
abstract class IDisplay {
  void display();
}

/////////////////////////////////////
// Weather Data

class WeatherData implements ISubject {
  double? _temperature;
  double? _humidity;
  double? _pressure;
  List<IObserver> observers = [];

  @override
  void notifyObservers() => observers.forEach((observer) => observer.update());

  @override
  void registerObserver(IObserver o) {
    observers.add(o);
  }

  @override
  void removeObserver(IObserver o) {
    observers.remove(o);
  }

  get getTemperature => _temperature;
  get getHumidity => _humidity;
  get getPressure => _pressure;

  measurementsChanged() {
    notifyObservers();
  }

  setMeasurements(
      {required double? temperature,
      required double? humidity,
      required double? pressure}) {
    _temperature = temperature;
    _humidity = humidity;
    _pressure = pressure;

    measurementsChanged();
  }
}

/// Display implementations
///
class CurrentConditionDisplay implements IObserver, IDisplay {
  double? _temperature;
  double? _humidity;

  final WeatherData _weatherData;

  CurrentConditionDisplay({required WeatherData weatherData})
      : _weatherData = weatherData {
    _weatherData.registerObserver(this);
  }

  @override
  void display() {
    print(" ======>>>>>  TEMPERATURE: $_temperature, HUMIDITY: $_humidity");
  }

  @override
  void update() {
    _temperature = _weatherData.getTemperature;
    _humidity = _weatherData.getHumidity;

    display();
  }
}

class ForecastDisplay implements IObserver, IDisplay {
  double _currentPressure = 29;
  double? _lastPressure;
  final WeatherData _weatherData;

  ForecastDisplay({required WeatherData weatherData})
      : _weatherData = weatherData {
    _weatherData.registerObserver(this);
  }

  @override
  void display() {
    print(
        " ======>>>>>  LAST PRESSURE: $_lastPressure, CURRENT PRESSURE: $_currentPressure");
  }

  @override
  void update() {
    _lastPressure = _currentPressure;
    _currentPressure = _weatherData.getPressure;
    display();
  }
}

void main() async {
  WeatherData weatherData = WeatherData();

  var currentDisplay = CurrentConditionDisplay(weatherData: weatherData);
  var forecastDisplay = ForecastDisplay(weatherData: weatherData);

  weatherData.setMeasurements(temperature: 32, humidity: 80, pressure: 100);
  await Future.delayed(Duration(seconds: 2));
  weatherData.setMeasurements(temperature: 42, humidity: 70, pressure: 200);
  await Future.delayed(Duration(seconds: 2));
  weatherData.setMeasurements(temperature: 45, humidity: 50, pressure: 300);
}
