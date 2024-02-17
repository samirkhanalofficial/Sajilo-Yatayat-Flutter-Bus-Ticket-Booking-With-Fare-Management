import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tryapp/config/constants/urls.dart';
import 'package:tryapp/helper/get_header.dart';

class RegisterFuctions extends GetxController {
  var isLoading = false.obs;
  void registerNewUser(
      String name, String address, String dob, String gender) async {
    try {
      isLoading(true);
      var response = await Dio().post(
        registerUserUrl,
        data: {"name": name, "address": address, "dob": dob, "gender": gender},
        options: await getHeader(),
      );
      if (response.statusCode == 201) {
        Get.snackbar('${response.statusCode}', '${response.statusMessage}');
        Get.toNamed('/user-home');
      } else {
        Get.snackbar('${response.statusCode}', '${response.statusMessage}');
      }
    } catch (e) {
      Get.snackbar('Error', '$e');
    } finally {
      isLoading(false);
    }
  }
}
