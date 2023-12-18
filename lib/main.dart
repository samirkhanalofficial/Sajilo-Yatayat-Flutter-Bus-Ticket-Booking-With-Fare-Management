import 'package:flutter/material.dart';
import 'phone.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sajilo Yatayat',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const RoleSelectionPage(),
    );
  }
}

class RoleSelectionPage extends StatelessWidget {
  const RoleSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),


      body: Column(

        children: [
          Expanded(child:
          Lottie.asset('assets/background_animation.json',
            alignment: Alignment.topCenter,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,

          ),
          ),

          const Text('Sajilo Yatayat',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
          const Text('Everything you need for travel',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Choose your role:',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
              ],
            ),
          ),


          ElevatedButton(
               style: ElevatedButton.styleFrom(
                 primary: Colors.white,
                shape:
                RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // BorderRadius of the button
                side: const BorderSide(color: Colors.green, width: 2), // Border color and width
                   ),

                 ),

            onPressed: () {
              // Navigate to the phone number entry page for passengers
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PhoneNumberEntryPage(role: 'Passenger'),
                ),
              );
            },
            child: const Text('Passenger',style: TextStyle(color: Colors.green,fontSize: 20),textAlign: TextAlign.center,),
          ),
          const SizedBox(height: 20),


          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape:
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // BorderRadius of the button
                side: const BorderSide(color: Colors.green, width: 2), // Border color and width
              ),
            )

            ,
            onPressed: () {
              // Navigate to the phone number entry page for bus owner
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PhoneNumberEntryPage(role: 'Bus Owner'),
                ),
              );
            },
            child: const Text('Bus Owner',style: TextStyle(color: Colors.green,fontSize: 20),textAlign: TextAlign.center,),
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

