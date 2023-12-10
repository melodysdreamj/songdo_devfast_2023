import 'package:emulators/emulators.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

Future<void> main() async {
  // Connect to flutter driver
  final driver = await FlutterDriver.connect();

  // Setup emulators package
  final emu = await Emulators.build();
  final screenshot = emu.screenshotHelper(
    androidPath: 'auto_translation/screenshots/${Environment.getString('locale')!}',
    iosPath: 'auto_translation/screenshots/${Environment.getString('locale')!}',
    // suffixes: [Environment.getString('locale')!],
  );

  setUpAll(() async {
    await driver.waitUntilFirstFrameRasterized();

    // Clean up the status bar for the device
    await screenshot.cleanStatusBar();
  });

  // Close the connection to the driver after the tests have completed.
  tearDownAll(() async {
    await driver.close();
  });

  group('Scene1', () {
    test('home screen', () async {
      await Future.delayed(const Duration(seconds: 1), () {});
      await screenshot.capture('03');
      await Future.delayed(const Duration(seconds: 1), () {});
    });

    // final buttonFinder = find.byTooltip('Increment');
    // test('updated count', () async {
    //   await Future.delayed(const Duration(seconds: 1), () {});
    //   await driver.tap(buttonFinder);
    //   await driver.tap(buttonFinder);
    //   await driver.tap(buttonFinder);
    //   await driver.waitUntilNoTransientCallbacks();
    // await screenshot.capture('02');
    // await driver.tap(buttonFinder);
    // await driver.tap(buttonFinder);
    // await driver.tap(buttonFinder);
    // await driver.waitUntilNoTransientCallbacks();
    // await screenshot.capture('03');
    // await driver.tap(buttonFinder);
    // await driver.tap(buttonFinder);
    // await driver.tap(buttonFinder);
    // await driver.waitUntilNoTransientCallbacks();
    // await screenshot.capture('04');
    // await driver.tap(buttonFinder);
    // await driver.tap(buttonFinder);
    // await driver.tap(buttonFinder);
    // await driver.waitUntilNoTransientCallbacks();
    // await screenshot.capture('05');
    // });
  });
}
