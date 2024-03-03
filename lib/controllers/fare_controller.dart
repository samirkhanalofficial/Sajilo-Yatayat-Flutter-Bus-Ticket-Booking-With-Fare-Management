import 'package:get/get.dart';
import 'package:tryapp/config/constants/urls.dart';
import 'package:tryapp/controllers/bus_controller.dart';
import 'package:tryapp/helper/api_helper.dart';
import 'package:tryapp/models/fare_details.dart';

class FareController extends GetxController {
  Rx<bool> isLoading = false.obs;
  RxList<FareDetails> fares = RxList<FareDetails>([]);
  addFare(
    String departureId,
    List<int> seats,
    double amount,
  ) async {
    isLoading(true);
    APIHelper<FareDetails> apiHelper = APIHelper<FareDetails>();
    await apiHelper.fetch(
        method: REQMETHOD.post,
        successStatusCode: 201,
        body: {
          "departure": departureId,
          "seats": seats,
          "amount": amount,
        },
        url: addFareUrl,
        parseJsonToObject: (json) => FareDetails.fromJson(json));
    if (apiHelper.successfullResponse.value) {
      fares.add(apiHelper.response.value!);
    }
    isLoading(false);
  }

  Future<void> getUsersFare() async {
    isLoading(true);
    fares([]);
    APIHelper<List<FareDetails>> apiHelper = APIHelper();
    await apiHelper.fetch(
        method: REQMETHOD.get,
        url: getUserFareUrl,
        parseJsonToObject: (json) {
          for (var a in json) {
            fares.add(FareDetails.fromJson(a));
          }
          return fares;
        });
    isLoading(false);
  }

  Future<void> getBusFares() async {
    isLoading(true);
    fares([]);
    APIHelper<List<FareDetails>> apiHelper = APIHelper();
    await apiHelper.fetch(
        method: REQMETHOD.get,
        url: getBusFaresUrl(await BusController().getSelectedBus()),
        parseJsonToObject: (json) {
          for (var a in json) {
            fares.add(FareDetails.fromJson(a));
          }
          return fares;
        });
    isLoading(false);
  }

  Future<void> acceptFare(String fareId) async {
    isLoading(true);
    fares([]);
    APIHelper<List<FareDetails>> apiHelper = APIHelper();
    await apiHelper.fetch(
        method: REQMETHOD.patch,
        url: getBusFaresUrl(await BusController().getSelectedBus()),
        parseJsonToObject: (json) {
          for (var a in json) {
            fares.add(FareDetails.fromJson(a));
          }
          return fares;
        });
    isLoading(false);
  }
}
