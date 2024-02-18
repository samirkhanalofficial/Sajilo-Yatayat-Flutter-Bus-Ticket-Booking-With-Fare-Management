import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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

  @override
  Widget build(BuildContext context) {

    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    const Color green = Color(0xFF0ACF83);

    return Scaffold(
        body: ListView(
            children:[
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Stack(children: [
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            icon: const Row(children: [
              Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              Text(
                'Back',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ]),
            onPressed: () {
              Navigator.pop(context);
            },
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
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("About You",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ],
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Let us know more about you.",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
              ],
            ),
            const SizedBox(height: 15),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Full Name",
                    style:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Full Name',
                labelText: 'Enter your full name',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(children: [
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Address",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Address',
                  labelText: 'Enter your address',
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
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Date of Birth",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        )),
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
                      decoration: InputDecoration(
                        hintText: 'Date of Birth',
                        labelText: 'Enter your DOB',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ))),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Gender",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        )),
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
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Bus Number",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'BA 3 JA 1111',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),

                const SizedBox(height: 15),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Yatayat Name",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Sajilo yatayat',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  children: [
                    Text("Bus Type",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold)),
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
                const Row(
                  children: [
                    Text("Features",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold)),
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                        onTap: () {},
                        child: Container(
                            decoration: const BoxDecoration(),
                            child: Image.asset('asset/images/wifi.png'))),
                    const SizedBox(
                      width: 30,
                    ),
                    InkWell(
                        onTap: () {},
                        child: Container(
                            decoration: const BoxDecoration(),
                            child: Image.asset('asset/images/AC.png'))),
                    const SizedBox(
                      width: 30,
                    ),
                    InkWell(
                        onTap: () {},
                        child: Container(
                            decoration: const BoxDecoration(),
                            child: Image.asset('asset/images/bathroom.png'))),
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                        onTap: () {},
                        child: Container(
                            decoration: const BoxDecoration(),
                            child: Image.asset('asset/images/monitor.png'))),
                    const SizedBox(
                      width: 30,
                    ),
                    InkWell(
                        onTap: () {},
                        child: Container(
                            decoration: const BoxDecoration(),
                            child: Image.asset('asset/images/food.png'))),
                    const SizedBox(
                      width: 30,
                    ),
                    InkWell(
                        onTap: () {},
                        child: Container(
                            decoration: const BoxDecoration(),
                            child: Image.asset('asset/images/fan.png'))),
                  ],
                ),
                const SizedBox(height: 15),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Seats planning(No of seats)",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold)),
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              Text("Side A"),
                            ],
                          ),
                          TextField(
                            decoration: InputDecoration(
                              hintText: '10',
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

                const Row(
                  children: [
                    Text("Last seat",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: '10',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
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
              width: screenWidth * 0.9,
              height: screenHeight * 0.05,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: green),
                  onPressed: () {
                  },
                  child: const Text(
                    'Finish',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ),
      )
    ])
    ]
        ));
  }
}
