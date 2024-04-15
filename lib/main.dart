import 'package:flutter/material.dart';
import 'unit_converter.dart';
import 'category.dart';
import 'widgets/dropdown_widgets.dart';
import 'widgets/keypad.dart';
import 'converter/currency.dart';
import 'converter/logger.dart';

void main() {
  runApp(const UnitCurrencyConverterApp());
}

class UnitCurrencyConverterApp extends StatelessWidget {
  const UnitCurrencyConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MegaConvertor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ConverterHomePage(),
    );
  }
}

class ConverterHomePage extends StatefulWidget {
  const ConverterHomePage({super.key});

  @override
  _ConverterHomePageState createState() => _ConverterHomePageState();
}

class _ConverterHomePageState extends State<ConverterHomePage> {
  final TextEditingController _inputController = TextEditingController();
  String _convertedValue = '';
  Category _selectedCategory = Category.temperature;
  TemperatureUnit _selectedFromTemperatureUnit = TemperatureUnit.celsius;
  TemperatureUnit _selectedToTemperatureUnit = TemperatureUnit.fahrenheit;
  DistanceUnit _selectedFromDistanceUnit = DistanceUnit.meter;
  DistanceUnit _selectedToDistanceUnit = DistanceUnit.foot;
  WeightUnit _selectedFromWeightUnit = WeightUnit.gram;
  WeightUnit _selectedToWeightUnit = WeightUnit.kilogram;
  PressureUnit _selectedFromPressureUnit = PressureUnit.atmosphere;
  PressureUnit _selectedToPressureUnit = PressureUnit.psi;
  CurrencyUnit _selectedFromCurrencyUnit = CurrencyUnit.eur;
  CurrencyUnit _selectedToCurrencyUnit = CurrencyUnit.usd;
  bool _hasDecimalPoint = false;

