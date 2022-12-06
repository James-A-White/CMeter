import 'package:flutter_test_getx/forms/identity/identify_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController c = Get.put(LoginController());

    return Scaffold(
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 32, top: 8),
            child: Text(
              'Setup',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Abbreviation',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  TextFormField(
                    controller: c.abbreviationController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Abbreviation',
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  // const Text(
                  //   'Password',
                  //   style: TextStyle(
                  //     fontSize: 16,
                  //   ),
                  // ),
                  // TextFormField(
                  //   controller: c.passwordController,
                  //   decoration: InputDecoration(
                  //     labelText: 'Enter password',
                  //     border: const OutlineInputBorder(),
                  //     isDense: true,
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 24,
                  // ),
                  // const SizedBox(
                  //   height: 24,
                  // ),
                  ElevatedButton(
                    onPressed: controller.onLogin,
                    child: const Text('Register'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
