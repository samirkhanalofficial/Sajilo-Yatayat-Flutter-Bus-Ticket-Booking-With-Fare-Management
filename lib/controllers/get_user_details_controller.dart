import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:tryapp/config/constants/urls.dart';
import 'package:tryapp/helper/get_header.dart';
import 'package:tryapp/models/show_user_details.dart';

class GetUserDetailsController extends GetxController {
  // ignore: unnecessary_cast
  final Rx<UserDetails?> userDetails = (null as UserDetails?).obs;
  var isLoading = false.obs;

  void getUserDetail() async {
    try {
      isLoading.value = true;
      var response = await http.get(
        Uri.parse(getUserDetailsUrls),
        headers: await getHeader(),
      );

      if (response.statusCode == 200) {
        userDetails.value = UserDetails.fromJson(json.decode(response.body));
      }
    } catch (e) {
      QuickAlert.show(
        context: Get.context!,
        type: QuickAlertType.error,
        title: e.toString(),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
