import 'package:get/get.dart';
import 'package:tryapp/config/constants/urls.dart';
import 'package:tryapp/helper/api_helper.dart';
import 'package:tryapp/models/location_details.dart';

class LocationController extends GetxController {
  RxList<LocationDetails> locations = RxList([]);
  Rx<bool> isLoading = false.obs;
  Future<void> getlocations() async {
    isLoading(true);
    locations([]);
    APIHelper<List<LocationDetails>> apiHelper = APIHelper();
    await apiHelper.fetch(
        method: REQMETHOD.get,
        url: getAllLocationsUrl,
        parseJsonToObject: (json) {
          for (var a in json) {
            locations.add(LocationDetails.fromJson(a));
          }
          return locations;
        });
    isLoading(false);
  }
}
