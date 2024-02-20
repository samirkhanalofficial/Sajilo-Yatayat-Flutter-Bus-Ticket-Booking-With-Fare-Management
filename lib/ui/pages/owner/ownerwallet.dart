import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tryapp/config/routes/routes_names.dart';

class ownerwallet extends StatefulWidget {
  const ownerwallet({super.key});

  @override
  _ownerwalletState createState() => _ownerwalletState();
}

class _ownerwalletState extends State<ownerwallet> {
  @override
  Widget build(BuildContext context) {
    const Color green = Color(0xFF0ACF83);

    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    bool isVisible = false;

    return Scaffold(
      body: Stack(
        children: [ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome",
                    style: Theme.of(context).textTheme.titleSmall,

                  ),
                  Text(
                    "Ritesh",
                    style: Theme.of(context).textTheme.titleLarge,
                  )
                ],
              ),
            ),
            Stack(children: [
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
                padding: const EdgeInsets.fromLTRB(8, 0, 5, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(color: green),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          color: Colors.white),
                      child: Column(
                        children: [
                          IconButton(
                              onPressed: () {

                              },
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.white,
                              ),
                              icon: Image.asset('asset/images/walletadd1.png')),
                          const Text('Withdraw'),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset('asset/images/activity.png'),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Transaction History",
                          style: Theme.of(context).textTheme.titleMedium),
                      const Text(
                        "This is the history of your spending and top ups",
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('#kfhhdkhfierie'),
                          Text(
                            'Booking',
                            style: TextStyle(color: green),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      const Row(children: [
                        Text(
                          'Rs.500',
                          style: TextStyle(color: green),
                        )
                      ]),
                      const SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Text('Khalti',style: Theme.of(context).textTheme.bodySmall,),
                          Image.asset('asset/images/login1.png')
                        ],
                      ),
                      const SizedBox(height: 10,),
                       Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                        Text(
                          'Rs.5679',
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ]),

                    ],
                  ),
                )),
            Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('#rietueitueihfjh'),
                          Text(
                            'Withdraw',
                            style: TextStyle(color: Colors.yellow),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      const Row(children: [
                        Text(
                          'Rs.50',
                          style: TextStyle(color: green),
                        )
                      ]),
                      const SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Khalti',style: Theme.of(context).textTheme.bodySmall,),
                          Image.asset('asset/images/login2.png')
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Rs.5179',
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ]),

                    ],
                  ),
                )),Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('#egdgdggwwrrtt'),
                          Text(
                            'Withdraw',
                            style: TextStyle(color: green),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      const Row(children: [
                        Text(
                          'Rs.300',
                          style: TextStyle(color: Colors.red),
                        )
                      ]),
                      const SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Khalti',style: Theme.of(context).textTheme.bodySmall,),
                          Image.asset('asset/images/login3.png')
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Rs.5479',
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ]),



                    ],
                  ),
                )),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Center(
                      child: ElevatedButton(onPressed: (){
                        // setState(() {
                        //   isVisible = !isVisible;
                        // });
                      },
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
                        } ,
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            icon:Image.asset('asset/images/wallet1.png')),
                        IconButton(onPressed:(){
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
              ),
            ),



          ],
        ),




          // Positioned(
          //   bottom: 10,
          //   left: 40,
          //   right: 0,
          //   child: AnimatedContainer(
          //     duration: const Duration(milliseconds: 500),
          //     curve: Curves.easeInOut,
          //     height: isVisible ? screenHeight:0,
          //     child: Container(
          //       height: screenHeight,
          //       decoration: const BoxDecoration(
          //           color: Colors.white,
          //           borderRadius: BorderRadius.only(
          //               topRight: Radius.circular(20),
          //               topLeft: Radius.circular(20))),
          //       padding: const EdgeInsets.all(10),
          //       child: Column(
          //         children: [
          //           const SizedBox(
          //             height: 20,
          //           ),
          //           Row(
          //             children: [
          //               Text(
          //                 'Withdraw',
          //                 style: Theme.of(context).textTheme.titleLarge,
          //               ),
          //             ],
          //           ),
          //           const SizedBox(
          //             height: 5,
          //           ),
          //           Row(
          //             children: [
          //               Text('We will load money to this bank account.',
          //                   style: Theme.of(context).textTheme.bodySmall),
          //             ],
          //           ),
          //           const SizedBox(
          //             height: 10,
          //           ),
          //           Row(
          //             children: [
          //               Text('Amount(Rs.)',
          //                   style: Theme.of(context).textTheme.bodyMedium),
          //             ],
          //           ),
          //           const TextField(
          //             decoration: InputDecoration(hintText: '999'),
          //           ),
          //           const SizedBox(
          //             height: 10,
          //           ),
          //           Row(
          //             children: [
          //               Text('Full Name in Bank',
          //                   style: Theme.of(context).textTheme.bodyMedium),
          //             ],
          //           ),
          //           const TextField(
          //             decoration: InputDecoration(hintText: 'Ritesh Karmacharya'),
          //           ),
          //           const SizedBox(
          //             height: 10,
          //           ),
          //           Row(
          //             children: [
          //               Text('Bank Name',
          //                   style: Theme.of(context).textTheme.bodyMedium),
          //             ],
          //           ),
          //           const TextField(
          //             decoration: InputDecoration(hintText: 'Nepal Bank Limited'),
          //           ),
          //           const SizedBox(
          //             height: 10,
          //           ),
          //           Row(
          //             children: [
          //               Text('Bank Account Number',
          //                   style: Theme.of(context).textTheme.bodyMedium),
          //             ],
          //           ),
          //           const TextField(
          //             decoration: InputDecoration(hintText: 'XXXXXXXXXXXXXXXX'),
          //           ),
          //           Expanded(child: Container()),
          //           ElevatedButton(
          //             onPressed: () {
          //               Get.toNamed(RoutesNames.otpVerificationPage);
          //             },
          //             child: const Text('Withdraw'),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ]
      ),
    );
  }
}
