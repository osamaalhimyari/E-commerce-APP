class AppLinks {
  // static const String server = "http://localhost/courseFiles/ecommerce";
  static const String server = "http://192.168.48.18/courseFiles/ecommerce";
  static const String test = "$server/test.php";

  //======================== Auth ======================= //

  static const String _authRoot = "$server/auth";
  static const String signUp = "$_authRoot/signUp.php";
  static const String verfySignUp = "$_authRoot/verfycode.php";
  static const String signIn = "$_authRoot/signin.php";
  //======================== porgetpassword ======================= //

  static const String _forgetPassRoot = "$server/forget_password";
  static const String forgetPassword = "$_forgetPassRoot/forget_password.php";
  static const String resetPassword = "$_forgetPassRoot/reset_password.php";
  static const String verfyCode = "$_forgetPassRoot/verfycode.php";

  //======================== pages          ======================= //
  static const String _pagesRoot = "$server";
  // home
  static const String home = "$_pagesRoot/home.php";
}
