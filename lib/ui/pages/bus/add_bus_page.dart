import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:tryapp/controllers/bus_controller.dart';
import 'package:tryapp/ui/widgets/global/loading_botton.dart';

class AddBusPage extends StatefulWidget {
  const AddBusPage({super.key});

  @override
  State<AddBusPage> createState() => _AddBusPageState();
}

class _AddBusPageState extends State<AddBusPage> {
  final BusController busController = Get.put(BusController());
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
                  Text('Your Bus',
                      style: Theme.of(context).textTheme.titleLarge),
                  Text(
                    'Let us know about your Bus',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text('Bus Number',
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(
                    height: 16,
                  ),
                  const TextField(
                    // controller: nameController,
                    decoration: InputDecoration(
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
                  const TextField(
                    // controller: addressController,
                    decoration: InputDecoration(
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
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Iconsax.wifi_square),
                      ),
                      Image.asset(
                        'asset/images/logo.png',
                        height: 42,
                        width: 34,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Iconsax.monitor),
                      )
                    ],
                  ),
                  // Obx(
                  //   () => GridView.count(
                  //     crossAxisCount: 3,
                  //     children: List.generate(
                  //       busController.busFeatures.length,
                  //       (data) {
                  //         return Image.asset(
                  //           'asset/images/logo.png',
                  //           height: 42,
                  //           width: 34,
                  //         );
                  //       },
                  //     ),
                  //   ),
                  // ),

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
                          const SizedBox(
                            width: 150,
                            child: TextField(
                              // controller: addressController,
                              decoration: InputDecoration(
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
                          const SizedBox(
                            width: 150,
                            child: TextField(
                              // controller: addressController,
                              decoration: InputDecoration(
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
                  const TextField(
                    // controller: addressController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '10',
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  LoadingButton(
                    onClick: () {},
                    buttonName: 'Finsish',
                    loading: busController.isLoading.value,
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
