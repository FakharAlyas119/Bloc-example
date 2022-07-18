import 'dart:developer' as developer;

class LoggerMessage {
  static final LoggerMessage _loggerMessage = LoggerMessage._internal();

  factory LoggerMessage() {
    return _loggerMessage;
  }
  LoggerMessage._internal();

// Blue text
  void logInfo({required String msg}) {
    developer.log('\x1B[37m$msg\x1B[0m');
  }

// Green text
  void logSuccess({required String msg}) {
    developer.log('\x1B[32m$msg\x1B[0m');
  }

// Yellow text
  void logWarning({required String msg}) {
    developer.log('\x1B[33m$msg\x1B[0m');
  }

// Red text
  void logError({required String msg}) {
    developer.log('\x1B[31m${'OOPS:' + msg}\x1B[0m');
  }
}
