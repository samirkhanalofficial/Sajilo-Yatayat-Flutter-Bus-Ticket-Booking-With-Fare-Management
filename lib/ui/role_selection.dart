import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tryapp/config/routes/routes_names.dart';
import 'package:tryapp/config/theme/text_theme.dart';

class RoleSelection extends StatelessWidget {
  const RoleSelection({super.key});

  @override

  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
        Positioned(
        bottom: -90,
        left: -100,
        child: Hero(
          tag: 'circle',
          child: Container(
            width: 330,
            height: 250,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor),
          ),
        ),

      ),
      ListView(
        children: [
          Lottie.asset(
            'asset/animations/themeanimation.json',
            alignment: Alignment.topCenter,
            width: screenWidth,
            height: screenHeight * 0.33,
            fit: BoxFit.fill,
            animate: true,
            repeat: true
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text('Sajilo Yatayat',
                    style: Theme.of(context).textTheme.titleLarge),
                Text(
                  'Everything you need for Travel.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),

                const SizedBox(
                  height: 33,
                ),
                Row(
                  children: [
                    Text('Choose your role:',
                    style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                ElevatedButton(onPressed: () {
                  Get.toNamed(RoutesNames.login);
                },
                    child: const Text('Owner')),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  Get.toNamed(RoutesNames.login);
                },
                    child: const Text('Passenger')),

              ],
            ),
          )
        ],
      ),
    ]
    )
    );
  }
}
