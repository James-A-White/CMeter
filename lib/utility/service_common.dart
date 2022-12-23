// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/foundation.dart' as foundation;
import 'package:consensus_meter/imports.dart';

class ServiceCommon {
  // the variable below is there to suppress a warning about defining classes with only static members

  static Future<String> sendHttpPost(String procName, String requestBody, {Function? errorCallback}) async {
    final String uri = BASE_API_URL + procName;

    final Response response = await post(Uri.parse(uri),
            headers: <String, String>{
              'content-type': 'application/json',
              'Access-Control-Allow-Origin': '*',
            },
            body: requestBody)
        .catchError(
      (dynamic error) {
        if (foundation.kDebugMode) {
          // ignore: avoid_print
          print(error.toString());
        }
        return Future<Response>.value(Response('', -1));
      },
    );

    //print(response.body);

    String returnValue = ERROR_UNKNOWN_HTTP_ERROR;

    if ((response.statusCode < 200) || (response.statusCode >= 300)) {
      returnValue = ERROR_UNKNOWN_HTTP_ERROR;
    } else {
      if (response.body.contains('"errorId"')) {
        returnValue = ERROR_UNKNOWN_REMOTE_DB_ERROR;
        // final DBErrorModel? errorResult = IveDbUtilities.checkResultsForErrors(response.body);
        // if (errorResult != null) {
        //   if (errorCallback != null) {
        //     final bool errorCallbackResult = await errorCallback(errorResult);
        //     returnValue = errorCallbackResult ? ERROR_HANDLED : ERROR_NOT_HANDLED;
        //   } else {
        //     final bool alertResult = await IveCoreUtilities.showAlert(navigatorKey.currentContext!, errorResult.errorTitle, errorResult.errorUserMessage, 'OK') ?? true;
        //     returnValue = alertResult ? ERROR_KEY_OK_BTN_PRESSED : ERROR_KEY_CANCEL_BTN_PRESSED;
        //   }
        // }
      } else {
        returnValue = response.body;
      }
    }

    //print(returnValue);

    return returnValue;
  }
}
