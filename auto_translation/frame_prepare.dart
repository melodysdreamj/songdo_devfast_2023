import 'package:auto_screenshot_translate/auto_screenshot_translate.dart';
import 'package:auto_screenshot_translate/callable/core_my/my_screenshot_helper/entity/my_screenshot_info.dart';

Future<void> main() async {
  MyScreenshotInfo myScreenshotInfo = MyScreenshotInfo(
    // not use
    screenshotTitle01: "",
    screenshotTitle02: "",
    screenshotTitle03: "",
    screenshotTitle04: "",
    screenshotTitle05: "",

    // using (screenshot top text)
    screenshotSubTitle01: "첫째날",
    screenshotSubTitle02: "둘쨰날",
    screenshotSubTitle03: "셋째날",
    screenshotSubTitle04: "넷째날",
    screenshotSubTitle05: "다섯째날",

    // screenshot start language for translate
    screenshotStartLanguageCode: "ko",
    googleTranslateApiKey: '',
  );

  AutoScreenshotTranslate.prepareGenerateScreenshotFrame(myScreenshotInfo,
      translateSupportLanguages: ['ko', 'en', 'es']);
}
