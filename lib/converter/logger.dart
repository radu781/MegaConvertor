import 'dart:io';

class ConversionLogger {
  static final ConversionLogger _instance = ConversionLogger._internal();
  late File _logFile;

  factory ConversionLogger() {
    return _instance;
  }

  ConversionLogger._internal() {
    _openLogFile();
  }

  void _openLogFile() async {
    print('Opening log file');
    try {
      _logFile = File('conversion_log.txt');
      if (!(await _logFile.exists())) {
        await _logFile.create();
      }
    } catch (e) {
      print("Caught exception when opening log file: $e");
    }
  }

  void logConversion(String conversion) {
    print("Log message: $conversion");
    try {
      _logFile.writeAsStringSync('$conversion\n', mode: FileMode.append);
    } catch (e) {
      print("Caught exception when logging conversion: $e");
    }
  }
}
