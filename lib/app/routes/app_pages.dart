import 'package:get/get.dart';
import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/registration/bindings/registration_binding.dart';
import '../modules/auth/registration/views/registration_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/user/user_dashboard/bindings/user_dashboard_binding.dart';
import '../modules/user/user_dashboard/views/user_dashboard_view.dart';
import '../modules/user/user_package_details/bindings/user_package_details_binding.dart';
import '../modules/user/user_package_details/views/user_package_details_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTRATION,
      page: () => const RegistrationView(),
      binding: RegistrationBinding(),
    ),
    GetPage(
      name: _Paths.USER_DASHBOARD,
      page: () => const UserDashboardView(),
      binding: UserDashboardBinding(),
    ),

    GetPage(
      name: _Paths.USER_PACKAGE_DETAILS,
      page: () => const UserPackageDetailsView(),
      binding: UserPackageDetailsBinding(),
    ),
  ];
}
