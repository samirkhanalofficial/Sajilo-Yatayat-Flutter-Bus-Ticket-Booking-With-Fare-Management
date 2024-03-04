import 'package:get/get.dart';
import 'package:tryapp/config/constants/urls.dart';
import 'package:tryapp/controllers/bus_controller.dart';
import 'package:tryapp/helper/api_helper.dart';
import 'package:tryapp/models/transaction_details.dart';

class TransactionController extends GetxController {
  RxList<transactionDetails> transactions = RxList([]);
  Rx<bool> isLoading = false.obs;
  Future<void> getUsersTransactions() async {
    isLoading(true);
    transactions([]);
    APIHelper<List<transactionDetails>> apiHelper = APIHelper();
    await apiHelper.fetch(
        method: REQMETHOD.get,
        url: getUsersTransactionsUrl,
        parseJsonToObject: (json) {
          for (var a in json) {
            transactions.add(transactionDetails.fromJson(a));
          }
          return transactions;
        });
    isLoading(false);
  }

  Future<void> getBusTransactions() async {
    isLoading(true);
    transactions([]);
    APIHelper<List<transactionDetails>> apiHelper = APIHelper();
    await apiHelper.fetch(
        method: REQMETHOD.get,
        url: getBusTransactionsUrl(await BusController().getSelectedBus()),
        parseJsonToObject: (json) {
          for (var a in json) {
            transactions.add(transactionDetails.fromJson(a));
          }
          return transactions;
        });
    isLoading(false);
  }
}
