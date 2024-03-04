import 'package:get/get.dart';
import 'package:tryapp/config/constants/urls.dart';
import 'package:tryapp/controllers/bus_controller.dart';
import 'package:tryapp/helper/api_helper.dart';
import 'package:tryapp/models/transaction_details.dart';
import 'package:tryapp/ui/pages/home/user_home.dart';

class TransactionController extends GetxController {
  RxList<TransactionDetails> transactions = RxList([]);
  Rx<bool> isLoading = false.obs;
  Future<void> getUsersTransactions() async {
    isLoading(true);
    transactions([]);
    APIHelper<List<TransactionDetails>> apiHelper = APIHelper();
    await apiHelper.fetch(
        method: REQMETHOD.get,
        url: getUsersTransactionsUrl,
        parseJsonToObject: (json) {
          for (var a in json) {
            transactions.add(TransactionDetails.fromJson(a));
          }
          return transactions;
        });
    isLoading(false);
  }

  Future<void> getBusTransactions() async {
    isLoading(true);
    transactions([]);
    APIHelper<List<TransactionDetails>> apiHelper = APIHelper();
    await apiHelper.fetch(
        method: REQMETHOD.get,
        url: getBusTransactionsUrl(await BusController().getSelectedBus()),
        parseJsonToObject: (json) {
          for (var a in json) {
            transactions.add(TransactionDetails.fromJson(a));
          }
          return transactions;
        });
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
