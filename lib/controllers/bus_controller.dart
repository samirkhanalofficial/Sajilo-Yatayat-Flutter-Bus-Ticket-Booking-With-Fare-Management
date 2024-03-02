import 'package:get/get.dart';
import 'package:tryapp/config/constants/urls.dart';
import 'package:tryapp/helper/api_helper.dart';
import 'package:tryapp/models/bus_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BusController extends GetxController {
  Rx<bool> isLoading = false.obs;
  RxList<BusDetails> myBuses = RxList<BusDetails>([]);
  Future<void> addBus(
    List<String> images,
    String busNumber,
    String yatayat,
    String busType,
    String leftSeats,
    String rightSeats,
    String backSeats,
    List<String> features,
  ) async {
    isLoading(true);
    APIHelper<BusDetails> apiHelper = APIHelper();
    await apiHelper.fetch(
      method: REQMETHOD.post,
      url: addBusUrl,
      parseJsonToObject: (json) => BusDetails.fromJson(json),
    );
    if (apiHelper.successfullResponse.value) {
      myBuses.add(apiHelper.response.value!);
    }
    isLoading(false);
  }

  Future<void> getMyBuses() async {
    isLoading(true);
    myBuses([]);
    APIHelper<List<BusDetails>> apiHelper = APIHelper();
    await apiHelper.fetch(
        method: REQMETHOD.get,
        url: getmyBusesUrl,
        parseJsonToObject: (json) {
          for (var a in json) {
            myBuses.add(BusDetails.fromJson(a));
          }
          return myBuses;
        });
    isLoading(false);
  }

  Future<void> setSelectedBus(String busId) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    sf.setString("myBusId", busId);
  }

  Future<String> getSelectedBus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    String selectedBus = sf.getString("myBusId") ?? "";
    return selectedBus;
  }
}
