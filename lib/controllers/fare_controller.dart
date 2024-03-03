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
    APIHelper<FareDetails> apiHelper = APIHelper();
    await apiHelper.fetch(
        method: REQMETHOD.patch,
        url: acceptFareUrl(fareId),
        parseJsonToObject: (json) => FareDetails.fromJson(json));
    if (apiHelper.successfullResponse.value) {
      fares.firstWhere((element) => element.id == fareId).status =
          apiHelper.response.value!.status;
    }
    isLoading(false);
  }

  Future<void> rejectFare(String fareId) async {
    isLoading(true);
    fares([]);
    APIHelper<FareDetails> apiHelper = APIHelper();
    await apiHelper.fetch(
        method: REQMETHOD.patch,
        url: rejectFareUrl(fareId),
        parseJsonToObject: (json) => FareDetails.fromJson(json));
    if (apiHelper.successfullResponse.value) {
      fares.firstWhere((element) => element.id == fareId).status =
          apiHelper.response.value!.status;
    }
    isLoading(false);
  }

  Future<void> cancelFare(String fareId) async {
    isLoading(true);
    fares([]);
    APIHelper<FareDetails> apiHelper = APIHelper();
    await apiHelper.fetch(
        method: REQMETHOD.patch,
        url: cancelFareUrl(fareId),
        parseJsonToObject: (json) => FareDetails.fromJson(json));
    if (apiHelper.successfullResponse.value) {
      fares.firstWhere((element) => element.id == fareId).status =
          apiHelper.response.value!.status;
    }
    isLoading(false);
  }

  Future<void> completeFare(String fareId) async {
    isLoading(true);
    fares([]);
    APIHelper<FareDetails> apiHelper = APIHelper();
    await apiHelper.fetch(
        method: REQMETHOD.patch,
        url: completeFareUrl(fareId),
        parseJsonToObject: (json) => FareDetails.fromJson(json));
    if (apiHelper.successfullResponse.value) {
      fares.firstWhere((element) => element.id == fareId).status =
          apiHelper.response.value!.status;
    }
    isLoading(false);
  }

  Future<void> changePriceAndOfferFare(String fareId, double amount) async {
    isLoading(true);
    fares([]);
    APIHelper<FareDetails> apiHelper = APIHelper();
    await apiHelper.fetch(
        method: REQMETHOD.patch,
        body: {
          "amount": amount,
        },
        url: changePriceAndOfferFareUrl(fareId),
        parseJsonToObject: (json) => FareDetails.fromJson(json));
    if (apiHelper.successfullResponse.value) {
      fares.firstWhere((element) => element.id == fareId).status =
          apiHelper.response.value!.status;
      fares.firstWhere((element) => element.id == fareId).amount =
          apiHelper.response.value!.amount;
    }
    isLoading(false);
  }
}
