import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tryapp/config/routes/routes_names.dart';
import 'package:tryapp/ui/pages/auth/role_screen.dart';
import 'package:tryapp/ui/pages/bus/add_bus_page.dart';
import 'package:tryapp/ui/pages/registration/user/user_home.dart';
import 'package:tryapp/ui/pages/registration/user/user_registration.dart';
import 'package:tryapp/ui/pages/auth/verify_otp_screen.dart';
import 'package:tryapp/ui/pages/auth/login_screen.dart';
import 'package:tryapp/ui/pages/splash/splash_screen.dart';

List<GetPage> appRoutes = [
  GetPage(
    name: RoutesNames.splashScreenPage,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: RoutesNames.roleSelectionPage,
    page: () => const RoleScreen(),
  ),
  GetPage(
    name: RoutesNames.loginPage,
    page: () => const LoginScreen(),
  ),
  GetPage(
    name: RoutesNames.otpVerificationPage,
    transitionDuration: const Duration(milliseconds: 800),
    page: () => const VerifyOTPScreen(),
  ),
  GetPage(
    name: RoutesNames.userRegistrationPage,
    page: () => const UserRegistration(),
  ),
  GetPage(
    name: RoutesNames.addBusPage,
    page: () => const AddBusPage(),
  ),
  GetPage(
    name: RoutesNames.userHomePage,
    page: () => const UserHome(),
  ),
];
