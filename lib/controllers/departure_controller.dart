import 'package:get/get.dart';
import 'package:tryapp/config/constants/urls.dart';
import 'package:tryapp/controllers/bus_controller.dart';
import 'package:tryapp/helper/api_helper.dart';
import 'package:tryapp/models/departure_details.dart';
import 'package:tryapp/ui/widgets/global/bus/departure_added_sheet.dart';

class DepartureController extends GetxController {
  Rx<bool> isLoading = false.obs;
  Rx<bool> isFirstTime = false.obs;
  RxList<DepartureDetails> departures = RxList<DepartureDetails>([]);
  RxList<int> selectedSeats = RxList<int>([]);
  RxList<int> bookedSeats = RxList<int>([]);
  addDeparture(
    String date,
    String fromlocationId,
    String toLocationId,
    String time,
    double pricePerSeat,
  ) async {
    isLoading(true);
    BusController busController = BusController();
    String busId = await busController.getSelectedBus();
    APIHelper<DepartureDetails> apiHelper = APIHelper<DepartureDetails>();
    await apiHelper.fetch(
        method: REQMETHOD.post,
        successStatusCode: 201,
        body: {
          "bus": busId,
          "from": fromlocationId,
          "to": toLocationId,
          "time": time,
          "date": date,
          "amount": pricePerSeat,
        },
        url: addDepartureUrl,
        parseJsonToObject: (json) => DepartureDetails.fromJson(json));
    if (apiHelper.successfullResponse.value) {
      departures.add(apiHelper.response.value!);
      Get.bottomSheet(
        const DepartureAdded(),
      );
    }
    isLoading(false);
  }

  Future<void> getAllDepartures(
      String date, String fromlocationId, String toLocationId) async {
    isLoading(true);
    departures([]);
    APIHelper<List<DepartureDetails>> apiHelper = APIHelper();
    await apiHelper.fetch(
        method: REQMETHOD.post,
        url: getAllDepartureUrl,
        body: {
          "from": fromlocationId,
          "to": toLocationId,
          "date": date,
        },
        parseJsonToObject: (json) {
          for (var a in json) {
            departures.add(DepartureDetails.fromJson(a));
          }
          return departures;
        });
    isLoading(false);
  }

  Future<void> getBusDepartures() async {
    isLoading(true);
    departures([]);
    APIHelper<List<DepartureDetails>> apiHelper = APIHelper();
    await apiHelper.fetch(
        method: REQMETHOD.get,
        url: getBusDepartureUrl(await BusController().getSelectedBus()),
        parseJsonToObject: (json) {
          for (var a in json) {
            departures.add(DepartureDetails.fromJson(a));
          }
          return departures;
        });
    isLoading(false);
  }

  Future<void> getBookedSeatsByDepartureId(String departureId,
      {bool shouldReload = false}) async {
    if (isFirstTime.value) {
      isLoading(true);
    }
    APIHelper<List<int>> apiHelper = APIHelper();
    await apiHelper.fetch(
        method: REQMETHOD.get,
        isFirstTime: isFirstTime.value,
        url: getBookedSeatByDepartureIdUrl(departureId),
        parseJsonToObject: (json) {
          bookedSeats([]);

          for (int a in json) {
            bookedSeats.add(a);
          }
          return bookedSeats;
        });
    if (apiHelper.successfullResponse.value) {
      for (var sSeat in selectedSeats) {
        if (bookedSeats.contains(sSeat)) {
          selectedSeats.removeWhere((element) => element == sSeat);
        }
      }
      if (shouldReload) {
        Future.delayed(
          const Duration(seconds: 3),
          () async => await getBookedSeatsByDepartureId(
            departureId,
            shouldReload: true,
          ),
        );
      }
      isFirstTime(false);
    }
    isLoading(false);
  }
}
