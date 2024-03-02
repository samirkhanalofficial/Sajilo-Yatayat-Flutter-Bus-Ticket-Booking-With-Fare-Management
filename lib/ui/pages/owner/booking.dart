import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tryapp/config/routes/routes_names.dart';

class booking extends StatefulWidget {
  const booking({super.key});

  @override
  State<booking> createState() => _bookingState();
}

class _bookingState extends State<booking> {
  bool isVisible = false;
  bool fare=false;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    const Color green = Color(0xFF0ACF83);
    print(isVisible);
    print(fare);

    return Scaffold(
      body: Stack(
        children: [ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset('asset/images/activity.png'),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Bookings',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        'This is the list of your bookings.',
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF5A5858)),
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('#kfdkfjkdkdkgjk',
                        style: TextStyle(color: Colors.grey.withOpacity(0.7))),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Dang to Kathmandu'),
                        Text(
                          'Booked',
                          style: TextStyle(color: Colors.green),
                        )
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Rs.1500(Seat A5)'), Text('10:15 PM')],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Ritesh Karmacharya',
                                style: TextStyle(color: Colors.red)),
                            Text('Seats: A5,B2,A3')
                          ],
                        ),
                        Text('2024-02-21')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Image.asset('asset/images/smallqr.png'),
                                const Text('Show QR'),
                              ],
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Image.asset('asset/images/call.png'),
                                const Text('Call'),
                              ],
                            )),
                        TextButton(
                            onPressed: () {
                              Get.toNamed(RoutesNames.cancel);
                            },
                            child: Row(
                              children: [
                                Image.asset('asset/images/closesquare.png'),
                                const Text(
                                  'Cancel',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF5A5858)),
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Dang to Kathmandu'),
                        Text(
                          'Cancelled',
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Rs.1500'), Text('10:15 PM')],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'BA 2 KHA 000',
                              style: TextStyle(color: Colors.red),
                            ),
                            const Text('Seats: A5'),
                            Text(
                              '#kfdkfjkdkdkgjk',
                              style:
                                  TextStyle(color: Colors.grey.withOpacity(0.7)),
                            ),
                          ],
                        ),
                        const Text('2024-02-21')
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF5A5858)),
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('#kfdkfjkdkdkgjk',
                        style: TextStyle(color: Colors.grey.withOpacity(0.7))),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Dang to Kathmandu'),
                        Text(
                          'Fare',
                          style: TextStyle(color: Colors.green),
                        )
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Rs.1500(Seat A5)'), Text('10:15 PM')],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Ritesh Karmacharya',
                                style: TextStyle(color: Colors.red)),
                            Text('Seats: A5,B2,A3')
                          ],
                        ),
                        Text('2024-02-21')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: const Row(
                              children: [
                                Text('Accept'),
                              ],
                            )),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                fare=!fare;
                              });
                            },
                            child: const Row(
                              children: [
                                Text(
                                  'Propose New Fare',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF5A5858)),
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Dang to Kathmandu'),
                        TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Image.asset('asset/images/star.png'),
                                const Text(
                                  'Rate',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            )),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Rs.1500'),
                        Text(
                          'Used',
                          style: TextStyle(color: Colors.yellow),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Text(
                                  'BA 2 KHA 000',
                                  style: TextStyle(color: Colors.red),
                                ),
                                Text('10:15 PM')
                              ],
                            ),
                            Text(
                              '#kfdkfjkdkdkgjk',
                              style:
                                  TextStyle(color: Colors.grey.withOpacity(0.7)),
                            ),
                          ],
                        ),
                        const Text('2024-02-21')
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: green,
                        foregroundColor: Colors.white,
                      ),
                      child: Image.asset('asset/images/scan.png'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.toNamed(RoutesNames.bus);
                          },
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          icon: Image.asset('asset/images/home1.png')),
                      IconButton(
                          onPressed: () {
                            Get.toNamed(RoutesNames.wallet);
                          },
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          icon: Image.asset('asset/images/wallet1.png')),
                      IconButton(
                          onPressed: () {},
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          icon: Image.asset('asset/images/ticket1.png')),
                      IconButton(
                          onPressed: () {
                            Get.toNamed(RoutesNames.ownerProfile);
                          },
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          icon: Image.asset('asset/images/profile1.png')),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              top: 0,
                left:0,
                right: 0,
                child: AnimatedContainer(
                  curve: Curves.easeOut,
                  height: isVisible? screenHeight/1.33:0,
                    transform: Matrix4.translationValues(
                      0,
                      isVisible ? -screenHeight/1.33 : screenHeight / 1.33,
                      0,
                    ),

                    duration: const Duration(milliseconds: 1000),
                    child: Container(
                      decoration: BoxDecoration(
                        color: green,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color:Colors.black)
                      ),
                        height: screenHeight/1.33,
                        child: Column(
                          children: [
                            Center(child: Image.asset('asset/images/qr.png')),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('This QR contains all the information for the ticket, No pin shall be asked for this action, your ticket may be used by another person if you share this.',
                                style: Theme.of(context).textTheme.bodySmall,),
                            )
                          ],
                        )))),
            Positioned(
              top: 0,
                left:0,
                right: 0,
                child: AnimatedContainer(
                    curve: Curves.easeOut,
                    height: fare? screenHeight/1.4:0,
                    transform: Matrix4.translationValues(
                      0,
                      fare ? -screenHeight/1.33 : screenHeight / 1.33,
                      0,
                    ),

                    duration: const Duration(milliseconds: 1000),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color:Colors.black)
                        ),
                        height: screenHeight/1.33,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Current Fare',
                                style: Theme.of(context).textTheme.titleMedium,),
                            ),
                            const Text('Bus onwer: Rs.5000'),
                            const Text('Your Fare'),
                            const TextField(
                              decoration:InputDecoration(
                                hintText: '4000'
                              ),

                            ),
                            ElevatedButton(onPressed: (){},
                                child: Text('Send Fare'))
                          ],
                        ))))
          ],
        ),
    ]
      ),
    );
  }
}
