import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

// Sample values:
// {
//   "meta": {
//     "last_updated_at": "2024-05-27T23:59:59Z"
//   },
//   "data": {
//     "ADA": {
//       "code": "ADA",
//       "value": 2.1382026436
//     },
//     "AED": {
//       "code": "AED",
//       "value": 3.672040402
//     },
class CurrencyConverter {
  Map<String, dynamic>? currencyData;
  final file = File('assets\\currency_values.json');

  double convertCurrency(
    double amount,
    String fromCurrency,
    String toCurrency,
  ) {
    print("currency data is: $currencyData");
    final double? fromRate = currencyData?[fromCurrency]["value"];
    final double? toRate = currencyData?[toCurrency]["value"];
    print('fromRate $fromRate');
    print('toRate $toRate');
    if (fromRate != null && toRate != null) {
      return amount * (toRate / fromRate);
    } else {
      print('Currency rates not available for conversion');
      return 0;
    }
  }

  void readFromFile() {
    print(file.path);
    try {
      if (file.existsSync()) {
        final jsonString = file.readAsStringSync();
        currencyData = json.decode(jsonString)["data"];
      }
    } catch (e) {
      print('Exception on file.existsSync check: $e');
      print('Falling back to default values');
      currencyData = {
        "EUR": {"code": "EUR", "value": 0.9207701108},
        "USD": {"code": "USD", "value": 1},
        "RON": {"code": "RON", "value": 4.5802806473}
      };
    }
  }

  void fetchCurrencyData() async {
    const apiUrl =
        'https://api.currencyapi.com/v3/latest?apikey=cur_live_tNzqGAVsIHolSxQgMxx3cO20H7EDxPFiLyJJQenX';
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final jsonContent = json.decode(response.body);
      file.writeAsStringSync(json.encode(jsonContent));
      currencyData = jsonContent["data"];
    } else {
      throw Exception('Failed to load currency rates');
    }
  }
}