  void _convertUnits() {
    double inputValue = double.tryParse(_inputController.text) ?? 0;
    double convertedValue = 0;

    switch (_selectedCategory) {
      case Category.temperature:
        TemperatureUnitConverter converter;
        switch (_selectedFromTemperatureUnit) {
          case TemperatureUnit.celsius:
            converter = TemperatureUnitConverter.fromCelsius(inputValue);
            break;
          case TemperatureUnit.fahrenheit:
            converter = TemperatureUnitConverter.fromFahrenheit(inputValue);
            break;
          case TemperatureUnit.kelvin:
            converter = TemperatureUnitConverter.fromKelvin(inputValue);
            break;
        }

        switch (_selectedToTemperatureUnit) {
          case TemperatureUnit.celsius:
            convertedValue = converter.toCelsius();
            break;
          case TemperatureUnit.fahrenheit:
            convertedValue = converter.toFahrenheit();
            break;
          case TemperatureUnit.kelvin:
            convertedValue = converter.toKelvin();
            break;
        }
        ConversionLogger().logConversion(
            "$inputValue $_selectedFromTemperatureUnit -> $convertedValue $_selectedToTemperatureUnit");
        break;

      case Category.distance:
        DistanceUnitConverter converter;
        switch (_selectedFromDistanceUnit) {
          case DistanceUnit.meter:
            converter = DistanceUnitConverter.fromMeters(inputValue);
            break;
          case DistanceUnit.kilometer:
            converter = DistanceUnitConverter.fromKilometers(inputValue);
            break;
          case DistanceUnit.foot:
            converter = DistanceUnitConverter.fromFeet(inputValue);
            break;
          case DistanceUnit.mile:
            converter = DistanceUnitConverter.fromMiles(inputValue);
            break;
        }

        switch (_selectedToDistanceUnit) {
          case DistanceUnit.meter:
            convertedValue = converter.toMeters();
            break;
          case DistanceUnit.kilometer:
            convertedValue = converter.toKilometers();
            break;
          case DistanceUnit.foot:
            convertedValue = converter.toFeet();
            break;
          case DistanceUnit.mile:
            convertedValue = converter.toMiles();
            break;
        }

        ConversionLogger().logConversion(
            "$inputValue $_selectedFromDistanceUnit -> $convertedValue $_selectedToDistanceUnit");
        break;

      case Category.currency:
        CurrencyUnitConverter converter;
        switch (_selectedFromCurrencyUnit) {
          case CurrencyUnit.usd:
            converter = CurrencyUnitConverter.fromUsd(inputValue);
            break;
          case CurrencyUnit.eur:
            converter = CurrencyUnitConverter.fromUsd(inputValue);
            break;
          case CurrencyUnit.ron:
            converter = CurrencyUnitConverter.fromRon(inputValue);
            break;
        }

        switch (_selectedToCurrencyUnit) {
          case CurrencyUnit.usd:
            convertedValue = converter.toUsd();
            break;
          case CurrencyUnit.eur:
            convertedValue = converter.toEur();
            break;
          case CurrencyUnit.ron:
            convertedValue = converter.toRon();
            break;
        }

        ConversionLogger().logConversion(
            "$inputValue $_selectedFromCurrencyUnit -> $convertedValue $_selectedToCurrencyUnit");
        break;

      case Category.weight:
        WeightUnitConverter converter;
        switch (_selectedFromWeightUnit) {
          case WeightUnit.gram:
              converter = WeightUnitConverter.fromGrams(inputValue);
              break;
          case WeightUnit.kilogram:
              converter = WeightUnitConverter.fromKilograms(inputValue);
              break;
          case WeightUnit.pound:
              converter = WeightUnitConverter.fromPounds(inputValue);
              break;
          case WeightUnit.ounce:
              converter = WeightUnitConverter.fromOunces(inputValue);
              break;
        }
        switch (_selectedToWeightUnit) {
          case WeightUnit.gram:
              convertedValue = converter.toGrams();
              break;
          case WeightUnit.kilogram:
              convertedValue = converter.toKilograms();
              break;
          case WeightUnit.pound:
              convertedValue = converter.toPounds();
              break;
          case WeightUnit.ounce:
              convertedValue = converter.toPounds();
              break;
        }
        ConversionLogger().logConversion(
            "$inputValue $_selectedFromWeightUnit -> $convertedValue $_selectedToWeightUnit");
        break;
      case Category.pressure:
        PressureUnitConverter converter;
        switch (_selectedFromPressureUnit) {
          case PressureUnit.pascal:
              converter = PressureUnitConverter.fromPascals(inputValue);
              break;
          case PressureUnit.bar:
              converter = PressureUnitConverter.fromBars(inputValue);
              break;
          case PressureUnit.atmosphere:
              converter = PressureUnitConverter.fromAtmospheres(inputValue);
              break;
          case PressureUnit.psi:
              converter = PressureUnitConverter.fromPsi(inputValue);
              break;
        }
        switch (_selectedToPressureUnit) {
          case PressureUnit.pascal:
              convertedValue = converter.toPascals();
              break;
          case PressureUnit.bar:
              convertedValue = converter.toBars();
              break;
          case PressureUnit.atmosphere:
              convertedValue = converter.toAtmospheres();
              break;
          case PressureUnit.psi:
              convertedValue = converter.toPsi();
              break;
        }
        ConversionLogger().logConversion(
            "$inputValue $_selectedFromPressureUnit -> $convertedValue $_selectedToPressureUnit");
        break;
    }

    setState(() {
      _convertedValue = convertedValue.toStringAsFixed(2);
    });
  }

  void _handleKeypadInput(String value) {
    setState(() {
      if (value == '.') {
        _hasDecimalPoint = true;
      }
      _inputController.text += value;
      _convertUnits();
    });
  }

  void _clearInput() {
    setState(() {
      _inputController.clear();
      _hasDecimalPoint = false;
      _convertedValue = '';
    });
  }

  void _deleteLastCharacter() {
    setState(() {
      if (_inputController.text.isNotEmpty) {
        if (_inputController.text.endsWith('.')) {
          _hasDecimalPoint = false;
        }
        _inputController.text = _inputController.text
            .substring(0, _inputController.text.length - 1);
        _convertUnits();
      }
    });
  }

  void _handleUnitChange(TemperatureUnit? newUnit) {
    if (newUnit != null) {
      setState(() {
        _selectedFromTemperatureUnit = newUnit;
        _convertUnits();
      });
    }
  }

  void _handleDistanceUnitChange(DistanceUnit? distance) {
    if (distance != null) {
      setState(() {
        _selectedFromDistanceUnit = distance;
        _convertUnits();
      });
    }
  }

