import 'package:flutter/material.dart';
import 'package:tk_logger/destination/tk_log_console_destination.dart';
import 'package:tk_logger/tk_logger.dart';
import 'package:tk_logger_example/verbose_log_filter.dart';

void main() {
  TKLogger.setup();
  TKLogger.addDestination(TKLogConsoleDestination());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('TKLogger example app'),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildLogButton(
                context, "Add Verbose log Filter", Colors.blueAccent, () {
              TKLogger.addFilter(VerboseLogFilter());
            }),
            _buildLogButton(context, "Verbose log", Colors.deepPurpleAccent,
                () {
              _printVerboseLog();
            }),
            _buildLogButton(context, "Info log", Colors.blue, () {
              _printInfoLog();
            }),
            _buildLogButton(context, "Debug log", Colors.green, () {
              _printDebugLog();
            }),
            _buildLogButton(context, "Warning log", Colors.orange, () {
              _printWarningLog();
            }),
            _buildLogButton(context, "Error log", Colors.red, () {
              _printErrorLog();
            }),
          ],
        ));
  }

  Widget _buildLogButton(
      BuildContext context, String title, Color color, VoidCallback onPressed) {
    return Container(
        margin: EdgeInsets.only(top: 15, bottom: 15),
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width - 100,
          height: 45,
          textColor: Colors.white,
          color: color,
          child: new Text(title, style: TextStyle(fontSize: 18)),
          onPressed: onPressed,
        ));
  }

  void _printVerboseLog() {
    TKLogger.verbose("This is the verbose level log.");
  }

  void _printInfoLog() {
    TKLogger.info("This is the info level log.");
  }

  void _printDebugLog() {
    TKLogger.debug("This is the debug level log.");
  }

  void _printWarningLog() {
    TKLogger.warning("This is the warning level log.");
  }

  void _printErrorLog() {
    TKLogger.error("This is the error level log.");
  }
}
