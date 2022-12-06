import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_test_getx/imports.dart';

void main() {
  AppColors ac = AppColors();
  return runApp(
    GetMaterialApp(
      home: Home(),
      theme: ac.toThemeData(),
    ),
  );
}

class Home extends StatelessWidget {
  Home({super.key});

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final int padding = 20;
  final Uuid _uuid = const Uuid();

  final RxList<ChipModel> chipArray = <ChipModel>[].obs;

  final Random _random = Random();

  @override
  Widget build(context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final ChipsController c = Get.put(ChipsController());

    // check to see if the size of the display has changed based
    // on the value we have stored in the controller. If so,
    // reset the sizes in the controller (which are not observable) and
    // recalculate the chip layout
    if ((c.currentHeight != MediaQuery.of(context).size.height - (_scaffoldKey.currentState?.appBarMaxHeight ?? 100) - padding) || (c.currentWidth != MediaQuery.of(context).size.width - padding)) {
      c.currentHeight = MediaQuery.of(context).size.height - (_scaffoldKey.currentState?.appBarMaxHeight ?? 100) - padding;
      c.currentWidth = MediaQuery.of(context).size.width - padding;
      ChipsController.to.updateChips();
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: TabBar(
          overlayColor: MaterialStatePropertyAll(AppColors.tabDimmed),
          padding: const EdgeInsets.all(8.0),
          labelPadding: const EdgeInsets.all(0),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50), // Creates border
              color: AppColors.tabHighlighted), //Change background color from here
          tabs: const <Tab>[
            Tab(text: 'Identity', icon: Icon(Icons.manage_accounts)),
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
            _identifyForm(),
            _voteTab(),
            Chips(controller: c),
          ],
        ),

        floatingActionButton: Column(
          children: <Widget>[
            FloatingActionButton(
                onPressed: () {
                  final int score = _random.nextInt(10);
                  chipArray.add(ChipModel(
                    opinionRating: score,
                    chipId: _uuid.v1().toString(),
                    chipColor: chipColors[score],
                    textColor: chipTextColors[score],
                    chipText: sampleStrings[chipArray.length % 10],
                  ));
                  //c.chipArray = chipArray;
                  c.updateChips(chips: chipArray);
                },
                child: const Icon(Icons.add)),
            // FloatingActionButton(
            //     onPressed: () {
            //       chipArray.removeAt(0);
            //       c.updateChips(chips: chipArray);
            //     },
            //     child: const Icon(Icons.highlight_off))
          ],
        ),
      ),
    );
  }

  Widget _identifyForm() {
    return LoginView();
  }

  Widget _voteButton(int score) {
    return AspectRatio(
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
