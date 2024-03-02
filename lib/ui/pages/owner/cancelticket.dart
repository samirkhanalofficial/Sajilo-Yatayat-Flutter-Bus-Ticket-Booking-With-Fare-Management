import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tryapp/config/routes/routes_names.dart';

class cancel extends StatefulWidget {
  const cancel({super.key});

  @override
  State<cancel> createState() => _cancelState();
}

class _cancelState extends State<cancel> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    const Color green = Color(0xFF0ACF83);

    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey,
      body: ListView(
        children: [
          Hero(
            tag: 'name',
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
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
                            onPressed: () {},
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
          Positioned(
            top: -100,
            bottom: -100,
            left: 0,
            right: 0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: !isVisible ? screenHeight/1.5 : 0,
              transform: Matrix4.translationValues(
                0,
                !isVisible ? 0 : screenHeight / 1.33,
                0,
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cancel Ticket',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      'You will be charged Rs 100 for cancelling ticket. Are you still sure ?',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFF5A5858)),
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('#kfdkfjkdkdkgjk',
                                style: TextStyle(
                                    color: Colors.grey.withOpacity(0.7))),
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
                              children: [
                                Text('Rs.1500(Seat A5)'),
                                Text('10:15 PM')
                              ],
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
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        child: Text('Cancel Ticket'))
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: AnimatedContainer(
                  curve: Curves.easeInOut,
                  height: isVisible ? screenHeight /1.4: 0,
                  transform: Matrix4.translationValues(
                    0,
                    isVisible ? 0 : screenHeight / 1.33,
                    0,
                  ),
                  duration: Duration(milliseconds: 1000),
                  child: Container(
                    padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)),
                      child: Column(
                        children: [
                          Text('Ticket Cancelled'),
                          Text('User has been refunded.')
                          ,
                          
                          Center(
                              child:
                              Lottie.asset(
                                'asset/animations/success.json',
                                alignment: Alignment.topCenter,
                                fit: BoxFit.fill,
                              ),

                          ),
                          ElevatedButton(onPressed: (){
                            Get.toNamed(RoutesNames.wallet);
                          },
                              child: Text('Done'))
                        ],
                      ))))
        ],
      ),
    );
  }
}
