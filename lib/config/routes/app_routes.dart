import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tryapp/config/routes/routes_names.dart';
import 'package:tryapp/ui/pages/registration/verify_otp.dart';
import 'package:tryapp/ui/pages/registration/verify_phone.dart';

List<GetPage> appRoutes = [
  GetPage(
    name: RoutesNames.homePage,
    page: () => const VerifyPhoneNumber(),
  ),
  GetPage(
    name: RoutesNames.otpVerificationPage,
    page: () => const OtpVerification(),
  )
];
