class AppLinks {
  // static const String server = "http://localhost/courseFiles/ecommerce";
  static const String server = "http://192.168.48.18/courseFiles/ecommerce";
  static const String test = "$server/test.php";

  //======================== Auth ======================= //

  static const String signUp = "$server/auth/signUp.php";
  static const String verfySignUp = "$server/auth/verfycode.php";
  static const String signIn = "$server/auth/signin.php";
  //======================== porgetpassword ======================= //
  static const String forgetPassword =
      "$server/forget_password/forgetPassword.php";
}
