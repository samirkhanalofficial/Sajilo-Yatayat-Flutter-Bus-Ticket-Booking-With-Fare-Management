import 'dart:convert';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:tryapp/helper/get_header.dart';
import 'package:tryapp/models/error_format.dart';
import 'package:http/http.dart' as http;

enum REQMETHOD { get, post, put, patch, delete }

class APIHelper<T> extends GetxController {
  Rx<bool> successfullResponse = false.obs;
  Rx<ErrorFormat> error = ErrorFormat(message: "").obs;
  // ignore: unnecessary_cast
  Rx<T?> response = (null as T?).obs;
  Future<void> fetch({
    required REQMETHOD method,
    required String url,
    Map<String, dynamic>? body,
    int successStatusCode = 200,
    required Function parseJsonToObject,
    bool testMode = false,
    bool isFirstTime = true,
  }) async {
    successfullResponse(false);
    late http.Response res;
    Map<String, String> header = await getHeader(testMode: testMode);
    try {
      switch (method) {
        case REQMETHOD.get:
          res = await http.get(Uri.parse(url), headers: header);
          break;
        case REQMETHOD.delete:
          res = await http.delete(Uri.parse(url), headers: header);
          break;
        case REQMETHOD.post:
          res = await http.post(Uri.parse(url),
              headers: header, body: json.encode(body));
        case REQMETHOD.put:
          res = await http.put(Uri.parse(url),
              headers: header, body: json.encode(body));
        case REQMETHOD.patch:
          res = await http.patch(Uri.parse(url),
              headers: header, body: json.encode(body));
        default:
          break;
      }
      var resBody = json.decode(res.body);
      if (res.statusCode == successStatusCode) {
        successfullResponse(true);
        response.value = parseJsonToObject(resBody);
      } else {
        error.value = ErrorFormat.fromJson(resBody);
        throw error.value.message;
      }
    } catch (e) {
      successfullResponse(false);
      error.value.message = e.toString();

      if (!testMode) {
        if (isFirstTime) {
          QuickAlert.show(
            context: Get.context!,
            type: QuickAlertType.error,
            title: 'Error',
            text: e.toString(),
          );
        }
      }
    }
  }
}
