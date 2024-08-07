import 'package:get/get.dart';

import 'langs/ar_ar.dart';
import 'langs/en_us.dart';

class MyTranslation extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "ar_ar": ArAr.message,
        "en_us": EnUs.message,
      };
}
