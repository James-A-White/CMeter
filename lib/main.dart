import 'package:flutter/material.dart';
import 'package:flutter_test_getx/models/opinion_model/opinion_model.dart';
import 'package:get/get.dart';

import 'package:flutter_test_getx/imports.dart';

void main() async {
  AppColors ac = AppColors();

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
      home: const LoginView(),
      theme: ac.toThemeData(),
    ),
  );
}
