import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tryapp/config/colors/app_color.dart';
import 'package:tryapp/config/routes/routes_names.dart';

class RoleScreen extends StatefulWidget {
  const RoleScreen({super.key});

  @override
  State<RoleScreen> createState() => _RoleScreenState();
}

class _RoleScreenState extends State<RoleScreen> {
  List<String> roles = ["Passenger", "Driver"];
  String selectedRole = "Passenger";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -90,
            right: -100,
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
          Scaffold(
            backgroundColor: Colors.transparent,
            body: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                const SizedBox(
                  height: 50,
                ),
                Hero(
                  tag: 'busanimation',
                  child: Lottie.asset(
                    'asset/animations/themeanimation.json',
                    width: double.infinity,
                    fit: BoxFit.cover,
                    animate: true,
                    repeat: true,
                  ),
                ),
                Center(
                  child: Text('Sajilo Yatayat',
                      style: Theme.of(context).textTheme.titleLarge),
                ),
                Center(
                  child: Text(
                    'Everything you need for Travel.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                const SizedBox(
                  height: 33,
                ),
                Text(
                  'Choose Your Role:',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                for (String role in roles)
                  RoleSelectorWidget(
                    role: role,
                    selectedRole: selectedRole,
                    onClick: (role) async {
                      setState(() {
                        selectedRole = role;
                      });
                      SharedPreferences sf =
                          await SharedPreferences.getInstance();
                      sf.setString("role", role);
                      Get.toNamed(RoutesNames.loginPage);
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RoleSelectorWidget extends StatelessWidget {
  final String role;
  final String selectedRole;
  final Function onClick;
  const RoleSelectorWidget({
    super.key,
    required this.role,
    required this.selectedRole,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          onClick(role);
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColor().primary,
              width: 5,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 25,
            horizontal: 20,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                role,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: AppColor().primary,
                      fontSize: 18,
                    ),
              ),
              const SizedBox(),
              if (selectedRole == role)
                Icon(
                  Icons.check_circle_outline,
                  color: AppColor().primary,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
