import 'package:flutter/cupertino.dart';
import 'package:flutter_test_getx/imports.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final abbreviationController = TextEditingController();
  final sessionIdController = TextEditingController();

  //final passwordController = TextEditingController();
  final _status = Rx<RxStatus>(RxStatus.empty());

  static LoginController get to => Get.find(); // add this line

  RxStatus get status => _status.value;

  final Box<dynamic> _box = Hive.box('CMeter');

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  @override
  void onClose() {
    abbreviationController.dispose();
    sessionIdController.dispose();
    //passwordController.dispose();
  }

  bool _isSessionIdValid() {
    if ((sessionIdController.text.trim().isEmpty) || (sessionIdController.text.trim().length != 6)) {
      Get.showSnackbar(
        const GetSnackBar(
          //title: title,
          message: 'Enter valid session ID',
          //icon: const Icon(Icons.refresh),
          duration: Duration(seconds: 3),
        ),
      );

      return false;
    }

    return true;
  }

  bool _isIdentityValid() {
    if (abbreviationController.text.trim().isEmpty) {
      //M.showToast('Enter email id', status: SnackBarStatus.error);

      Get.showSnackbar(
        const GetSnackBar(
          //title: title,
          message: 'Enter identity',
          //icon: const Icon(Icons.refresh),
          duration: Duration(seconds: 3),
        ),
      );

      return false;
    }
    // if (!abbreviationController.text.trim().isEmail) {
    //   // M.showToast('Enter valid email id', status: SnackBarStatus.error);
    //   Get.showSnackbar(
    //     const GetSnackBar(
    //       //title: title,
    //       message: 'Enter valid email',
    //       //icon: const Icon(Icons.refresh),
    //       duration: Duration(seconds: 3),
    //     ),
    //   );

    //   return false;
    // }
    // if (passwordController.text.trim().isEmpty) {
    //   // M.showToast('Enter password', status: SnackBarStatus.error);
    //   Get.showSnackbar(
    //     GetSnackBar(
    //       //title: title,
    //       message: 'Enter password',
    //       //icon: const Icon(Icons.refresh),
    //       duration: const Duration(seconds: 3),
    //     ),
    //   );

    //   return false;
    // }
    return true;
  }

  Future<void> onConnectToSession() async {
    //if (_isSessionIdValid()) {
    _status.value = RxStatus.loading();
    try {
      String accessToken = 'not required';
      // final String accessToken = Utilities.generateToken(HC_ADMIN_PORTAL_INTERNAL_USER_ID, 'hcportal_getEvents');

      final String body = jsonEncode(<String, dynamic>{
        'tenantId': null,
        'stakeholderId': _box.get('stakeholderId'),
        'accessToken': accessToken,
        'sessionCode': 'DAC:TNAAGZ',
        'stakeholderAbbreviation': abbreviationController.text
      });

      final String jsonResult = await ServiceCommon.sendHttpPost('dm1_connect_to_session', body);

      if (jsonResult.length > 10) {
        final dynamic jsonItems = json.decode(jsonResult);
        if (jsonItems.length > 0) {
          if (jsonItems[0][0]['decisionActivityId'] != null) {
            String decisionActivityId = jsonItems[0][0]['decisionActivityId'];

            Box<dynamic> box = Hive.box('CMeter');
            box.put('decisionActivityId', decisionActivityId);
          }
        }
      }

      Get.showSnackbar(
        const GetSnackBar(
          //title: title,
          message: 'Connected to session',
          //icon: const Icon(Icons.refresh),
          duration: Duration(seconds: 3),
        ),
      );

      _status.value = RxStatus.success();

      Get.to(DecisionView());
    } catch (e) {
      e.printError();
      //M.showToast(e.toString(), status: SnackBarStatus.error);
      Get.showSnackbar(
        GetSnackBar(
          //title: title,
          message: e.toString(),
          //icon: const Icon(Icons.refresh),
          duration: const Duration(seconds: 3),
        ),
      );

      _status.value = RxStatus.error(e.toString());
    }
    //}
  }

  Future<void> onUpdateIdentity() async {
    if (_isIdentityValid()) {
      _status.value = RxStatus.loading();
      try {
        //Perform login logic here
        // M.showToast('Login successful', status: SnackBarStatus.success);

        Get.showSnackbar(
          const GetSnackBar(
            //title: title,
            message: 'Identity Registered',
            //icon: const Icon(Icons.refresh),
            duration: Duration(seconds: 3),
          ),
        );

        _status.value = RxStatus.success();
      } catch (e) {
        e.printError();
        //M.showToast(e.toString(), status: SnackBarStatus.error);
        Get.showSnackbar(
          GetSnackBar(
            //title: title,
            message: e.toString(),
            //icon: const Icon(Icons.refresh),
            duration: const Duration(seconds: 3),
          ),
        );

        _status.value = RxStatus.error(e.toString());
      }
    }
  }
}
