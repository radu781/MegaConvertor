import 'package:flutter/material.dart';
import '../unit_converter.dart';
import '../category.dart';

class CategoryDropdown extends StatelessWidget {
  final Category selectedCategory;
  final ValueChanged<Category?> onChanged;

  const CategoryDropdown({super.key, 
    required this.selectedCategory,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Category>(
      value: selectedCategory,
      onChanged: onChanged,
      items: Category.values.map<DropdownMenuItem<Category>>((Category value) {
        return DropdownMenuItem<Category>(
          value: value,
          child: Text(value.toString().split('.').last),
        );
      }).toList(),
    );
  }
}

class TemperatureUnitDropdown extends StatelessWidget {
  final TemperatureUnit selectedUnit;
  final ValueChanged<TemperatureUnit?> onChanged;

  const TemperatureUnitDropdown({super.key, 
    required this.selectedUnit,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<TemperatureUnit>(
      value: selectedUnit,
      onChanged: onChanged,
      items: TemperatureUnit.values
          .map<DropdownMenuItem<TemperatureUnit>>((TemperatureUnit value) {
        return DropdownMenuItem<TemperatureUnit>(
          value: value,
          child: Text(value.toString().split('.').last),
        );
      }).toList(),
    );
  }
}

class DistanceUnitDropdown extends StatelessWidget {
  final DistanceUnit selectedUnit;
  final ValueChanged<DistanceUnit?> onChanged;

  const DistanceUnitDropdown({super.key, 
    required this.selectedUnit,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<DistanceUnit>(
      value: selectedUnit,
      onChanged: onChanged,
      items: DistanceUnit.values
          .map<DropdownMenuItem<DistanceUnit>>((DistanceUnit value) {
        return DropdownMenuItem<DistanceUnit>(
          value: value,
          child: Text(value.toString().split('.').last),
        );
      }).toList(),
    );
  }
}

class WeightUnitDropdown extends StatelessWidget {
  final WeightUnit selectedUnit;
  final ValueChanged<WeightUnit?> onChanged;

  const WeightUnitDropdown({super.key, 
    required this.selectedUnit,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<WeightUnit>(
      value: selectedUnit,
      onChanged: onChanged,
      items: WeightUnit.values
          .map<DropdownMenuItem<WeightUnit>>((WeightUnit value) {
        return DropdownMenuItem<WeightUnit>(
          value: value,
          child: Text(value.toString().split('.').last),
        );
      }).toList(),
    );
  }
}

class PressureUnitDropdown extends StatelessWidget {
  final PressureUnit selectedUnit;
  final ValueChanged<PressureUnit?> onChanged;

  const PressureUnitDropdown({super.key, 
    required this.selectedUnit,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<PressureUnit>(
      value: selectedUnit,
      onChanged: onChanged,
      items: PressureUnit.values
          .map<DropdownMenuItem<PressureUnit>>((PressureUnit value) {
        return DropdownMenuItem<PressureUnit>(
          value: value,
          child: Text(value.toString().split('.').last),
        );
      }).toList(),
    );
  }
}
class CurrencyUnitDropdown extends StatelessWidget {
  final CurrencyUnit selectedUnit;
  final ValueChanged<CurrencyUnit?> onChanged;

  const CurrencyUnitDropdown({super.key, 
    required this.selectedUnit,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<CurrencyUnit>(
      value: selectedUnit,
      onChanged: onChanged,
      items: CurrencyUnit.values
          .map<DropdownMenuItem<CurrencyUnit>>((CurrencyUnit value) {
        return DropdownMenuItem<CurrencyUnit>(
          value: value,
          child: Text(value.toString().split('.').last),
        );
      }).toList(),
    );
  }
}

