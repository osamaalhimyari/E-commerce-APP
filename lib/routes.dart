import 'package:ecommerce2/view/screen/mainscreen.dart';
import 'package:ecommerce2/view/screen/pages/cart_page.dart';
import 'package:ecommerce2/view/screen/pages/myfavorite_page.dart';
import 'package:ecommerce2/view/screen/pages/produc_detail_page.dart';
import 'package:get/get.dart';
import 'core/constants/routes.dart';
import 'core/middleware/my_middleware.dart';
import 'view/screen/address/add.dart';
import 'view/screen/address/adddetails.dart';
import 'view/screen/address/view.dart';
import 'view/screen/auth/ForgetPassword/forget_password.dart';
import 'view/screen/auth/ForgetPassword/reset_password.dart';
import 'view/screen/auth/ForgetPassword/verfy_code_forgetpassword.dart';
import 'view/screen/auth/signup/signup.dart';
import 'view/screen/auth/signup/success_signup.dart';
import 'view/screen/auth/signin.dart';
import 'view/screen/auth/ForgetPassword/success_reset_password.dart';
import 'view/screen/auth/signup/verfy_code_signup.dart';
import 'view/screen/onboarding.dart';
import 'view/screen/pages/checkout.dart';
import 'view/screen/pages/items_page.dart';

List<GetPage<dynamic>>? routesPages = [
  // GetPage(name: '/', page: () => const TestView()),
  GetPage(
      name: '/', page: () => const OnBoarding(), middlewares: [MyMiddleware()]),
  GetPage(name: AppRoute.signIn, page: () => const SignIn()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfyCode, page: () => const VerfyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.verfyCodeSignUp, page: () => const VerfyCodeSignUp()),
  GetPage(name: AppRoute.home, page: () => const MainScreen()),
  GetPage(name: AppRoute.itemsPage, page: () => const ItemsPage()),
  GetPage(
      name: AppRoute.productDetails, page: () => const ProductDetailsPage()),
  GetPage(name: AppRoute.favorite, page: () => const MyFavoritePage()),
  GetPage(name: AppRoute.cartPage, page: () => const CartPage()),
  GetPage(name: AppRoute.addressview, page: () => const AddressViewPage()),
  GetPage(name: AppRoute.addressadd, page: () => const AddressAddPage()),
  GetPage(
      name: AppRoute.addressdetail, page: () => const AddressAddDetailsPage()),
  GetPage(name: AppRoute.checkoutpage, page: () => const CheckoutPage()),
];
