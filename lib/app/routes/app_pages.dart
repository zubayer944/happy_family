import 'package:get/get.dart';

import '../modules/admin/admin_dashboard/bindings/admin_dashboard_binding.dart';
import '../modules/admin/admin_dashboard/views/admin_dashboard_view.dart';
import '../modules/admin/event/all_events/bindings/all_events_binding.dart';
import '../modules/admin/event/all_events/views/all_events_view.dart';
import '../modules/admin/event/event_create/bindings/event_create_binding.dart';
import '../modules/admin/event/event_create/views/event_create_view.dart';
import '../modules/admin/event/event_details/event_details/bindings/event_details_binding.dart';
import '../modules/admin/event/event_details/event_details/views/event_details_view.dart';
import '../modules/admin/event/payments/payments/bindings/payments_binding.dart';
import '../modules/admin/event/payments/payments/views/payments_view.dart';
import '../modules/admin/payment/payment_confirmation/bindings/payment_confirmation_binding.dart';
import '../modules/admin/payment/payment_confirmation/views/payment_confirmation_view.dart';
import '../modules/admin/total_cost/all_users/bindings/all_users_binding.dart';
import '../modules/admin/total_cost/all_users/views/total_cost_view.dart';
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
import '../modules/user/user_send_request/send_request_view/bindings/send_request_view_binding.dart';
import '../modules/user/user_send_request/send_request_view/views/send_request_view_view.dart';

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
    GetPage(
      name: _Paths.ADMIN_DASHBOARD,
      page: () => const AdminDashboardView(),
      binding: AdminDashboardBinding(),
    ),
    GetPage(
      name: _Paths.EVENT_CREATE,
      page: () => const EventCreateView(),
      binding: EventCreateBinding(),
    ),
    GetPage(
      name: _Paths.ALL_EVENTS,
      page: () => const AllEventsView(),
      binding: AllEventsBinding(),
    ),
    GetPage(
      name: _Paths.TOTAL_COST,
      page: () => const TotalCostView(),
      binding: TotalCostBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_CONFIRMATION,
      page: () => const PaymentConfirmationView(),
      binding: PaymentConfirmationBinding(),
    ),
    GetPage(
      name: _Paths.EVENT_DETAILS,
      page: () => const EventDetailsView(),
      binding: EventDetailsBinding(),
    ),
    GetPage(
      name: _Paths.SEND_REQUEST_VIEW,
      page: () => const SendRequestViewView(),
      binding: SendRequestViewBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENTS,
      page: () => const PaymentsView(),
      binding: PaymentsBinding(),
    ),
  ];
}
