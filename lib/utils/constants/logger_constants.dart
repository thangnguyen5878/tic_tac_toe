import 'package:logger/logger.dart';

var logger = Logger(
  filter: null,
  printer: PrettyPrinter(
    printTime: true,
    printEmojis: false,
    lineLength: 80,

    // methodCount: 0,
    // errorMethodCount: 0
  ),
  output: null,
);
