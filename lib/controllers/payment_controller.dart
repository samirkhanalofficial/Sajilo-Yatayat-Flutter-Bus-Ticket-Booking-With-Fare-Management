import 'package:get/get.dart';
import 'package:tryapp/config/constants/urls.dart';
import 'package:tryapp/helper/api_helper.dart';

class PaymentController extends GetxController {
  Rx<bool> isLoading = false.obs;
  Rx<String> token = ''.obs;
  Rx<String> transactionPin = ''.obs;

  Future<void> initilizeKhaltiPayment(
      String fareId, String khaltiMobileNumber, String khaltiPin) async {
    isLoading(true);

    APIHelper apiHelper = APIHelper();
    apiHelper.fetch(
      method: REQMETHOD.post,
      body: {
        "fare": fareId,
        "mobile": khaltiMobileNumber,
        "transaction_pin": khaltiPin,
      },
      url: initilizeKhaltiPaymentUrl,
      parseJsonToObject: (json) => json,
    );
    if (apiHelper.successfullResponse.value) {
      print(apiHelper.response.value);
      transactionPin.value = khaltiPin;
      // TODO : set Token.
    }
    isLoading(false);
  }

  Future<void> confirmKhaltiPayment(int otp) async {
    isLoading(true);
    APIHelper apiHelper = APIHelper();
    apiHelper.fetch(
      method: REQMETHOD.post,
      body: {
        "token": token.value,
        "transaction_pin": transactionPin.value,
        "confirmation_code": otp,
      },
      url: confirmKhaltiPaymentUrl,
      parseJsonToObject: (json) => json,
    );
    if (apiHelper.successfullResponse.value) {
      print(apiHelper.response.value);
      // TODO : navigate to success page.
    }
    isLoading(false);
  }
}
