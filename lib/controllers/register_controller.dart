import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:tryapp/config/constants/urls.dart';
import 'package:tryapp/config/routes/routes_names.dart';
import 'package:tryapp/helper/get_header.dart';
import 'package:tryapp/models/error_format.dart';

class RegisterFuctions extends GetxController {
  var isLoading = false.obs;

  void registerNewUser(
      String name, String address, String dob, String gender) async {
    try {
      isLoading(true);
      var header = await getHeader();
      var response = await http.post(Uri.parse(registerUserUrl),
          headers: header,
          body: json.encode({
            "name": name,
            "address": address,
            "dob": dob,
            "gender": gender
          }));

      if (response.statusCode == 201) {
        Get.offAllNamed(RoutesNames.userHomePage);
      } else {
        ErrorFormat error = ErrorFormat.fromJson(json.decode(response.body));
        throw error.message;
      }
    } catch (e) {
      QuickAlert.show(
        context: Get.context!,
        type: QuickAlertType.error,
        title: 'Oops...',
        text: e.toString(),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
