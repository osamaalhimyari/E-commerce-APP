import 'package:get/get.dart';
import 'langs/ar_ar.dart';
import 'langs/en_us.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar_ar": ArAr.message,
        "en_us": EnUs.message,
      };
}

class Translate {
  static String welcome = 'welcome';
  static String welcomeBack = 'welcomeBack';
  static String hello = 'hello';
  static String continue_ = 'continue';
  static String signIn = 'signIn'; //'Sign In'
  static String signUp = 'signUp'; // 'Sign Up'
  static String password = 'password'; //' password'
  static String forgetPassword = 'forgetPassword'; //'forget password?''
  static String enterPassword = 'enterPassword'; //'enter your password'
  static String confirmPassword = 'confirmPassword'; //'confirm  password'
  static String resetPassword = 'resetPassword'; //'reset  password'
  static String haveAccount = 'haveAccount'; //'have account already? '
  static String dontHaveAccount = 'dontHaveAccount'; //'dont have account ? '
  static String enterPhon = 'enterPhon'; //'enter your phon'
  static String phon = 'phon'; //'phon'
  static String enterEmail = 'enterEmail'; //'enter your email'
  static String email = 'email'; //'email'
  static String checkEmail = 'checkEmail'; //'Check Email'
  static String signUpMessage = 'signUpMessage';
  static String signInMessage = 'signInMessage';
  static String verfyCode = 'verfyCode';
  static String verfyCodeMessage = 'verfyCodeMessage';
  static String successSignUp = 'successSignUp';
  static String successResetPassword = 'successResetPassword';
}
