import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final abbreviationController = TextEditingController();
  //final passwordController = TextEditingController();
  final _status = Rx<RxStatus>(RxStatus.empty());

  static LoginController get to => Get.find(); // add this line

  RxStatus get status => _status.value;

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
    //passwordController.dispose();
  }

  bool _isValid() {
    if (abbreviationController.text.trim().isEmpty) {
      //M.showToast('Enter email id', status: SnackBarStatus.error);

      Get.showSnackbar(
        const GetSnackBar(
          //title: title,
          message: 'Enter abbreviation',
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

  Future<void> onLogin() async {
    if (_isValid()) {
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
