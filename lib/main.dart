import 'package:flutter/material.dart';
import 'package:consensus_meter/models/opinion_model/opinion_model.dart';
import 'package:get/get.dart';

import 'package:consensus_meter/imports.dart';

void main() async {
  AppColors ac = AppColors();

  Uri xUri = Uri.base;

  await Hive.openBox('CMeter');
  Box<dynamic> box = Hive.box('CMeter');

  String? stakeholderId = box.get('stakeholderId');
  if (stakeholderId == null) {
    const Uuid uuid = Uuid();
    stakeholderId = uuid.v4().toString();
    box.put('stakeholderId', stakeholderId);
  }

  return runApp(
    GetMaterialApp(
      //home: const LoginView(),
      theme: ac.toThemeData(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const LoginForm()),
        GetPage(name: '/da', page: () => const ConnectByUrlForm()),
        GetPage(name: '/DecisionView', page: () => const DecisionView()),
        // GetPage(name: '/second', page: () => Second()),
        // GetPage(
        //   name: '/third',
        //   page: () => Third(),
        //   transition: Transition.zoom
        // ),
      ],
    ),
  );
}
