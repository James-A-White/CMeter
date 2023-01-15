import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:consensus_meter/models/opinion_model/opinion_model.dart';
import 'package:get/get.dart';

import 'package:consensus_meter/imports.dart';

class DecisionViewController extends GetxController {
  static DecisionViewController get to => Get.find(); // add this line

  Timer? t;

  void startPolling() {
    t ??= Timer.periodic(
      const Duration(milliseconds: 5000),
      (Timer tm) async {
        final List<OpinionModel> opinions = <OpinionModel>[];
        DecisionModel? dm;

        Box<dynamic> box = Hive.box('CMeter');
        String? decisionActivityId = box.get('decisionActivityId');
        if (decisionActivityId != null) {
          String accessToken = 'not required';
          // final String accessToken = Utilities.generateToken(HC_ADMIN_PORTAL_INTERNAL_USER_ID, 'hcportal_getEvents');

          final String body = jsonEncode(<String, dynamic>{'tenantId': null, 'stakeholderId': null, 'accessToken': accessToken, 'decisionActivityId': decisionActivityId});

          final String jsonResult = await ServiceCommon.sendHttpPost('dm1_get_decision_activity_opinion', body);

          opinions.clear();

          if ((jsonResult.length > 10) && (!jsonResult.startsWith(ERROR_PREFIX))) {
            final dynamic jsonItems = json.decode(jsonResult);
            if (jsonItems.length > 0) {
              dm = DecisionModel.fromJson(jsonItems[0][0]);

              if ((jsonItems[1] as List<dynamic>).isNotEmpty) {
                for (int i = 0; i < (jsonItems[1] as List<dynamic>).length; i++) {
                  OpinionModel om = OpinionModel.fromJson(jsonItems[1][i]);
                  opinions.add(om);
                }
              }
            }
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
                  message: 'Error receiving data from session',
                  //icon: const Icon(Icons.refresh),
                  duration: Duration(seconds: 3),
                ),
              );
            }
          }

          ChipsController.to.updateChips(decision: dm, chips: opinions);
        }
      },
    );
  }
}

class DecisionView extends GetView<DecisionViewController> {
  const DecisionView({super.key});

  @override
  Widget build(context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final ChipsController c = Get.put(ChipsController());
    final DecisionViewController dvc = Get.put(DecisionViewController());
    dvc.startPolling();
    //final LoginController lc = Get.put(LoginController());

    // int padding = 0;

    // if ((c.rows <= 1) && (c.chipArray.length > 1)) {
    //   padding = -50;
    // }

    // check to see if the size of the display has changed based
    // on the value we have stored in the controller. If so,
    // reset the sizes in the controller (which are not observable) and
    // recalculate the chip layout
    if ((c.currentHeight != MediaQuery.of(context).size.height - (AppBar().preferredSize.height)) || (c.currentWidth != MediaQuery.of(context).size.width)) {
      c.currentHeight = MediaQuery.of(context).size.height - (AppBar().preferredSize.height);
      c.currentWidth = MediaQuery.of(context).size.width;
      ChipsController.to.updateChips();
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: ((c.rows <= 1) && (c.opinionArray.length > 1))
            ? null
            : TabBar(
                overlayColor: MaterialStatePropertyAll(AppColors.tabDimmed),
                padding: const EdgeInsets.all(8.0),
                labelPadding: const EdgeInsets.all(0),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50), // Creates border
                    color: AppColors.tabHighlighted), //Change background color from here
                tabs: const <Tab>[
                  // Tab(text: 'Identity', icon: Icon(Icons.manage_accounts)),

                  Tab(text: 'Vote', icon: Icon(Icons.how_to_vote)),
                  Tab(text: 'Consensus', icon: Icon(Icons.grid_4x4_sharp)),
                  Tab(text: 'Session', icon: Icon(Icons.settings_sharp)),
                ],
              ),

        // appBar: AppBar(
        //   title: Obx(
        //     () => Text('Chips: ${c.chipArray.length}, Height:${c.currentHeight}, Width: ${c.currentWidth}, Rows: ${c.rows}, Sidelength: ${c.sideLength}'),
        //   ),
        // ),

        // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
        body: TabBarView(
          children: [
            _voteTab(c),
            Chips(controller: c),
            _sessionTab(),
          ],
        ),
      ),
    );
  }

  Widget _voteButton(int score, ChipsController c) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(c.currentHeight / 200.0),
        child: Material(
          color: HexColor(
            chipColors[score],
          ),
          child: InkWell(
            splashColor: Colors.blue,
            hoverColor: Colors.black12,
            // hoverColor: HexColor(
            //   chipColors[score],
            // ),
            // //overlayColor: const MaterialStatePropertyAll<Color?>(Colors.green),
            // focusColor: Colors.yellow,
            highlightColor: Colors.blue,
            onTap: () async {
              Box<dynamic> box = Hive.box('CMeter');
              String stakeholderId = box.get('stakeholderId');
              String decisionActivityId = box.get('decisionActivityId');

              String accessToken = 'not required';
              // final String accessToken = Utilities.generateToken(HC_ADMIN_PORTAL_INTERNAL_USER_ID, 'hcportal_getEvents');

              final String body = jsonEncode(<String, dynamic>{
                'tenantId': null,
                'stakeholderId': stakeholderId,
                'accessToken': accessToken,
                'decisionActivityId': decisionActivityId,
                'criteriaValueId': null,
                'criteriaValue': score.toString(),
                'opinionName': null,
                'opinionComment': null,
              });

              String jsonResult = await ServiceCommon.sendHttpPost('dm1_register_opinion', body);

              if ((jsonResult.length > 10) && (!jsonResult.startsWith(ERROR_PREFIX))) {
                final dynamic jsonItems = json.decode(jsonResult);

                Get.showSnackbar(
                  GetSnackBar(
                    //title: title,
                    message: jsonItems[0][0]['result'],
                    //icon: const Icon(Icons.refresh),
                    duration: const Duration(seconds: 3),
                  ),
                );

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
            },
            child: Container(
              margin: const EdgeInsets.all(5),
              //color: Colors.pink,

              // HexColor(
              //   chipColors[score],
              // ),
              child: Padding(
                padding: EdgeInsets.all(c.currentHeight / 200.0),
                child: Image.asset('images/numbers/$score.png'),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _sessionTab() {
    Box<dynamic> box = Hive.box('CMeter');
    String sessionCode = box.get('sessionCode');

    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const AutoSizeText(
              'Session code:',
              style: TextStyle(fontSize: 36.0),
              maxLines: 1,
              minFontSize: 8.0,
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SelectableText(
                    sessionCode.replaceAll('DAC:', ''),
                    style: const TextStyle(fontSize: 48.0),
                    maxLines: 1,
                  ),
                  GestureDetector(
                    child: const Icon(Icons.copy, size: 48.0),
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: sessionCode.replaceAll('DAC:', '')));
                      Get.showSnackbar(
                        const GetSnackBar(
                          //title: title,
                          message: 'Session code copied to clipboard',
                          //icon: const Icon(Icons.refresh),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            SizedBox(
              width: 200,
              child: QrImage(
                data: 'https://www.consensusmeter.com/#/da/${sessionCode.replaceAll('DAC:', '')}',
                version: QrVersions.auto,
                //size: 200.0,
              ),
            ),

            FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SelectableText(
                    'www.consensusmeter.com/#/da/${sessionCode.replaceAll('DAC:', '')}',
                    maxLines: 1,
                    style: const TextStyle(fontSize: 32.0),
                  ),
                  GestureDetector(
                    child: const Icon(Icons.copy, size: 32.0),
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: 'www.consensusmeter.com/#/da/${sessionCode.replaceAll('DAC:', '')}'));
                      Get.showSnackbar(
                        const GetSnackBar(
                          //title: title,
                          message: 'URL copied to clipboard',
                          //icon: const Icon(Icons.refresh),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            // AutoSizeText(
            //   'www.consensusmeter.com/#/da/${sessionCode.replaceAll('DAC:', '')}',
            //   maxLines: 1,
            //   minFontSize: 6.0,
            //   style: const TextStyle(fontSize: 32.0),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _voteTab(ChipsController c) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Expanded(child: SizedBox()),
                _voteButton(0, c),
                const Expanded(child: SizedBox()),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _voteButton(1, c),
                _voteButton(2, c),
                _voteButton(3, c),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _voteButton(4, c),
                _voteButton(5, c),
                _voteButton(6, c),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _voteButton(7, c),
                _voteButton(8, c),
                _voteButton(9, c),
              ],
            ),
          ),
          //const Expanded(child: SizedBox())
        ],
      ),
    );
  }
}
