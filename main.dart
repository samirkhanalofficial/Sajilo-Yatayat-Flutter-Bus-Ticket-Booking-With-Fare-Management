import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SAJILOYATAYAT(),
  ));
}

class SAJILOYATAYAT extends StatefulWidget {
  const SAJILOYATAYAT({super.key});

  @override
  State<SAJILOYATAYAT> createState() => _SAJILOYATAYATState();
}

class _SAJILOYATAYATState extends State<SAJILOYATAYAT> {
  final TextEditingController _pinController1 = TextEditingController();
  final TextEditingController _pinController2 = TextEditingController();
  final TextEditingController _pinController3 = TextEditingController();
  final TextEditingController _pinController4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children:[
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                'assets/circle.png',
                height: 200, // Adjust the height as needed
              ),
            ),

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

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Date of Birth", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'Date of Brith',
                labelText: 'Enter your date of birth',
                border: OutlineInputBorder( borderRadius: BorderRadius.circular(10)),
              )),

              SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Transaction pin", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
              ],
            ),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    
                    controller: _pinController1,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    obscureText: false,
                    textAlign: TextAlign.center,

                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        counterText: '',
                        border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)
                        ),
                    ),
                    onChanged: (String value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                ),
                SizedBox(width: 30),
                Expanded(
                  child: TextField(
                    controller: _pinController2,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    obscureText: false,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),

                      counterText: '',
                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                    onChanged: (String value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                ),
                SizedBox(width: 30),
                Expanded(
                  child: TextField(
                    controller: _pinController3,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    obscureText: false,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),

                      counterText: '',
                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                    onChanged: (String value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                ),
                SizedBox(width: 30),
                Expanded(
                  child: TextField(
                    controller: _pinController4,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    obscureText: false,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),

                      counterText: '',
                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                    onChanged: (String value) {
                      if (value.length == 1) {
                        FocusScope.of(context).unfocus();
                      }
                    },
                  ),
                ),
              ],
            ),

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
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
            ),
           ]))],
        ),
      ),
    );
  }
}
