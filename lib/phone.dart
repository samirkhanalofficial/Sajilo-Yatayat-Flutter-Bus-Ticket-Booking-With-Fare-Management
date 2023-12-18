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



      Column(

        children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
              alignment: Alignment.topLeft,
               child:
               IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                    }
                  )
                 )
                ]
               ),

          Expanded(child:
          Lottie.asset('assets/background_animation.json',
            alignment: Alignment.topCenter,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,

          ),
          ),

          const Text('Sajilo Yatayat',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
          const Text('Everything you need for travel',style: TextStyle(fontSize: 20),),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: Center(

              child: InternationalPhoneNumberInput(

                onInputChanged: (PhoneNumber number) {
                  print(number.phoneNumber); // You can store the entered phone number
                  setState(() {
                    pNum = number.phoneNumber!;
                  });
                },
                inputDecoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border:UnderlineInputBorder(),
                ),
              ),

            ),
          ),
             const SizedBox(height: 10),


             Column(
                // crossAxisAlignment: CrossAxisAlignment.end,
               children: [

                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: SizedBox(
                     width: double.infinity,
                     height: 50,
                     child: ElevatedButton(
                       style: ElevatedButton.styleFrom(
                       shape:
                       RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(10), // BorderRadius of the button
                       ),
                         backgroundColor: Colors.green
                       ),


                      onPressed: () {

                        // Do something with the entered phone number
                        print('Entered Phone Number: $pNum');
                      },
                      child: const Text('Login',style: TextStyle(color: Colors.white),),
                                   ),
                   ),
                 ),

               ],
             ),

      Center(
        child: RichText(
          text: const TextSpan(
            text: 'By signing in,you accept our ',
            style: TextStyle(color: Colors.black),
            children: [
              TextSpan(
                text: 'terms & policies.',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
      ),



          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/semi.png'),
            ],
          ),
        ],
      ),
    );
  }
}
