import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
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
  Rx<bool> isFirstTime = true.obs;

  Future<List<String>> uploadImages(List<String> imagesFileUrl) async {
    List<String> urls = [];
    for (var a in imagesFileUrl) {
      http.MultipartRequest request = http.MultipartRequest("POST",
          Uri.parse("https://api.cloudinary.com/v1_1/dmybkl5mt/raw/upload"));
      request.fields.addAll({
        "upload_preset": "my-upload",
        "resource_type": "image",
      });
      request.files.add(
        await http.MultipartFile.fromPath('file', a),
      );

      var res = await request.send();
      if (res.statusCode == 200) {
        var resBody = await res.stream.bytesToString();
        urls.add(json.decode(resBody)["secure_url"]);
      } else {
        QuickAlert.show(
          context: Get.context!,
          type: QuickAlertType.error,
          title: 'Error',
          text: "Failed to upload files",
        );
      }
    }
    return urls;
  }

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
    myBuses([]);

    var uploadingImages = await uploadImages(images);
    APIHelper<BusDetails> apiHelper = APIHelper();
    await apiHelper.fetch(
      method: REQMETHOD.post,
      url: addBusUrl,
      successStatusCode: 201,
      body: {
        "images": uploadingImages,
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

  Future<void> getMyBuses({bool shouldReload = false}) async {
    if (isFirstTime.value) {
      isLoading(true);
    }
    APIHelper<List<BusDetails>> apiHelper = APIHelper<List<BusDetails>>();
    await apiHelper.fetch(
        method: REQMETHOD.get,
        isFirstTime: shouldReload,
        url: getmyBusesUrl,
        parseJsonToObject: (json) {
          myBuses([]);

          for (var a in json) {
            myBuses.add(BusDetails.fromJson(a));
          }
          return myBuses;
        });
    if (apiHelper.successfullResponse.value) {
      if (shouldReload) {
        Future.delayed(const Duration(seconds: 3),
            () async => await getMyBuses(shouldReload: true));
      }
      isFirstTime(false);
    }

    isLoading(false);
  }

  Future<void> setSelectedBus(String busId) async {
    try {
      SharedPreferences sf = await SharedPreferences.getInstance();

      FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

      sf.setString("myBusId", busId);
      await firebaseMessaging.subscribeToTopic(busId);
    } catch (e) {
      QuickAlert.show(
        context: Get.context!,
        type: QuickAlertType.error,
        title: 'Error',
        text: e.toString(),
      );
    }
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
