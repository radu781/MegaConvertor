import 'converter/currency.dart';

class TemperatureUnitConverter {
  final double _valueInCelsius;

  TemperatureUnitConverter.fromCelsius(double value) : _valueInCelsius = value;

  TemperatureUnitConverter.fromFahrenheit(double value)
      : _valueInCelsius = (value - 32) * 5 / 9;

  TemperatureUnitConverter.fromKelvin(double value)
      : _valueInCelsius = value - 273.15;

  double toCelsius() {
    return _valueInCelsius;
  }

  double toFahrenheit() {
    return (_valueInCelsius * 9 / 5) + 32;
  }

  double toKelvin() {
    return _valueInCelsius + 273.15;
  }
}

enum TemperatureUnit {
  celsius,
  fahrenheit,
  kelvin,
}

class DistanceUnitConverter {
  final double _valueInMeters;

  DistanceUnitConverter.fromMeters(double value) : _valueInMeters = value;

  DistanceUnitConverter.fromKilometers(double value)
      : _valueInMeters = value * 1000;

  DistanceUnitConverter.fromFeet(double value)
      : _valueInMeters = value * 3.28084;

  DistanceUnitConverter.fromMiles(double value)
      : _valueInMeters = value * 1609.344;

  double toMeters() {
    return _valueInMeters;
  }

  double toKilometers() {
    return _valueInMeters / 1000;
  }

  double toFeet() {
    return _valueInMeters * 0.03048;
  }

  double toMiles() {
    return _valueInMeters * 0.000621371;
  }
}

enum DistanceUnit { meter, kilometer, foot, mile }

class WeightUnitConverter {
  final double _valueInGrams;

  WeightUnitConverter.fromGrams(double value) : _valueInGrams = value;

  WeightUnitConverter.fromKilograms(double value)
      : _valueInGrams = value * 1000;

  WeightUnitConverter.fromPounds(double value)
      : _valueInGrams = value * 453.592;

  WeightUnitConverter.fromOunces(double value)
      : _valueInGrams = value * 28.3495;

  double toGrams() {
    return _valueInGrams;
  }

  double toKilograms() {
    return _valueInGrams / 1000;
  }

  double toPounds() {
    return _valueInGrams * 0.00220462;
  }

  double toOunces() {
    return _valueInGrams * 0.035274;
  }
}

enum WeightUnit { gram, kilogram, pound, ounce }

class PressureUnitConverter {
  final double _valueInPascals;

  PressureUnitConverter.fromPascals(double value) : _valueInPascals = value;

  PressureUnitConverter.fromBars(double value) : _valueInPascals = value * 100000;

  PressureUnitConverter.fromAtmospheres(double value) : _valueInPascals = value * 101325;

  PressureUnitConverter.fromPsi(double value) : _valueInPascals = value * 6894.76;

  double toPascals() {
    return _valueInPascals;
  }

  double toBars() {
    return _valueInPascals / 100000;
  }

  double toAtmospheres() {
    return _valueInPascals / 101325;
  }

  double toPsi() {
    return _valueInPascals / 6894.76;
  }
}

enum PressureUnit { pascal, bar, atmosphere, psi }

class CurrencyUnitConverter {
  double _valueInUsd = 0;
  final CurrencyConverter _converter = CurrencyConverter()..readFromFile();

  CurrencyUnitConverter.fromUsd(double value) : _valueInUsd = value;

  CurrencyUnitConverter.fromEur(double value) {
    _valueInUsd = _converter.convertCurrency(value, "EUR", "USD");
  }

  CurrencyUnitConverter.fromRon(double value) {
    _valueInUsd = _converter.convertCurrency(value, "RON", "USD");
  }

  double toUsd() {
      return _valueInUsd;
  }

  double toEur() {
      return _converter.convertCurrency(_valueInUsd, "USD", "EUR");
  }

  double toRon() {
      return _converter.convertCurrency(_valueInUsd, "USD", "RON");
  }
}

enum CurrencyUnit { usd, eur, ron }

