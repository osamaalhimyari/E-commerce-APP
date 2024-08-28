class AppLinks {
  // static const String server = "http://localhost/courseFiles/ecommerce";
  static const String server = "http://192.168.124.23/courseFiles/ecommerce";
  static const String test = "$server/test.php";

  static const String _authRoot = "$server/auth";
  static const String _forgetPassRoot = "$server/forget_password";
  static const String _pagesRoot = server;
  static const String _favoriteRoot = "$_pagesRoot/favorite";
  static const String _cartRoot = "$_pagesRoot/cart";
  static const String _addressRoot = "$_pagesRoot/address";

  static const String notification = "$server/notification.php";
  static const String getAuthMesseging = "$server/getAuthMesseging.php";
  //======================== iamges ======================= //
  static const String imagestCategories = "$server/upload/categories";
  static const String imagestItems = "$server/upload/items";
  //======================== Auth ======================= //

  static const String signUp = "$_authRoot/signUp.php";
  static const String verfySignUp = "$_authRoot/verfycode.php";
  static const String signIn = "$_authRoot/signin.php";
  static const String resendCode = "$_authRoot/resendCode.php";
  //======================== porgetpassword ======================= //

  static const String forgetPassword = "$_forgetPassRoot/forget_password.php";
  static const String resetPassword = "$_forgetPassRoot/reset_password.php";
  static const String verfyCode = "$_forgetPassRoot/verfycode.php";

  //======================== pages          ======================= //
  // home
  static const String home = "$_pagesRoot/home.php";
  // items
  static const String search = "$_pagesRoot/items/search.php";
  static const String items = "$_pagesRoot/items/items.php";
  /////////////////
  // favorite
  //
  static const String favoriteAdd = "$_favoriteRoot/add.php";
  static const String favroiteDelete = "$_favoriteRoot/deletefromfavroite.php";
  static const String favroiteRemove = "$_favoriteRoot/remove.php";
  static const String favroiteView = "$_favoriteRoot/view.php";
  /////////////////
  // cart
  //
  static const String cartadd = "$_cartRoot/add.php";
  static const String cartdelete = "$_cartRoot/delete.php";
  static const String cartgetcountitems = "$_cartRoot/getcountitems.php";
  static const String cartview = "$_cartRoot/view.php";
  /////////////////
  // address
  //
  static const String addressadd = "$_addressRoot/add.php";
  static const String addressdelete = "$_addressRoot/delete.php";
  static const String addressupdate = "$_addressRoot/edit.php";
  static const String addressview = "$_addressRoot/view.php";
  // coupons
  static const String checkcoupon = "$_pagesRoot/coupon/checkcoupon.php";
  // orders
  static const String checkout = "$_pagesRoot/orders/checkout.php";
  static const String pendingorders = "$server/orders/pending.php";
  static const String ordersarchive = "$server/orders/archive.php";
  static const String ordersdetails = "$server/orders/details.php";
  static const String ordersdelete = "$server/orders/delete.php";
}
