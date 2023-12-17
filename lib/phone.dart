import 'package:flutter/material.dart';
import 'verify_otp.dart';
import 'package:lottie/lottie.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneNumberEntryPage extends StatelessWidget {
  final String role;

  const PhoneNumberEntryPage({super.key, required this.role});
  void next(){

  }
  @override
  Widget build(BuildContext context) {

    return const Scaffold(


      body:
      Stack(

        children: [
          


          phone_number(),



        ],
      ),
    );
  }
}

class phone_number extends StatefulWidget {
  const phone_number({super.key});

  @override
  State<phone_number> createState() => _phone_numberState();
}

class _phone_numberState extends State<phone_number> {
  String pNum='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:



      Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(

          children: [
            Expanded(child:
            Lottie.asset('assets/background_animation.json',
              alignment: Alignment.topCenter,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fitWidth,

            ),
            ),

            const Text('Sajilo Yatayat',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
            const Text('Everything you need for travel',style: TextStyle(fontSize: 20),),
            Center(

              child: InternationalPhoneNumberInput(

                onInputChanged: (PhoneNumber number) {
                  print(number.phoneNumber); // You can store the entered phone number
                  setState(() {
                    pNum = number.phoneNumber!;
                  });
                },
                inputDecoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
              ),

            ),


               Column(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                 children: [

                   ElevatedButton(


                    onPressed: () {

                      // Do something with the entered phone number
                      print('Entered Phone Number: $pNum');
                    },
                    child: const Text('Submit'),
                                 ),
                 ],
               ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/semi.png'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
