import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:tryapp/config/colors/app_color.dart';
import 'package:tryapp/controllers/bus_controller.dart';
import 'package:tryapp/ui/widgets/global/loading_botton.dart';

class AddBusPage extends StatefulWidget {
  const AddBusPage({super.key});

  @override
  State<AddBusPage> createState() => _AddBusPageState();
}

class _AddBusPageState extends State<AddBusPage> {
  final BusController busController = (BusController());
  final busNumberController = TextEditingController();
  final yatayatController = TextEditingController();
  final leftSeatsController = TextEditingController();
  final rightSeatsController = TextEditingController();
  final backSeatsController = TextEditingController();
  List<String> imagess = [];
  List<String> busFeatures = [];

  String? selectedBusType; // Make selectedBusType nullable
  @override
  void initState() {
    busController.getBusTypes();
    busController.getBusFeatures();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: -90,
            right: -100,
            child: Hero(
              tag: 'circle',
              child: Container(
                width: 330,
                height: 250,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor),
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Lottie.asset(
                    'asset/animations/user.json',
                    height: MediaQuery.of(context).size.height * 0.35,
                    animate: true,
                    repeat: true,
                  ),

                  const SizedBox(
                    height: 60,
                  ),
                  Text('Add Your Bus',
                      style: Theme.of(context).textTheme.titleLarge),
                  Text(
                    'Let us know about your Bus',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: PageView(
                      controller: PageController(
                        initialPage: 0,
                        viewportFraction: 0.9,
                      ),
                      children: [
                        ...imagess.map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(19),
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    top: 0,
                                    bottom: 0,
                                    child: Container(
                                      color: Colors.black,
                                      child: Image.file(
                                        File(e),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      right: 10,
                                      top: 10,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.red,
                                        radius: 15,
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.close,
                                            size: 15,
                                          ),
                                          onPressed: () {
                                            imagess.removeWhere(
                                                (element) => element == e);
                                            setState(() {});
                                          },
                                          color: Colors.white,
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (imagess.length < 3)
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColor().primary,
                                width: 3,
                              ),
                            ),
                            child: Center(
                              child: SizedBox(
                                height: 70,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 25,
                                    vertical: 8,
                                  ),
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      ImagePicker()
                                          .pickImage(
                                              source: ImageSource.gallery)
                                          .then((value) {
                                        if (value != null) {
                                          imagess.add(value.path);
                                        }

                                        setState(() {});
                                      });
                                    },
                                    icon: const Icon(Icons.upload),
                                    label: const Text("Upload a bus image"),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text('Bus Number',
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: busNumberController,
                    decoration: const InputDecoration(
                      hintText: 'SE 3 PA 3555',
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text('Yatayat Name',
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: yatayatController,
                    decoration: const InputDecoration(
                      hintText: 'Khaptad Yatayad',
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text('Bus Type',
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(
                    height: 16,
                  ),
                  //for selecting Bus
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color.fromRGBO(241, 240, 238, 1),
                    ),
                    child: Obx(
                      () => DropdownButton<String>(
                        hint: const Text('Choose Bus Type'),
                        dropdownColor: const Color.fromRGBO(241, 240, 238, 1),
                        borderRadius: BorderRadius.circular(16),
                        isExpanded: true,
                        value: selectedBusType,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedBusType = newValue!;
                          });
                        },
                        items: busController.busTypes.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        underline: const SizedBox(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text('Features',
                      style: Theme.of(context).textTheme.titleSmall),
                  Obx(
                    () => GridView.count(
                      shrinkWrap: true,
                      mainAxisSpacing: 0.1,
                      crossAxisCount: 3,
                      children: [
                        ...busController.busFeatures.map((feature) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (busFeatures.contains(feature.name)) {
                                      busFeatures.remove(feature.name);
                                    } else {
                                      busFeatures.add(feature.name);
                                    }
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: busFeatures.contains(feature.name)
                                        ? AppColor().primary
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.asset(
                                    feature.imageURl,
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: Text('Seats Planning (No of seats)',
                        style: Theme.of(context).textTheme.titleSmall),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Side A',
                              style: Theme.of(context).textTheme.titleSmall),
                          const SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            width: 150,
                            child: TextField(
                              controller: leftSeatsController,
                              decoration: const InputDecoration(
                                hintText: '10',
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Side B',
                              style: Theme.of(context).textTheme.titleSmall),
                          const SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            width: 150,
                            child: TextField(
                              controller: rightSeatsController,
                              decoration: const InputDecoration(
                                hintText: '10',
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  Text('Last Seat',
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: backSeatsController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: '10',
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Obx(
                    () => LoadingButton(
                      onClick: () {
                        busController.addBus(
                            imagess,
                            busNumberController.text,
                            yatayatController.text,
                            selectedBusType ?? "",
                            leftSeatsController.text,
                            rightSeatsController.text,
                            backSeatsController.text,
                            busFeatures);
                      },
                      buttonName: 'Add Bus',
                      loading: busController.isLoading.value,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
