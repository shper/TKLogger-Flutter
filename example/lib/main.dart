import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:tk_logger/destination/tk_log_console_destination.dart';
import 'package:tk_logger/tk_logger.dart';

void main() {
  TKLogger.setup();
  TKLogger.addDestination(TKLogConsoleDestination());

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: MaterialButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: new Text('Test'),
            onPressed: () {
              _printDebugLog();
            },
          ),
        ),
      ),
    );
  }

  void _printDebugLog() {
    TKLogger.debug("This is a debug log");
  }

}
