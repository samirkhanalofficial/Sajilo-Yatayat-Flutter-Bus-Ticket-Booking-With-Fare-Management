import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:tryapp/config/routes/routes_names.dart';

class reg_page extends StatelessWidget {
  const reg_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: const [reg()]),
    );
  }
}

class reg extends StatefulWidget {
  const reg({super.key});

  @override
  State<reg> createState() => _regState();
}

class _regState extends State<reg> {
  DateTime selectedDate = DateTime.now();
  String selectedGender = ''; // Add a variable to store the selected gender
  String? selectedBusType; // Make selectedBusType nullable
  List<String> busTypes = [
    'Long Distance',
    'Short Distance'
  ]; // List of bus types

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

  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;
  bool isSelected5 = false;
  bool isSelected6 = false;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    const Color green = Color(0xFF0ACF83);

    return Scaffold(
        body: ListView(children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(children: [
          Align(
            alignment: Alignment.topLeft,
            child: TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('< Back'),
            ),
          ),
          Align(
              alignment: Alignment.topRight,
              child: FractionalTranslation(
                  translation: const Offset(0.5, -0.5),
                  child: Container(
                    width: screenWidth * 0.9, // Adjust the size as needed
                    height: screenWidth * 0.8, // Adjust the size as needed
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: green, // Replace with your desired color
                    ),
                  ))),
          Expanded(
            child: Lottie.asset(
              'asset/animations/register.json',
              alignment: Alignment.topCenter,
              width: double.infinity,
              height: 400, // Adjust the height as needed
              fit: BoxFit.fill,
            ),
          )
        ]),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
               Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("About You",
                      style: Theme.of(context).textTheme.titleMedium
                          ),
                ],
              ),
               Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Let us know more about you.",
                      style: Theme.of(context).textTheme.titleSmall

                        ),
                ],
              ),
              const SizedBox(height: 15),
               Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Full Name",
                      style: Theme.of(context).textTheme.titleSmall
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your full name',
                    hintStyle: Theme.of(context).textTheme.bodySmall,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(children: [
                 Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Address",
                        style: Theme.of(context).textTheme.titleSmall
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your address',
                    hintStyle: Theme.of(context).textTheme.bodySmall,

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )
              ]),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                   Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Date of Birth",
                          style: Theme.of(context).textTheme.titleSmall
                      ),
                    ],
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
                            style: Theme.of(context).textTheme.bodySmall,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ))),
                  const SizedBox(
                    height: 10,
                  ),
                   Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Gender",
                          style: Theme.of(context).textTheme.titleSmall
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 'Male',
                        groupValue: selectedGender,
                        onChanged: (String? value) {
                          if (value != null) {
                            // Check for nullability before setting the state
                            setState(() {
                              selectedGender = value;
                            });
                          }
                        },
                      ),
                      const Text('Male'),
                      Radio(
                        value: 'Female',
                        groupValue: selectedGender,
                        onChanged: (String? value) {
                          if (value != null) {
                            // Check for nullability before setting the state
                            setState(() {
                              selectedGender = value;
                            });
                          }
                        },
                      ),
                      const Text('Female'),
                    ],
                  ),

                  const SizedBox(height: 15),
                   Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Bus Number",
                          style: Theme.of(context).textTheme.titleSmall
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'BA 3 JA 1111',
                      hintStyle: Theme.of(context).textTheme.bodySmall,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),

                  const SizedBox(height: 15),
                   Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Yatayat Name",
                          style: Theme.of(context).textTheme.titleSmall
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Sajilo yatayat',
                      hintStyle: Theme.of(context).textTheme.bodySmall,

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                   Row(
                    children: [
                      Text("Bus Type",
                          style: Theme.of(context).textTheme.titleSmall
                      ),
                    ],
                  ),
                  // DropdownButton for bus type selection
                  Container(
                    width: screenWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey, // Set the border color
                        width: 1, // Set the border width
                      ),
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: selectedBusType,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedBusType = newValue!;
                        });
                      },
                      items: busTypes.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      underline: const SizedBox(),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                   Row(
                    children: [
                      Text("Features",
                          style: Theme.of(context).textTheme.titleSmall
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            setState(() {
                              isSelected1 = !isSelected1;
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                border: isSelected1
                                    ? Border.all(color: Colors.blue, width: 2.0)
                                    : null,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Image.asset('asset/images/wifi.png'))),
                      const SizedBox(
                        width: 30,
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {
                              isSelected2 = !isSelected2;
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                border: isSelected2
                                    ? Border.all(color: Colors.blue, width: 2.0)
                                    : null,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Image.asset('asset/images/AC.png'))),
                      const SizedBox(
                        width: 30,
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {
                              isSelected3 = !isSelected3;
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                border: isSelected3
                                    ? Border.all(color: Colors.blue, width: 2.0)
                                    : null,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Image.asset('asset/images/bathroom.png'))),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            setState(() {
                              isSelected4 = !isSelected4;
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                border: isSelected4
                                    ? Border.all(color: Colors.blue, width: 2.0)
                                    : null,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Image.asset('asset/images/monitor.png'))),
                      const SizedBox(
                        width: 30,
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {
                              isSelected5 = !isSelected5;
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                border: isSelected5
                                    ? Border.all(color: Colors.blue, width: 2.0)
                                    : null,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Image.asset('asset/images/food.png'))),
                      const SizedBox(
                        width: 30,
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {
                              isSelected6 = !isSelected6;
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                border: isSelected6
                                    ? Border.all(color: Colors.blue, width: 2.0)
                                    : null,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Image.asset('asset/images/fan.png'))),
                    ],
                  ),
                  const SizedBox(height: 15),
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Seats planning(No of seats)",
                          style: Theme.of(context).textTheme.titleSmall
                      ),
                    ],
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                             Row(
                              children: [
                                Text("Side A",
                                ),
                              ],
                            ),
                            TextField(
                              decoration: InputDecoration(
                                hintText: '10',
                                hintStyle: Theme.of(context).textTheme.bodySmall,

                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Text("Side B"),
                              ],
                            ),
                            TextField(
                              decoration: InputDecoration(
                                hintText: '10',
                                hintStyle: Theme.of(context).textTheme.bodySmall,

                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                   Row(
                    children: [
                      Text("Last seat",
                          style: Theme.of(context).textTheme.titleSmall
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: '10',
                      hintStyle: Theme.of(context).textTheme.bodySmall,

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: RichText(
                  text: const TextSpan(
                      text: 'NOTE: ',
                      style: TextStyle(color: Colors.blue),
                      children: [
                        TextSpan(
                            text:
                                'This pin will be used in every transaction. Never share or show this to anybody.',
                            style: TextStyle(color: Colors.black))
                      ]),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: screenWidth * 0.9,
                height: screenHeight * 0.05,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(RoutesNames.bus);
                  },
                  child: const Text('Finish'),
                ),
              ),
            ],
          ),
        )
      ])
    ]));
  }
}
