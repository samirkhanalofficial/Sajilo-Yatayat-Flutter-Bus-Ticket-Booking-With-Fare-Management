import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tryapp/config/routes/routes_names.dart';
import 'package:tryapp/ui/pages/owner/booking.dart';
import 'package:tryapp/ui/pages/owner/busstatus.dart';
import 'package:tryapp/ui/pages/owner/cancelticket.dart';
import 'package:tryapp/ui/pages/owner/depstatus.dart';
import 'package:tryapp/ui/pages/owner/owner_profile.dart';
import 'package:tryapp/ui/pages/owner/owner_reg.dart';
import 'package:tryapp/ui/pages/owner/ownerwallet.dart';
import 'package:tryapp/ui/pages/owner/withdraw.dart';
import 'package:tryapp/ui/pages/registration/user/user_home.dart';
import 'package:tryapp/ui/pages/registration/verify_otp.dart';
import 'package:tryapp/ui/pages/registration/login_page.dart';
import 'package:tryapp/ui/role_selection.dart';

List<GetPage> appRoutes = [
  GetPage(
    name: RoutesNames.homePage,
    page: () => const RoleSelection(),
  ),
  GetPage(
    name: RoutesNames.otpVerificationPage,
    page: () => const VerifyOTP(),
  ),
  GetPage(
    name: RoutesNames.regpage,
    page: () => const reg(),
  ),
  GetPage(
    name: RoutesNames.ownerProfile,
    page: () => const my_profile(),
  ),
  GetPage(
    name: RoutesNames.login,
    page: () => const LoginPage(),
  ),
  GetPage(
    name: RoutesNames.user,
    page: () => const UserHome(),
  ),
  GetPage(
    name: RoutesNames.bus,
    page: () => const bus_status(),
  ),
  GetPage(
    name: RoutesNames.dep,
    page: () => const departure(),
  ),
  GetPage(
    name: RoutesNames.wallet,
    page: () => const ownerwallet(),
  ),
  GetPage(
    name: RoutesNames.withdraw,
    page: () => const withdraw(),
  ),
  GetPage(
    name: RoutesNames.booking,
    page: () => const booking(),
  ),
  GetPage(
    name: RoutesNames.cancel,
    page: () => const cancel(),
  )
];
