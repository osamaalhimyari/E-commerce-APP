import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == 'username') {
    if (!GetUtils.isUsername(val)) {
      return 'not valid userName';
    }
  }
  if (type == 'email') {
    if (!GetUtils.isEmail(val)) {
      return 'not valid email';
    }
  }
  if (type == 'phone') {
    if (!GetUtils.isPhoneNumber(val)) {
      return 'not valid phone';
    }
  }

  if (type.length > max) {
    return ' value is biger than max length';
  }

  if (type.length <= min) {
    return ' value is smaller than min length';
  }
  if (val.isEmpty) {
    return "can't be Empty";
  }
  // return null;
}

validConfirmPassword(
  String password,
  String confirmPassword,
) {
  return password != confirmPassword ? 'password not match' : null;
}
