import 'dart:io';

import 'package:emulators/emulators.dart';
import 'package:auto_screenshot_translate/callable/core_my/my_language_code/entity/flutter_support_language_for_screenshot.dart';

Future<void> main() async {
  final emu = await Emulators.build();

  await emu.shutdownAll();

  List<String> devices = [
    'nexus_9',
    'Samsung_Galaxy_S10',
    'iPhone 8 Plus',
    'iPhone 8',
    'iPad Pro (12.9-inch) (5th generation)',
    'iPhone 15 Pro Max',
  ];

  for (int i = 0; i < devices.length; i++) {
    await emu.forEach([devices[i]])((device) async {
      for (final c in [{'locale':'ko'},{'locale':'en'},{'locale':'es'}]) {
        var p = await emu.drive(
          device,
          'test_driver/page1.dart',
          config: c,
        );
        stderr.addStream(p.stderr);
        await stdout.addStream(p.stdout);

        p = await emu.drive(
          device,
          'test_driver/page2.dart',
          config: c,
        );
        stderr.addStream(p.stderr);
        await stdout.addStream(p.stdout);

        p = await emu.drive(
          device,
          'test_driver/page3.dart',
          config: c,
        );
        stderr.addStream(p.stderr);
        await stdout.addStream(p.stdout);

        p = await emu.drive(
          device,
          'test_driver/page4.dart',
          config: c,
        );
        stderr.addStream(p.stderr);
        await stdout.addStream(p.stdout);

        p = await emu.drive(
          device,
          'test_driver/page5.dart',
          config: c,
        );
        stderr.addStream(p.stderr);
        await stdout.addStream(p.stdout);
      }
    });
  }
}