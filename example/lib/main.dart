import 'package:flutter/material.dart';
import 'package:tk_logger/destination/tk_log_console_destination.dart';
import 'package:tk_logger/tk_logger.dart';

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
            _buildLogButton(context, "Verbose Log", Colors.deepPurpleAccent,
                () {
              _printVerboseLog();
            }),
            _buildLogButton(context, "Info Log", Colors.blue, () {
              _printInfoLog();
            }),
            _buildLogButton(context, "Debug Log", Colors.green, () {
              _printDebugLog();
            }),
            _buildLogButton(context, "Warning Log", Colors.orange, () {
              _printWarningLog();
            }),
            _buildLogButton(context, "Error Log", Colors.red, () {
              _printErrorLog();
            }),
          ],
        ));
  }

  Widget _buildLogButton(
      BuildContext context, String title, Color color, VoidCallback onPressed) {
    return Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
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
