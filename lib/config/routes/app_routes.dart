import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tryapp/config/routes/routes_names.dart';
import 'package:tryapp/ui/pages/owner/owner_profile.dart';
import 'package:tryapp/ui/pages/owner/owner_reg.dart';
import 'package:tryapp/ui/pages/registration/user/user_home.dart';
import 'package:tryapp/ui/pages/registration/user/user_profile.dart';
import 'package:tryapp/ui/pages/registration/user/user_registration.dart';
import 'package:tryapp/ui/pages/registration/verify_otp.dart';
import 'package:tryapp/ui/pages/registration/login_page.dart';

List<GetPage> appRoutes = [
  GetPage(
    name: RoutesNames.homePage,
    page: () => const LoginPage(),
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
    name: RoutesNames.userRegistrationPage,
    page: () => const UserRegistration(),
  ),
  GetPage(
    name: RoutesNames.userHomePage,
    page: () => const UserHome(),
  ),
  GetPage(
    name: RoutesNames.userProfilePage,
    page: () => const UserProfile(),
  )
];
