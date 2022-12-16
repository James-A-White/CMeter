import 'package:flutter/material.dart';
import 'package:flutter_test_getx/models/opinion_model/opinion_model.dart';
import 'package:get/get.dart';

import 'package:flutter_test_getx/imports.dart';

class DecisionViewController extends GetxController {
  static DecisionViewController get to => Get.find(); // add this line

  Timer? t;

  void startPolling() {
    t ??= Timer.periodic(
      const Duration(milliseconds: 5000),
      (Timer tm) async {
        final List<OpinionModel> opinions = <OpinionModel>[];
        RxStatus status = RxStatus.empty();

        Box<dynamic> box = Hive.box('CMeter');
        String? decisionActivityId = box.get('decisionActivityId');
        if (decisionActivityId != null) {
          String accessToken = 'not required';
          // final String accessToken = Utilities.generateToken(HC_ADMIN_PORTAL_INTERNAL_USER_ID, 'hcportal_getEvents');

          final String body = jsonEncode(<String, dynamic>{'tenantId': null, 'stakeholderId': null, 'accessToken': accessToken, 'decisionActivityId': decisionActivityId});

          final String jsonResult = await ServiceCommon.sendHttpPost('dm1_get_decision_activity_opinion', body);

          opinions.clear();
          print(jsonResult);

          if (jsonResult.length > 10) {
            final dynamic jsonItems = json.decode(jsonResult);
            if (jsonItems.length > 0) {
              if ((jsonItems[1] as List<dynamic>).isNotEmpty) {
                for (int i = 0; i < (jsonItems[1] as List<dynamic>).length; i++) {
                  OpinionModel om = OpinionModel.fromJson(jsonItems[1][i]);
                  print(om.toString());
                  opinions.add(om);
                  status = RxStatus.success();
                }
              }
            }
          }

          final ChipsController c = ChipsController.to;

          c.updateChips(chips: opinions);
        }
      },
    );
  }
}

class DecisionView extends StatelessWidget {
  DecisionView({super.key});

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final Uuid _uuid = const Uuid();

  //final RxList<OpinionModel> chipArray = <OpinionModel>[].obs;

  final Random _random = Random();

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
    if ((c.currentHeight != MediaQuery.of(context).size.height - (_scaffoldKey.currentState?.appBarMaxHeight ?? 0)) || (c.currentWidth != MediaQuery.of(context).size.width)) {
      c.currentHeight = MediaQuery.of(context).size.height - (_scaffoldKey.currentState?.appBarMaxHeight ?? 0);
      c.currentWidth = MediaQuery.of(context).size.width;
      ChipsController.to.updateChips();
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
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
            _voteTab(),
            Chips(controller: c),
          ],
        ),

        // floatingActionButton:
        // Column(
        //   children: <Widget>[
        //     FloatingActionButton(
        //         onPressed: () {
        //           final int score = _random.nextInt(10);
        //           chipArray.add(ChipModel(
        //             opinionRating: score,
        //             chipId: _uuid.v1().toString(),
        //             chipColor: chipColors[score],
        //             textColor: chipTextColors[score],
        //             chipText: sampleStrings[chipArray.length % 10],
        //           ));
        //           //c.chipArray = chipArray;
        //           c.updateChips(chips: chipArray);
        //         },
        //         child: const Icon(Icons.add)),
        //     // FloatingActionButton(
        //     //     onPressed: () {
        //     //       chipArray.removeAt(0);
        //     //       c.updateChips(chips: chipArray);
        //     //     },
        //     //     child: const Icon(Icons.highlight_off))
        //   ],
        // )
      ),
    );
  }

  Widget _voteButton(int score) {
    return GestureDetector(
      onTap: () async {
        Box<dynamic> box = Hive.box('CMeter');
        String stakeholderId = box.get('stakeholderId');

        String accessToken = 'not required';
        // final String accessToken = Utilities.generateToken(HC_ADMIN_PORTAL_INTERNAL_USER_ID, 'hcportal_getEvents');

        final String body = jsonEncode(<String, dynamic>{
          'tenantId': null,
          'stakeholderId': stakeholderId,
          'accessToken': accessToken,
          'criteriaValueId': null,
          'criteriaValue': score.toString(),
          'opinionName': null,
          'opinionComment': null,
        });

        print(body);

        final String jsonResult = await ServiceCommon.sendHttpPost('dm1_register_opinion', body);

        Get.showSnackbar(
          const GetSnackBar(
            //title: title,
            message: 'Opinion registered',
            //icon: const Icon(Icons.refresh),
            duration: Duration(seconds: 3),
          ),
        );
      },
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Container(
          margin: const EdgeInsets.all(5),
          color: HexColor(
            chipColors[score],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset('images/numbers/$score.png'),
          ),
        ),
      ),
    );
  }

  Widget _voteTab() {
    return Column(
      children: <Widget>[
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _voteButton(0),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _voteButton(1),
              _voteButton(2),
              _voteButton(3),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _voteButton(4),
              _voteButton(5),
              _voteButton(6),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _voteButton(7),
              _voteButton(8),
              _voteButton(9),
            ],
          ),
        ),
      ],
    );
  }
}