import 'package:get/get.dart';
import 'package:tryapp/config/constants/urls.dart';
import 'package:tryapp/config/routes/routes_names.dart';
import 'package:tryapp/helper/api_helper.dart';
import 'package:tryapp/models/bus_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BusController extends GetxController {
  Rx<String> selectedBus = ''.obs;
  RxList<String> busTypes = RxList([]);
  RxList<BusFeature> busFeatures = RxList([]);
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
      successStatusCode: 201,
      body: {
        "images": images,
        "busnumber": busNumber,
        "yatayat": yatayat,
        "bustype": busType,
        "leftSeats": leftSeats,
        "rightSeats": rightSeats,
        "lastSeats": backSeats,
        "features": features,
      },
      parseJsonToObject: (json) => BusDetails.fromJson(json),
    );
    if (apiHelper.successfullResponse.value) {
      SharedPreferences sf = await SharedPreferences.getInstance();
      myBuses.add(apiHelper.response.value!);
      setSelectedBus(apiHelper.response.value!.id);
      sf.setBool("isLogginned", true);

      Get.offAllNamed(
        RoutesNames.userHomePage,
      );
    }
    isLoading(false);
  }

  Future<void> getMyBuses() async {
    isLoading(true);
    myBuses([]);
    APIHelper<List<BusDetails>> apiHelper = APIHelper<List<BusDetails>>();
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
    selectedBus.value = sf.getString("myBusId") ?? "";
    return selectedBus.value;
  }

  Future<void> getBusTypes() async {
    busTypes = RxList(['AC', 'DELUXE', 'NORMAL', 'SLEEPER']);
  }

  Future<void> getBusFeatures() async {
    busFeatures = RxList([
      BusFeature(
        'WIFI',
        'asset/images/WIFI.png',
      ),
      BusFeature(
        'AC',
        'asset/images/AC.png',
      ),
      BusFeature(
        'TOILET',
        'asset/images/TOILET.png',
      ),
      BusFeature(
        'TV',
        'asset/images/TV.png',
      ),
      BusFeature(
        'FOOD',
        'asset/images/FOOD.png',
      ),
      BusFeature(
        'FAN',
        'asset/images/FAN.png',
      ),
    ]);
  }
}

class BusFeature {
  String name, imageURl;
  BusFeature(this.name, this.imageURl);
}
