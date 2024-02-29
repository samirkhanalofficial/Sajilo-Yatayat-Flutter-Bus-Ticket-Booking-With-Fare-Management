import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tryapp/config/constants/urls.dart';
import 'package:tryapp/config/routes/routes_names.dart';
import 'package:tryapp/helper/api_helper.dart';
import 'package:tryapp/models/user_details.dart';

class UserController extends GetxController {
  // ignore: unnecessary_cast
  final Rx<UserDetails?> userDetails = (null as UserDetails?).obs;
  var isLoading = false.obs;
  void registerNewUser(
      String name, String address, String dob, String gender) async {
    isLoading(true);

    APIHelper<UserDetails> apiHelper = APIHelper<UserDetails>();
    await apiHelper.fetch(
      method: REQMETHOD.post,
      url: registerUserUrl,
      successStatusCode: 201,
      body: {"name": name, "address": address, "dob": dob, "gender": gender},
      parseJsonToObject: (json) => UserDetails.fromJson(json),
    );

    if (apiHelper.successfullResponse.value) {
      SharedPreferences sf = await SharedPreferences.getInstance();
      sf.setBool("isLogginned", true);
      String role = sf.getString("role") ?? "Passenger";
      if (role == "Passenger") {
        sf.setBool("isLogginned", true);
        Get.offAllNamed(
          RoutesNames.userHomePage,
        );
      } else {
        Get.offAllNamed(
          RoutesNames.addBusPage,
        );
      }
    }
    isLoading(false);
  }

  Future<void> getUserDetail() async {
    isLoading(true);

    APIHelper<UserDetails> apiHelper = APIHelper<UserDetails>();
    await apiHelper.fetch(
      method: REQMETHOD.get,
      url: getUserDetailsUrl,
      parseJsonToObject: (json) => UserDetails.fromJson(json),
    );

    if (apiHelper.successfullResponse.value) {
      userDetails.value = apiHelper.response.value;
    }
    isLoading(false);
  }

  Future<bool> userExists() async {
    await getUserDetail();
    if (userDetails.value == null) return false;
    return true;
  }
}
