import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class regsiter_page extends StatelessWidget {
  const regsiter_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:[register()]
      ),
    );
  }
}


class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ))!;

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    List<TextEditingController> pinControllers =
    List.generate(4, (index) => TextEditingController());

    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
                children:[
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
                              color: Colors.green, // Replace with your desired color
                            ),
                          ))),

                  Expanded(
                    child: Lottie.asset(
                      'assets/register.json',
                      alignment: Alignment.topCenter,
                      width: double.infinity,
                      height: 400, // Adjust the height as needed
                      fit: BoxFit.fill,
                    ),
                  )]),

            SizedBox(height: 20),
            Container(
                padding: EdgeInsets.all(8),
                child:Column(
                    children:[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("About You", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Let us know more about you.", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                        ],
                      ),
                      SizedBox(height: 15),


                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Full Name", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(height: 10,),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Full Name',
                          labelText: 'Enter your full name',
                          border: OutlineInputBorder( borderRadius: BorderRadius.circular(10)),

                        ),
                      ),
                      SizedBox(height: 10,),
                      Column(
                          children:[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Address", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,)),
                              ],
                            ),
                            SizedBox(height: 10,),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Address',
                                labelText: 'Enter your address',
                                border: OutlineInputBorder( borderRadius: BorderRadius.circular(10)),
                              ),
                            ) ]),
                      SizedBox(height: 10,),
                      Column(
                          children:[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Date of Birth", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,)),
                              ],
                            ),
                            SizedBox(height: 10,),
                             GestureDetector(
                               onTap: () => _selectDate(context),
                                child: AbsorbPointer(
                                   child: TextField(
                                       controller: TextEditingController(
                                           text: "${selectedDate.toLocal()}".split(' ')[0]),

                              decoration: InputDecoration(
                                hintText: 'Date of Birth',
                                labelText: 'Enter your DOB',
                                border: OutlineInputBorder( borderRadius: BorderRadius.circular(10)),
                              ),
                            ))),
                            SizedBox(height: 10,),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Transaction Pin", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,)),
                              ],
                            ),
                          ]),

                      SizedBox(
                          width: screenWidth * 0.9,
                          child: Row(
                            children: List.generate(
                              4,
                                  (index) => Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                  child: TextField(
                                      controller: pinControllers[index],
                                      keyboardType: TextInputType.number,
                                      maxLength: 1,
                                      obscureText: true,
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(10),
                                        counterText: '',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),
                                      onChanged: (String value) {
                                        if (value.length == 1) {
                                          if (index < 3) {
                                            FocusScope.of(context).nextFocus();
                                          } else {
                                            // Keep focus on the last TextField until the correct length is reached
                                            if (pinControllers[3].text.isNotEmpty) {
                                              FocusScope.of(context).unfocus();
                                            }
                                          }
                                        }
                                      }),
                                ),
                              ),
                            ),
                          )),

                      SizedBox(height: 10),
                      Center(
                        child: RichText(
                          text: TextSpan(
                              text: 'NOTE: ',
                              style: TextStyle(color: Colors.blue),
                              children: [
                                TextSpan(
                                    text: 'This pin will be used in every transaction. Never share or show this to anybody.',
                                    style: TextStyle(color: Colors.black)
                                )
                              ]
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth*0.9,
                        height: screenHeight*0.05,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),

                                ),
                                backgroundColor: Colors.green
                            ),
                            onPressed: () {},
                            child: Text('Finish',style: TextStyle(color: Colors.white),)
                        ),
                      ),
                    ]))],
        ),
      ),
    );
  }
}
