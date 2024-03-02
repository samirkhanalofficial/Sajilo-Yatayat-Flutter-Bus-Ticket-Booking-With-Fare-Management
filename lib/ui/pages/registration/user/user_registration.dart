import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tryapp/controllers/user_controller.dart';
import 'package:tryapp/ui/widgets/global/gender_chip.dart';
import 'package:tryapp/ui/widgets/global/loading_botton.dart';

class UserRegistration extends StatefulWidget {
  const UserRegistration({super.key});

  @override
  State<UserRegistration> createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  @override
  void dispose() {
    addressController.dispose();
    dobController.dispose();
    nameController.dispose();
    super.dispose();
  }

  String selectedGender = 'male';
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            body: SafeArea(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Lottie.asset(
                    'asset/animations/user.json',
                    height: MediaQuery.of(context).size.height * 0.35,
                    animate: true,
                    repeat: true,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Text('About You',
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Let us know more about you.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text('Full Name',
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: 'Sumit Ray',
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text('Address',
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: addressController,
                    decoration: const InputDecoration(
                      hintText: 'Dhangadhi - 18 - Kailali',
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text('Date of Birth',
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(241, 240, 238, 1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: dobController,
                            enabled: false,
                            decoration: const InputDecoration(
                              fillColor: Colors.transparent,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showDatePicker(
                              context: context,
                              firstDate: DateTime(1990),
                              lastDate: DateTime.now(),
                            ).then((value) {
                              if (value != null) {
                                dobController.text =
                                    '${value.year}-${value.month}-${value.day}';
                              }
                            });
                          },
                          icon: const Icon(Icons.edit),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text('Gender', style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      GenderChip(
                          selectedGender: selectedGender,
                          context: context,
                          gender: 'male',
                          onTap: () {
                            setState(() {
                              selectedGender = 'male';
                            });
                          }),
                      const SizedBox(
                        width: 40,
                      ),
                      GenderChip(
                          selectedGender: selectedGender,
                          context: context,
                          gender: 'female',
                          onTap: () {
                            setState(() {
                              selectedGender = 'female';
                            });
                          }),
                    ],
                  ),
                  const SizedBox(height: 22),
                  Obx(
                    () => LoadingButton(
                      buttonName: 'Finish',
                      loading: userController.isLoading.value,
                      onClick: () {
                        userController.registerNewUser(
                            nameController.text,
                            addressController.text,
                            dobController.text,
                            selectedGender);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
