import 'package:get/get.dart';
import 'package:peyman/app/modules/login/bindings/login_binding.dart';
import 'package:peyman/app/modules/login/views/login_view.dart';
import 'package:peyman/app/modules/signup/views/signUp3_view.dart';
import 'package:peyman/app/modules/signup/views/signup2_view.dart';

import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.signUp;

  static final routes = [
    GetPage(
      name: _Paths.signUp,
      page: () => const SignUpView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.signUp2,
      page: () => const SignUpView2(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.signUp3,
      page: () => const SignUpView3(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
