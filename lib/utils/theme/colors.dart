import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xff00B147);
  static const Color offWhite = Color(0xffF6F6F6);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color accent = Color(0xFFF9A825);
  static const Color blue = Color(0xFF0055A6);

  // /// Black 54% opacity
  // static const Color black54 = Color(0x8A000000);

  // /// Black 25% opacity
  static const Color black25 = Color(0x40202124);

  // /// Gray
  // static const Color gray = Color(0xFFCFCFCF);

  // /// Grey 2
  // static const Color grey2 = Color(0xFFD0D0D0);

  // /// Grey 3
  // static const Color grey3 = Color(0xFF929292);

  // /// Grey 4;
  // static const Color grey4 = Color(0xfff5f5f5);

  // /// Dull Gray
  // static const Color dullGray = Color(0xff727272);

  // /// White

  /// White Smoke
  static const Color whiteSmoke = Color(0xFFF5F5F5);

  // /// lite achieve
  // static const Color liteAchieve = Color(0xFFebf7f3);

  // /// lite payroll
  // static const Color litePayroll = Color(0xFFf0f0fc);

  // /// WhiteBackground
  // static const Color whiteBackground = Color(0xFFE8EAED);

  // /// Transparent
  // static const Color transparent = Color(0x00000000);

  // /// Blue
  // static const Color blue = Color(0xFF428EFF);

  // /// Red
  // static const Color red = Color(0xFFFB5246);

  // /// Green
  // static const Color green = Color(0xFF25B78D);

  // /// Orange
  // static const Color orange = Color(0xFFFFBB00);

  /// Charcoal
  static const Color charcoal = Color(0xBF202124);

  // /// Royal Vessel
  // static const Color royalVessel = Color(0xFF513AEA);

  // /// Royal Purple
  // static const Color royalPurple = Color(0xFF8240BC);

  // /// Mustard yellow
  // static const Color mustardYello = Color(0xFFDBA800);

  // /// Sea Green
  // static const Color seaGreen = Color(0xFF288467);

  // /// Medium Ruby
  // static const Color mediumRuby = Color(0xFFA73A64);

  /// Exodus Fruit
  static const Color exodusFruit = Color(0xFF656CE0);

  // static const Color cloudBreak = Color(0xFFF4F3FD);

  // /// Praise Of Shadow
  // static const Color praiseOfShadow = Color(0xff1E155C);

  // static const Color faintOrange = Color(0xffFEF4EB);

  static Color purple = const Color(0xFF774AF6);

  /// usage:
  /// `AchieveColors.primary[50]`
  ///  `AchieveColors.primary.shade.50`
  // static final MaterialColor primary =
  //     MaterialColor(const Color.fromRGBO(37, 183, 141, 1).value, const <int, Color>{
  //   50: Color.fromRGBO(233, 248, 244, 1),
  //   100: Color.fromRGBO(211, 241, 232, 1),
  //   200: Color.fromRGBO(190, 233, 221, 1),
  //   300: Color.fromRGBO(168, 226, 209, 1),
  //   400: Color.fromRGBO(146, 219, 198, 1),
  //   500: Color.fromRGBO(124, 212, 187, 1),
  //   600: Color.fromRGBO(102, 205, 175, 1),
  //   700: Color.fromRGBO(81, 197, 164, 1),
  //   800: Color.fromRGBO(59, 190, 152, 1),
  //   900: Color.fromRGBO(37, 183, 141, 1),
  // });

  /// usage:
  /// `AchieveColors.secondary[50]`
  /// `AchieveColors.secondary.50`
  static final MaterialColor secondary =
      MaterialColor(const Color(0xFF774AF6).value, const <int, Color>{
    50: Color(0xFFF1EDFE),
    100: Color(0xFFE4DBFD),
    200: Color(0xFFD6C9FC),
    300: Color(0xFFC9B7FB),
    400: Color(0xFFBBA4FB),
    500: Color(0xFFAD92FA),
    600: Color(0xFFA080F9),
    700: Color(0xFF926EF8),
    800: Color(0xFF855CF7),
    900: Color(0xFF774AF6),
  });

  /// usage:
  /// `AchieveColors.tertiary[50]`
  /// `AchieveColors.tertiary.50`
  static final MaterialColor tertiary =
      MaterialColor(const Color(0xFFF28E3C).value, const <int, Color>{
    50: Color(0xFFFEF4EB),
    100: Color(0xFFFCE8D8),
    200: Color(0xFFFBDDC5),
    300: Color(0xFFFAD2B1),
    400: Color(0xFFF8C79D),
    500: Color(0xFFF7BB8A),
    600: Color(0xFFF6B077),
    700: Color(0xFFF5A563),
    800: Color(0xFFF39950),
    900: Color(0xFFF28E3C),
  });

  /// usage:
  /// `AchieveColors.gray[50]`
  /// `AchieveColors.gray.50`
  static final MaterialColor gray = MaterialColor(const Color(0xFFD9D9D9).value, const <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFfafafa),
    200: Color(0xFFf5f5f5),
    300: Color(0xFFf0f0f0),
    400: Color(0xFFd9d9d9),
    500: Color(0xFFbfbfbf),
    600: Color(0xFF8c8c8c),
    700: Color(0xFF595959),
    800: Color(0xFF434343),
    900: Color(0xFF262626),
    1000: Color(0xFF1F1F1F),
    1010: Color(0xFF141414),
    1020: Color(0xFF000000),
  });

  /// usage:
  /// `AchieveColors.success[50]`
  /// `AchieveColors.success.50`
  static final MaterialColor success =
      MaterialColor(const Color(0xFF07cf0f).value, const <int, Color>{
    50: Color(0xFFe6fae7),
    100: Color(0xFFcdf5cf),
    200: Color(0xFFb5f1b7),
    300: Color(0xFF9cec9f),
    400: Color(0xFF83e787),
    500: Color(0xFF6ae26f),
    600: Color(0xFF51dd57),
    700: Color(0xFF39d93f),
    800: Color(0xFF20d427),
    900: Color(0xFF07cf0f),
  });

  /// usage:
  /// `AchieveColors.success[50]`
  /// `AchieveColors.success.50`
  static final MaterialColor warning =
      MaterialColor(const Color(0xFFDA9D00).value, const <int, Color>{
    50: Color(0xFFfbf5e5),
    100: Color(0xFFf8ebcc),
    200: Color(0xFFf4e2b3),
    300: Color(0xFFf0d899),
    400: Color(0xFFECCE80),
    500: Color(0xFFE9C466),
    600: Color(0xFFE5BA4D),
    700: Color(0xFFE1B033),
    800: Color(0xFFDEA71A),
    900: Color(0xFFDA9D00),
  });

  /// usage:
  /// `AchieveColors.success[50]`
  /// `AchieveColors.success.50`
  static final MaterialColor alert =
      MaterialColor(const Color(0xFFd20404).value, const <int, Color>{
    50: Color(0xFFFBE6E6),
    100: Color(0xFFF6CDCD),
    200: Color(0xFFF2B4B4),
    300: Color(0xFFED9B9B),
    400: Color(0xFFE88181),
    500: Color(0xFFE46868),
    600: Color(0xFFDF4F4F),
    700: Color(0xFFDB3636),
    800: Color(0xFFD61D1D),
    900: Color(0xFFd20404),
  });
}
