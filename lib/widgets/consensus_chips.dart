import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_test_getx/imports.dart';
import 'package:flutter_test_getx/models/opinion_model/opinion_model.dart';
import 'package:get/get.dart';

class ChipsController extends GetxController {
  static ChipsController get to => Get.find(); // add this line

  List<OpinionModel> opinionArray = <OpinionModel>[];
  RxList<RxList<OpinionModel>> rowArray = <RxList<OpinionModel>>[].obs;

  RxNum sideLength = RxNum(0);
  int rows = 0;

  num currentHeight = -1;
  num currentWidth = -1;

  int padding = 20;

  /// this method takes the size of the display area
  /// and calculates the chip layout parameters, such
  /// as the number of rows and how many chips are on
  /// each row. It performs its magic by calculating
  /// the total area of all of the displayed chips
  /// starting with one row of chips and successively
  /// adding a row. The optimal number of rows is
  /// that number of rows where the total area of all
  /// chips is maximum.
  void updateChips({List<OpinionModel>? chips}) {
    int r = 1; // start analyzing based on a single row of chips

    if (chips == null) {
      chips = opinionArray;
    } else {
      opinionArray = chips;
    }

    // iterate through different numbers of rows
    while (true) {
      num a1 = _calculateOverallChipArea(currentHeight, currentWidth, r);
      num a2 = _calculateOverallChipArea(currentHeight, currentWidth, r + 1);

      print('${opinionArray.length}($r): $a1 - $a2');
      // if the total area of the chips for rows = n+1 is greater
      // than the total area of chips for rows = n then keep going
      if ((a1 <= a2) && (a1 != double.minPositive)) {
        r++;
      } else {
        // as soon as we see the total area of chips decreasing, we know that
        // we have passed our optimal size parameters, so break out of the loop
        break;
      }
    }

    rows = r; // set total number of rows in the observable variable

    // determine the maximum number of chips in a given row based
    // on the number of rows displayed. For example, if we have three
    // rows and 8 chips, the maximum number of chips on a row will 3.
    int maxChipsInRow = (opinionArray.length / r).ceil();
    if (maxChipsInRow < 1) maxChipsInRow = 1;

    // now calculate the size of the chip, which is going to be the
    // smaller of the possible side lengths based on the number of
    // chips in a row divided by the width, or the height of the
    // display divided by the number of rows.
    num sideLengthWidth = currentWidth / maxChipsInRow;
    num sideLengthHeight = currentHeight / r;

    // set this in the observable variable
    sideLength = RxNum(math.min(sideLengthHeight, sideLengthWidth));

    // now we need to figure out how many chips will be on each row.
    // since we are dealing with a rectangluar area, each row
    // will have the maximum number of chips except for the last
    // row. Nevertheless, we are going to throw the individual
    // counts into an array to make it easier to access from the
    // UI component
    rowArray.clear();
    bool stopProcessing = false;

    // iterate through each row and add the number of chips in the row
    for (int i = 0; i < r; i++) {
      RxList<OpinionModel> row = <OpinionModel>[].obs;

      for (int j = 0; j < maxChipsInRow; j++) {
        if (((i * maxChipsInRow) + j) >= opinionArray.length) {
          stopProcessing = true;
          break;
        }
        row.add(opinionArray[(i * maxChipsInRow) + j]);
      }

      rowArray.add(row);

      if (stopProcessing) {
        break;
      }
    }
  }

  /// This method is internal to the controller and
  /// is used to calculate the total area of the chips
  /// for a given display size and number of rows.
  num _calculateOverallChipArea(num h, num w, int r) {
    // if the number of chips is less than the
    // number of rows, return the smallest number possible
    // in order to break out of the loop.
    // Essentially this will happen if there is a single column
    // of chips where each row has only one chip.
    if (opinionArray.length < r) {
      return double.minPositive;
    }

    // based on the number of rows, what is the maximum
    // number of chips we would expect to be on a
    // single row. For example, if there are 15 chips
    // on 4 rows, you would expect that the maximum number
    // of chips on a row would be 4, with the last row having
    // fewer than 4 chips.
    int maxChipsInRow = (opinionArray.length / r).ceil();

    // calculate the expected side lengths of the chips
    // based on both the height and width of the display
    num sideLengthWidth = w / maxChipsInRow;
    num sideLengthHeight = h / r;

    // the optimal size of a chip is going to be
    // the smaller of these two values
    num minSideLength = math.min(sideLengthHeight, sideLengthWidth);

    // now that we know the size of a chip, the total area
    // of chips for this display is going to be the area of the
    // chip multiplied by the number of chips.
    num totalArea = (minSideLength * minSideLength) * opinionArray.length;

    return totalArea;
  }
}

class Chips extends StatelessWidget {
  Chips({
    required this.controller,
    super.key,
  });

  final ChipsController controller;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final ChipsController c = Get.put(ChipsController());

    int appBarHeight = 60;

    if ((c.rows <= 1) && (c.opinionArray.length > 1)) {
      appBarHeight = 0;
    }

    // check to see if the size of the display has changed based
    // on the value we have stored in the controller. If so,
    // reset the sizes in the controller (which are not observable) and
    // recalculate the chip layout
    if ((c.currentHeight != MediaQuery.of(context).size.height - (_scaffoldKey.currentState?.appBarMaxHeight ?? appBarHeight) - c.padding) ||
        (c.currentWidth != MediaQuery.of(context).size.width - c.padding)) {
      c.currentHeight = MediaQuery.of(context).size.height - (_scaffoldKey.currentState?.appBarMaxHeight ?? appBarHeight) - c.padding;
      c.currentWidth = MediaQuery.of(context).size.width - c.padding;
      c.updateChips();
    }

    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(
          c.rowArray.length,
          (index) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              c.rowArray[index].length,
              (index2) => Container(
                height: c.sideLength.value.toDouble(),
                width: c.sideLength.value.toDouble(),
                decoration: BoxDecoration(border: Border.all(color: Colors.white), color: HexColor(c.rowArray[index][index2].criteriaValueBackgroundColor)),
                child: Center(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 60,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Image.asset('images/numbers/${c.rowArray[index][index2].criteriaValueText}.png'),
                        ),
                      ),
                      Expanded(
                        flex: 40,
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 3.0),
                          child: AutoSizeText(
                            c.rowArray[index][index2].stakeholderAbbreviation ?? '',
                            maxFontSize: 500,
                            minFontSize: 10,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'AvenirNextHeavy',
                              fontSize: 500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
