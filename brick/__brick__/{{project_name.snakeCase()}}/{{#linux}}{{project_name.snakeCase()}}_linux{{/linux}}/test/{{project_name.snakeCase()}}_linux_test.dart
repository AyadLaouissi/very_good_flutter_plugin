import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:{{project_name.snakeCase()}}_linux/{{project_name.snakeCase()}}_linux.dart';
import 'package:{{project_name.snakeCase()}}_platform_interface/{{project_name.snakeCase()}}_platform_interface.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('{{project_name.pascalCase()}}Linux', () {
    const kPlatformName = 'Linux';
    late {{project_name.pascalCase()}}Linux {{project_name.camelCase()}};
    late List<MethodCall> log;

    setUp(() async {
      {{project_name.camelCase()}} = {{project_name.pascalCase()}}Linux();

      log = <MethodCall>[];
      TestDefaultBinaryMessengerBinding.instance!.defaultBinaryMessenger
          .setMockMethodCallHandler({{project_name.camelCase()}}.methodChannel, (methodCall) async {
        log.add(methodCall);
        switch (methodCall.method) {
          case 'getPlatformName':
            return kPlatformName;
          default:
            return null;
        }
      });
    });

    test('can be registered', () {
      {{project_name.pascalCase()}}Linux.registerWith();
      expect({{project_name.pascalCase()}}Platform.instance, isA<{{project_name.pascalCase()}}Linux>());
    });

    test('getPlatformName returns correct name', () async {
      final name = await {{project_name.camelCase()}}.getPlatformName();
      expect(
        log,
        <Matcher>[isMethodCall('getPlatformName', arguments: null)],
      );
      expect(name, equals(kPlatformName));
    });
  });
}
