import 'package:get/get.dart';
import 'package:tryapp/config/constants/urls.dart';
import 'package:tryapp/controllers/bus_controller.dart';
import 'package:tryapp/helper/api_helper.dart';
import 'package:tryapp/models/transaction_details.dart';
import 'package:tryapp/ui/pages/home/user_home.dart';

class TransactionController extends GetxController {
  RxList<TransactionDetails> transactions = RxList([]);
  Rx<bool> isLoading = false.obs;
  Rx<bool> isFirstTime = true.obs;

  Future<void> getUsersTransactions({bool shouldReload = false}) async {
    if (isFirstTime.value) {
      isLoading(true);
    }
    APIHelper<List<TransactionDetails>> apiHelper = APIHelper();
    await apiHelper.fetch(
        method: REQMETHOD.get,
        url: getUsersTransactionsUrl,
        isFirstTime: shouldReload,
        parseJsonToObject: (json) {
          transactions([]);

          for (var a in json) {
            transactions.add(TransactionDetails.fromJson(a));
          }
          return transactions;
        });
    if (apiHelper.successfullResponse.value) {
      if (shouldReload) {
        Future.delayed(const Duration(seconds: 3),
            () async => await getUsersTransactions(shouldReload: true));
      }
      isFirstTime(false);
    }
    isLoading(false);
  }

  Future<void> getBusTransactions({bool shouldReload = false}) async {
    if (isFirstTime.value) {
      isLoading(true);
    }
    APIHelper<List<TransactionDetails>> apiHelper = APIHelper();
    await apiHelper.fetch(
        method: REQMETHOD.get,
        url: getBusTransactionsUrl(await BusController().getSelectedBus()),
        isFirstTime: shouldReload,
        parseJsonToObject: (json) {
          transactions([]);

          for (var a in json) {
            transactions.add(TransactionDetails.fromJson(a));
          }
          return transactions;
        });

    if (apiHelper.successfullResponse.value) {
      if (shouldReload) {
        Future.delayed(const Duration(seconds: 3),
            () async => await getBusTransactions(shouldReload: true));
      }
      isFirstTime(false);
    }
    isLoading(false);
  }

  Future<void> withdraw(
      String accountName, String bankName, String bankAccountNumber) async {
    isLoading(true);
    APIHelper<TransactionDetails> apiHelper = APIHelper();
    await apiHelper.fetch(
        method: REQMETHOD.post,
        url: withdrawTransactionUrl,
        body: {
          "busId": await BusController().getSelectedBus(),
          "accountName": accountName,
          "bankName": bankName,
          "bankAccountNumber": bankAccountNumber,
        },
        parseJsonToObject: (json) => TransactionDetails.fromJson(json));
    if (apiHelper.successfullResponse.value) {
      Get.off(() => const UserHome(
            currentPage: 1,
          ));
    }
    isLoading(false);
  }
}
