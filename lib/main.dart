import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_test_getx/imports.dart';

void main() {
  return runApp(GetMaterialApp(home: Home()));
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

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Obx(
          () => Text('Chips: ${c.chipArray.length}, Height:${c.currentHeight}, Width: ${c.currentWidth}, Rows: ${c.rows}, Sidelength: ${c.sideLength}'),
        ),
      ),

      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: Chips(controller: c),

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
          FloatingActionButton(
              onPressed: () {
                chipArray.removeAt(0);
                c.updateChips(chips: chipArray);
              },
              child: const Icon(Icons.highlight_off))
        ],
      ),
    );
  }
}
