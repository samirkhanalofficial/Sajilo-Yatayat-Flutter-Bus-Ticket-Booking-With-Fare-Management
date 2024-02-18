import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:tryapp/config/constants/urls.dart';
import 'package:tryapp/helper/get_header.dart';

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
      var body = await json.decode(response.body);
      if (response.statusCode == 201) {
        Get.offAllNamed('/user-home');
        QuickAlert.show(
          context: Get.context!,
          type: QuickAlertType.success,
          title: '${response.statusCode} UserCreated',
        );
      } else {
        QuickAlert.show(
          context: Get.context!,
          type: QuickAlertType.error,
          title: '${response.statusCode} ${body["message"]}',
        );
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
