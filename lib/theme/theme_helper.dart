import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';

String _appTheme = "primary";

/// Helper class for managing themes and colors.
class ThemeHelper {
  // A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    _appTheme = _newTheme;
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.primary,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: colorScheme.primary,
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.onSurface;
        }),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.onSurface;
        }),
        side: BorderSide(
          width: 1,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.blueGray400,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.gray50004,
          fontSize: 18.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.black90001,
          fontSize: 14.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.gray60001,
          fontSize: 12.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
        ),
        displayMedium: TextStyle(
          color: colorScheme.primary,
          fontSize: 42.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
        ),
        displaySmall: TextStyle(
          color: appTheme.gray80001,
          fontSize: 34.fSize,
          fontFamily: 'Helvetica',
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: TextStyle(
          color: colorScheme.onPrimaryContainer.withOpacity(1),
          fontSize: 26.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(
          color: colorScheme.primary,
          fontSize: 24.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
        ),
        labelLarge: TextStyle(
          color: appTheme.black90001,
          fontSize: 12.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: colorScheme.onPrimaryContainer.withOpacity(1),
          fontSize: 22.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          color: colorScheme.primary,
          fontSize: 18.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          color: colorScheme.primary,
          fontSize: 14.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFF55AB60),
    primaryContainer: Color(0XFF263238),
    secondary: Color(0XFF263238),
    secondaryContainer: Color(0XFF60C370),
    tertiary: Color(0XFF263238),
    tertiaryContainer: Color(0XFF60C370),

    // Background colors
    background: Color(0XFF263238),

    // Surface colors
    surface: Color(0XFF263238),
    surfaceTint: Color(0XFF14171E),
    surfaceVariant: Color(0XFF60C370),

    // Error colors
    error: Color(0XFF14171E),
    errorContainer: Color(0XFF5E5E5E),
    onError: Color(0XFF55AB60),
    onErrorContainer: Color(0XFF14171E),

    // On colors(text colors)
    onBackground: Color(0X6CFFFFFF),
    onInverseSurface: Color(0XFF55AB60),
    onPrimary: Color(0XFF14171E),
    onPrimaryContainer: Color(0X6CFFFFFF),
    onSecondary: Color(0X6CFFFFFF),
    onSecondaryContainer: Color(0XFF1A1A1A),
    onTertiary: Color(0X6CFFFFFF),
    onTertiaryContainer: Color(0XFF1A1A1A),

    // Other colors
    outline: Color(0XFF14171E),
    outlineVariant: Color(0XFF263238),
    scrim: Color(0XFF263238),
    shadow: Color(0XFF14171E),

    // Inverse colors
    inversePrimary: Color(0XFF263238),
    inverseSurface: Color(0XFF14171E),

    // Pending colors
    onSurface: Color(0X6CFFFFFF),
    onSurfaceVariant: Color(0XFF1A1A1A),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Amber
  Color get amber500 => Color(0XFFFFC107);

  // Black
  Color get black900 => Color(0XFF040404);
  Color get black90001 => Color(0XFF000000);

  // BlueGray
  Color get blueGray100 => Color(0XFFD3D3D3);
  Color get blueGray400 => Color(0XFF848FAD);
  Color get blueGray40001 => Color(0XFF868686);
  Color get blueGray40002 => Color(0XFF898989);
  Color get blueGray40003 => Color(0XFF888888);
  Color get blueGray700 => Color(0XFF455A64);

  // Cyan
  Color get cyan50 => Color(0XFFCAF5FF);

  // DeepOrange
  Color get deepOrange200 => Color(0XFFFFBE9D);
  Color get deepOrange50 => Color(0XFFFFEBE5);
  Color get deepOrangeA700 => Color(0XFFEB1313);

  // Gray
  Color get gray100 => Color(0XFFF2FCF4);
  Color get gray10001 => Color(0XFFF4F4F4);
  Color get gray10002 => Color(0XFFF2FFF4);
  Color get gray10003 => Color(0XFFF5F5F5);
  Color get gray200 => Color(0XFFF0F0F0);
  Color get gray300 => Color(0XFFE0E0E0);
  Color get gray30001 => Color(0XFFE8E8E3);
  Color get gray400 => Color(0XFFB0B0B0);
  Color get gray40001 => Color(0XFFBCBCBC);
  Color get gray40002 => Color(0XFFC9C9C9);
  Color get gray40003 => Color(0XFFB3B3B3);
  Color get gray50 => Color(0XFFF9F9F9);
  Color get gray500 => Color(0XFF9A9A9A);
  Color get gray50001 => Color(0XFFA2A2A2);
  Color get gray50002 => Color(0XFFADADAD);
  Color get gray50003 => Color(0XFF8F8F8F);
  Color get gray50004 => Color(0XFF9B9B9B);
  Color get gray50005 => Color(0XFF989898);
  Color get gray50006 => Color(0XFF929292);
  Color get gray600 => Color(0XFF7B7878);
  Color get gray60001 => Color(0XFF828282);
  Color get gray60002 => Color(0XFF6E6E6E);
  Color get gray60003 => Color(0XFF787878);
  Color get gray60004 => Color(0XFF737373);
  Color get gray60005 => Color(0XFF6F6F6F);
  Color get gray60006 => Color(0XFF7E7E7E);
  Color get gray700 => Color(0XFF646464);
  Color get gray70001 => Color(0XFF5C5C5C);
  Color get gray70002 => Color(0XFF616161);
  Color get gray800 => Color(0XFF434343);
  Color get gray80001 => Color(0XFF424242);
  Color get gray80002 => Color(0XFF4B4B4B);
  Color get gray900 => Color(0XFF14171F);

  // GrayD
  Color get gray300D8 => Color(0XD8DFDFDF);

  // GrayC
  Color get gray700C6 => Color(0XC6575757);

  // Green
  Color get green200 => Color(0XFFA4E0A4);
  Color get green30099 => Color(0X9974CA82);
  Color get green50 => Color(0XFFDCFFE2);

  // Indigo
  Color get indigo500 => Color(0XFF4267B2);
  Color get indigoA20033 => Color(0X334871E3);

  // LightBlue
  Color get lightBlue50 => Color(0XFFEAFBFF);

  // Lime
  Color get lime100 => Color(0XFFEFF5D2);
  Color get lime50 => Color(0XFFF9FFDA);
  Color get lime500 => Color(0XFFC4E538);
  Color get lime600 => Color(0XFFD6C533);
  Color get lime60001 => Color(0XFFBAD13A);
  Color get lime700 => Color(0XFFBCB04B);

  // Orange
  Color get orange50 => Color(0XFFFFEDD7);
  Color get orange5001 => Color(0XFFFFEAD1);
  Color get orangeA200 => Color(0XFFFFA83B);

  // Red
  Color get red100 => Color(0XFFF5D9D9);
  Color get red400 => Color(0XFFEC5353);
  Color get red50 => Color(0XFFFFF2F0);
  Color get red500 => Color(0XFFFF3F3F);
  Color get redA200 => Color(0XFFFF5656);

  // Teal
  Color get teal400 => Color(0XFF3F8A9A);
  Color get teal40001 => Color(0XFF3E899A);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
