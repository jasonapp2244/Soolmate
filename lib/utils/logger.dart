import 'package:logging/logging.dart';
import 'package:flutter/foundation.dart';

final Logger log = Logger('MyApp');

void setupLogging() {
  Logger.root.level = kReleaseMode ? Level.OFF : Level.ALL;

  Logger.root.onRecord.listen((record) {
    debugPrint(
      '[${record.level.name}] ${record.time.toIso8601String()} '
      '[${record.loggerName}]: ${record.message}',
    );
  });
}
