import 'package:flutter/cupertino.dart';
import 'package:consensus_meter/imports.dart';
import 'package:get/get.dart';

class ConnectByUrlController extends GetxController {
  final abbreviation1Controller = TextEditingController();
  String sessionCode = '';

  final _status = Rx<RxStatus>(RxStatus.empty());

  static ConnectByUrlController get to => Get.find(); // add this line

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
    abbreviation1Controller.dispose();
  }

  bool _isRole1Valid() {
    if (abbreviation1Controller.text.trim().isEmpty) {
      //M.showToast('Enter email id', status: SnackBarStatus.error);

      Get.showSnackbar(
        const GetSnackBar(
          //title: title,
          message: 'Enter role or your name (max 6 characters)',
          //icon: const Icon(Icons.refresh),
          duration: Duration(seconds: 3),
        ),
      );

      return false;
    }

    return true;
  }

  bool _isSessionCodeValid() {
    RegExp regex = RegExp(r'^[a-zA-Z]+$');
    bool isNotCharOnly = !regex.hasMatch(sessionCode.trim());

    if (isNotCharOnly || sessionCode.trim().length != 6) {
      // M.showToast('Enter valid email id', status: SnackBarStatus.error);
      Get.showSnackbar(
        const GetSnackBar(
          //title: title,
          message: 'Please enter valid session code',
          //icon: const Icon(Icons.refresh),
          duration: Duration(seconds: 3),
        ),
      );

      return false;
    }

    return true;
  }

  Future<void> onConnectToSession() async {
    if (_isSessionCodeValid() && _isRole1Valid()) {
      _status.value = RxStatus.loading();
      try {
        String accessToken = 'not required';
        // final String accessToken = Utilities.generateToken(HC_ADMIN_PORTAL_INTERNAL_USER_ID, 'hcportal_getEvents');

        final String body = jsonEncode(<String, dynamic>{
          'tenantId': null,
          'stakeholderId': _box.get('stakeholderId'),
          'accessToken': accessToken,
          'sessionCode': 'DAC:${sessionCode.trim().toUpperCase()}',
          'stakeholderAbbreviation': abbreviation1Controller.text
        });

        final String jsonResult = await ServiceCommon.sendHttpPost('dm1_connect_to_session', body);

        if ((jsonResult.length > 10) && (!jsonResult.startsWith(ERROR_PREFIX))) {
          final dynamic jsonItems = json.decode(jsonResult);
          if (jsonItems.length > 0) {
            if (jsonItems[0][0]['decisionActivityId'] != null) {
              String decisionActivityId = jsonItems[0][0]['decisionActivityId'];

              Box<dynamic> box = Hive.box('CMeter');
              box.put('decisionActivityId', decisionActivityId);
              box.put('sessionCode', sessionCode.trim().toUpperCase());
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

          Get.to(const DecisionView());
        } else {
          if (jsonResult.startsWith(ERROR_PREFIX)) {
            Get.showSnackbar(
              const GetSnackBar(
                //title: title,
                message: 'Network error',
                //icon: const Icon(Icons.refresh),
                duration: Duration(seconds: 3),
              ),
            );
          } else {
            Get.showSnackbar(
              const GetSnackBar(
                //title: title,
                message: 'Session not found',
                //icon: const Icon(Icons.refresh),
                duration: Duration(seconds: 3),
              ),
            );
          }
        }
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
