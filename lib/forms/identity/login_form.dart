import 'package:flutter_test_getx/forms/identity/login_controller.dart';
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
                  // const Text(
                  //   'Session ID',
                  //   style: TextStyle(
                  //     fontSize: 16,
                  //   ),
                  // ),
                  // TextFormField(
                  //   controller: c.sessionIdController,
                  //   decoration: const InputDecoration(
                  //     labelText: 'Enter Session Id',
                  //     border: OutlineInputBorder(),
                  //     isDense: true,
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 12,
                  // ),

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
                  ElevatedButton(
                    onPressed: c.onConnectToSession,
                    child: const Text('Connect to Session'),
                  ),
                  // ElevatedButton(
                  //   onPressed: c.onUpdateIdentity,
                  //   child: const Text('Update identity'),
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
