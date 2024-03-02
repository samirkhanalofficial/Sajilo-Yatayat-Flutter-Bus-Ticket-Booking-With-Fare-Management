import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:tryapp/config/routes/routes_names.dart';


class bus extends StatelessWidget {
  const bus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: const [bus_status()]),
    );
  }
}

class bus_status extends StatefulWidget {
  const bus_status({super.key});

  @override
  State<bus_status> createState() => _bus_statusState();
}

class _bus_statusState extends State<bus_status> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ))!;

    if (picked != true && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  List<TextEditingController> pinControllers =
  List.generate(4, (index) => TextEditingController());
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    TextEditingController _addressController = TextEditingController();
    const Color green = Color(0xFF0ACF83);
    const Color grey = Color(0xf1f0ee );

    final defaultPinTheme = PinTheme(
      width: 50,
      height: 55,
      textStyle: const TextStyle(
          fontSize: 20, color: Color(0xFF0ACF83), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F0EE),
        border: Border.all(
          color: const Color(0xFFF1F0EE),
        ),
        borderRadius: BorderRadius.circular(16),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Theme.of(context).primaryColor),
      borderRadius: BorderRadius.circular(16),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color(0xFFF1F0EE),
      ),
    );

    return Scaffold(
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Ritesh",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: green),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset('asset/images/wallet.png'),
                        const SizedBox(
                          width: 10,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "My balance",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                            Text(
                              "RS.",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(55, 0, 0, 0),
                          child: const Text(
                            "5455",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        const Text(
                          "This balance can be used to book  bus , pay for booking or  ride.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
             Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(onPressed: (){
                    Get.toNamed(RoutesNames.dep);
                  }, child: Text('View Departure'))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset('asset/images/Vector.png'),
                  SizedBox(width: 10,),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Departure status",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Book long distance tickets of desire bus",
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    "From",
                      style: Theme.of(context).textTheme.bodyMedium
                  ),
                  TextField(
                    controller: _addressController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: 'Enter Address',labelStyle: Theme.of(context).textTheme.bodySmall
                    ,
                      prefixIcon: SizedBox(
                          width: 24,
                          height: 24,
                          child: Image.asset('asset/images/Vector.png')), // Icon added here
                    ),
                    onTap: () async {
                      Prediction? p = await PlacesAutocomplete.show(
                        context: context,
                        apiKey: 'YOUR_GOOGLE_MAPS_API_KEY',
                        mode: Mode.fullscreen,
                      );

                      if (p != null) {
                        // Handle selected address
                        _addressController.text = p.description!;
                      }
                    },
                  ),
                   Text(
                    "To",
                      style: Theme.of(context).textTheme.bodyMedium
                  ),
                  TextField(
                    controller: _addressController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: 'Enter Address',labelStyle: Theme.of(context).textTheme.bodySmall,
                      prefixIcon: SizedBox(
                          width: 24,
                          height: 24,
                          child: Image.asset('asset/images/Vector.png')), // Icon added here
                    ),
                    onTap: () async {
                      Prediction? p = await PlacesAutocomplete.show(
                        context: context,
                        apiKey: 'YOUR_GOOGLE_MAPS_API_KEY',
                        mode: Mode.fullscreen,
                      );

                      if (p != null) {
                        // Handle selected address
                        _addressController.text = p.description!;
                      }
                    },
                  ),
                   Text(
                    "Date & Time",
                    style: Theme.of(context).textTheme.bodyMedium
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                      onTap: () => _selectDate(context),
                      child: AbsorbPointer(
                          child: TextField(
                            controller: TextEditingController(
                                text: "${selectedDate.toLocal()}".split(' ')[0]),
                            decoration: InputDecoration(
                              prefixIcon: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Image.asset('asset/images/Vector.png')),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            style: Theme.of(context).textTheme.bodySmall,

                          ))),
                   Text(
                    "Price per seat",
                      style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(
                    height: 10,
                  ),

                  Pinput(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    length: 4,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    width: screenWidth,
                    child: ElevatedButton(onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: green,
                        foregroundColor: Colors.white,

                      ),
                      child:
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add),
                          SizedBox(width: 8,),
                          Text("ADD")

                        ],
                      ),


                    ),

                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  Center(
                    child: ElevatedButton(onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        shape:const CircleBorder(),
                        backgroundColor: green,
                        foregroundColor: Colors.white,

                      ),
                      child:
                      Image.asset('asset/images/scan.png'),


                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed:(){
                      } ,
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          icon:Image.asset('asset/images/home.png')),
                      IconButton(onPressed:(){
                        Get.toNamed(RoutesNames.wallet);
                      } ,
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          icon:Image.asset('asset/images/wallet1.png')),
                      IconButton(onPressed:(){
                        Get.toNamed(RoutesNames.booking);
                      } ,
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          icon:Image.asset('asset/images/ticket.png')),
                      IconButton(onPressed: (){
                        Get.toNamed(RoutesNames.ownerProfile);
                      },
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          icon: Image.asset('asset/images/profile1.png'))
                    ],
                  )

                ],
              ),
            )
          ],
        ));
  }
}
