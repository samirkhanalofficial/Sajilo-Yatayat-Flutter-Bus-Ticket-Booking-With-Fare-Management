import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tryapp/controllers/register_controller.dart';

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

  String gender = 'male';
  final RegisterFuctions registerController = Get.put(RegisterFuctions());

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
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('< Back'),
                    ),
                  ),
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
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  const SizedBox(
                    height: 19,
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
                  TextField(
                    controller: dobController,
                    enabled: true,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                        hintText: '2000-11-18',
                        suffix: IconButton(
                            onPressed: () {
                              showDatePicker(
                                context: context,
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2030),
                              ).then((value) {
                                if (value != null) {
                                  dobController.text =
                                      '${value.year}-${value.month}-${value.day}';
                                }
                              });
                            },
                            icon: const Icon(Icons.edit))),
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
                      GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              gender = 'male';
                            },
                          );
                        },
                        child: Container(
                          height: 40,
                          width: 120,
                          decoration: BoxDecoration(
                            color: gender == 'male'
                                ? Theme.of(context).primaryColor
                                : const Color(0xFFf4f4f4),
                            borderRadius: BorderRadius.circular(17),
                          ),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                foregroundImage:
                                    AssetImage('asset/images/male.png'),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Male',
                                style: TextStyle(
                                    color: gender == 'male'
                                        ? Colors.white
                                        : Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            gender = 'female';
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 120,
                          decoration: BoxDecoration(
                            color: gender == 'female'
                                ? Theme.of(context).primaryColor
                                : const Color(0xFFf4f4f4),
                            borderRadius: BorderRadius.circular(17),
                          ),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                foregroundImage:
                                    AssetImage('asset/images/female.png'),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Female',
                                style: TextStyle(
                                    color: gender == 'female'
                                        ? Colors.white
                                        : Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  Obx(
                    () => ElevatedButton(
                      onPressed: registerController.isLoading.value
                          ? null
                          : () {
                              registerController.registerNewUser(
                                  nameController.text,
                                  addressController.text,
                                  dobController.text,
                                  gender);
                            },
                      child: registerController.isLoading.value
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text('Finish'),
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
