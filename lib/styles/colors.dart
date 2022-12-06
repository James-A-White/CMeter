import 'package:flutter_test_getx/imports.dart';
import 'package:flutter/material.dart';

class AppColors {
  /// Common
  static final HexColor accent1 = HexColor('FFE4935D');
  static final HexColor accent2 = HexColor('FFBEABA1');
  static final HexColor offWhite = HexColor('FFF8ECE5');
  static final HexColor caption = HexColor('FF7D7873');
  static final HexColor body = HexColor('FF514F4D');
  static final HexColor greyStrong = HexColor('FF272625');
  static final HexColor greyMedium = HexColor('FF9D9995');
  static final HexColor white = HexColor('FFFFFFFF');
  static final HexColor black = HexColor('FF1E1B18');

  static final Color tabHighlighted = Colors.red.shade900;
  static final Color tabDimmed = Colors.red.shade200;

  final bool isDark = false;

  // Color shift(Color c, double d) => ColorUtils.shiftHsl(c, d * (isDark ? -1 : 1));

  ThemeData toThemeData() {
    /// Create a TextTheme and ColorScheme, that we can use to generate ThemeData
    TextTheme txtTheme = (isDark ? ThemeData.dark() : ThemeData.light()).textTheme;
    Color txtColor = white;
    ColorScheme colorScheme = ColorScheme(
        // Decide how you want to apply your own custom theme, to the MaterialApp
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: accent1,
        primaryContainer: accent1,
        secondary: accent1,
        secondaryContainer: accent1,
        background: offWhite,
        surface: offWhite,
        onBackground: txtColor,
        onSurface: txtColor,
        onError: Colors.white,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        error: Colors.red.shade400);

    /// Now that we have ColorScheme and TextTheme, we can create the ThemeData
    /// Also add on some extra properties that ColorScheme seems to miss
    var t = ThemeData.from(textTheme: txtTheme, colorScheme: colorScheme).copyWith(
      textSelectionTheme: TextSelectionThemeData(cursorColor: accent1),
      highlightColor: accent1,
    );

    /// Return the themeData which MaterialApp can now use
    return t;
  }
}