  void _handleCurrencyUnitChange(CurrencyUnit? unit) {
    if (unit != null) {
      setState(() {
        _selectedFromCurrencyUnit = unit;
        _convertUnits();
      });
    }
  }

  void _handleWeightUnitChange(WeightUnit? unit) {
    if (unit != null) {
      setState(() {
        _selectedFromWeightUnit = unit;
        _convertUnits();
      });
    }
  }

  void _handlePressureUnitChange(PressureUnit? unit) {
    if (unit != null) {
      setState(() {
        _selectedFromPressureUnit = unit;
        _convertUnits();
      });
    }
  }

  void _handleCategoryChange(Category? newCategory) {
    if (newCategory != null) {
      setState(() {
        _selectedCategory = newCategory;
        _selectedFromTemperatureUnit = TemperatureUnit.celsius;
        _selectedToTemperatureUnit = TemperatureUnit.fahrenheit;
        _convertUnits();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget dropdownWidgetFrom;
    switch (_selectedCategory) {
      case Category.temperature:
        dropdownWidgetFrom = TemperatureUnitDropdown(
          selectedUnit: _selectedFromTemperatureUnit,
          onChanged: _handleUnitChange,
        );
        break;
      case Category.distance:
        dropdownWidgetFrom = DistanceUnitDropdown(
          selectedUnit: _selectedFromDistanceUnit,
          onChanged: _handleDistanceUnitChange,
        );
        break;
      case Category.currency:
        dropdownWidgetFrom = CurrencyUnitDropdown(
          selectedUnit: _selectedFromCurrencyUnit,
          onChanged: _handleCurrencyUnitChange,
        );
        break;
      case Category.weight:
        dropdownWidgetFrom = WeightUnitDropdown(
          selectedUnit: _selectedFromWeightUnit,
          onChanged: _handleWeightUnitChange,
        );
        break;
      case Category.pressure:
        dropdownWidgetFrom = PressureUnitDropdown(
          selectedUnit: _selectedFromPressureUnit,
          onChanged: _handlePressureUnitChange,
        );
        break;
    }

    Widget dropdownWidgetTo;
    switch (_selectedCategory) {
      case Category.temperature:
        dropdownWidgetTo = TemperatureUnitDropdown(
            selectedUnit: _selectedToTemperatureUnit,
            onChanged: (TemperatureUnit? newValue) {
              setState(() {
                _selectedToTemperatureUnit = newValue!;
                _convertUnits();
              });
            });
        break;
      case Category.distance:
        dropdownWidgetTo = DistanceUnitDropdown(
            selectedUnit: _selectedToDistanceUnit,
            onChanged: (DistanceUnit? newValue) {
              setState(() {
                _selectedToDistanceUnit = newValue!;
                _convertUnits();
              });
            });
        break;
      case Category.currency:
        dropdownWidgetTo = CurrencyUnitDropdown(
            selectedUnit: _selectedToCurrencyUnit,
            onChanged: (CurrencyUnit? newValue) {
              setState(() {
                _selectedToCurrencyUnit = newValue!;
                _convertUnits();
              });
            });
        break;
      case Category.weight:
        dropdownWidgetTo = WeightUnitDropdown(
            selectedUnit: _selectedToWeightUnit,
            onChanged: (WeightUnit? newValue) {
              setState(() {
                _selectedToWeightUnit = newValue!;
                _convertUnits();
              });
            });
        break;
      case Category.pressure:
        dropdownWidgetTo = PressureUnitDropdown(
            selectedUnit: _selectedToPressureUnit,
            onChanged: (PressureUnit? newValue) {
              setState(() {
                _selectedToPressureUnit = newValue!;
                _convertUnits();
              });
            });
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Unit & Currency Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CategoryDropdown(
              selectedCategory: _selectedCategory,
              onChanged: _handleCategoryChange,
            ),
            const SizedBox(height: 16),
            dropdownWidgetFrom,
            const SizedBox(height: 16),
            dropdownWidgetTo,
            const SizedBox(height: 16),
            TextField(
              controller: _inputController,
              enabled: false,
              decoration: const InputDecoration(
                labelText: 'Enter value',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Converted Value: $_convertedValue',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Keypad(
                onKeyPressed: _handleKeypadInput,
                onClearPressed: _clearInput,
                onBackspacePressed: _deleteLastCharacter,
                hasDecimalPoint: _hasDecimalPoint,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
