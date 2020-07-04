import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tk_logger/tk_logger.dart';

void main() {
  const MethodChannel channel = MethodChannel('tk_logger');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
//    expect(await TkLogger.platformVersion, '42');
  });
}
