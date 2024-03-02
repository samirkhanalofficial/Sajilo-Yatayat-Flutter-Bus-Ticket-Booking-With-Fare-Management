import 'package:get/get.dart';
import 'package:tryapp/config/constants/urls.dart';
import 'package:tryapp/controllers/bus_controller.dart';
import 'package:tryapp/helper/api_helper.dart';
import 'package:tryapp/models/departure_details.dart';

class DepartureController extends GetxController {
  Rx<bool> isLoading = false.obs;
  RxList<DepartureDetails> departures = RxList<DepartureDetails>([]);
  addDeparture(
    String date,
    String from,
    String to,
    String time,
    double amount,
  ) async {
    BusController busController = BusController();
    String busId = await busController.getSelectedBus();
    APIHelper<DepartureDetails> apiHelper = APIHelper<DepartureDetails>();
    await apiHelper.fetch(
        method: REQMETHOD.post,
        successStatusCode: 201,
        body: {
          "busId": busId,
          "from": from,
          "to": to,
          "time": time,
          "amount": amount,
        },
        url: addDepartureUrl,
        parseJsonToObject: (json) => DepartureDetails.fromJson(json));
    if (apiHelper.successfullResponse.value) {
      departures.add(apiHelper.response.value!);
    }
  }
}
