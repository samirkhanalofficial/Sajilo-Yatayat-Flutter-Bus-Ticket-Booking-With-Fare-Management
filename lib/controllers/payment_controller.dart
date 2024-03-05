import 'package:get/get.dart';
import 'package:tryapp/config/constants/urls.dart';
import 'package:tryapp/helper/api_helper.dart';
import 'package:tryapp/ui/pages/home/user_home.dart';

class PaymentController extends GetxController {
  Rx<bool> isLoading = false.obs;
  Rx<String> token = ''.obs;
  Rx<String> transactionPin = ''.obs;

  Future<void> initilizeKhaltiPayment(
      String fareId, String khaltiMobileNumber, String khaltiPin) async {
    isLoading(true);

    APIHelper apiHelper = APIHelper();
    await apiHelper.fetch(
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
      transactionPin.value = khaltiPin;
      token.value = apiHelper.response.value["token"];
    }
    isLoading(false);
  }

  Future<void> confirmKhaltiPayment(String otp) async {
    isLoading(true);
    APIHelper apiHelper = APIHelper();
    await apiHelper.fetch(
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
      Get.offAll(() => const UserHome(
            currentPage: 2,
          ));
    }
    isLoading(false);
  }
}
