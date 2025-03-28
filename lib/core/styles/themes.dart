import 'package:flutter/material.dart';
import 'package:purple_task/core/constants/custom_styles.dart';

enum AppThemeMode {
  system,
  light,
  dark,
}

class PurpleAppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: Colors.pink,
      surface: Color(0xFFEEEEEE),
      surfaceContainer: Color(0xFFE0E0E0),
    ),
    tooltipTheme: TooltipThemeData(
      textStyle: CustomStyle.textStyleLabelSmall.copyWith(color: Colors.white),
      waitDuration: const Duration(milliseconds: 600),
    ),
    dividerTheme: const DividerThemeData(color: Colors.grey),
    dialogTheme: const DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ),
    navigationBarTheme: const NavigationBarThemeData(
      indicatorColor: Colors.black54,
      iconTheme:
          WidgetStateProperty.fromMap(<WidgetStatesConstraint, IconThemeData?>{
        WidgetState.selected: IconThemeData(color: Colors.white),
      }),
      indicatorShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      dayShape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      confirmButtonStyle: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
      ),
      cancelButtonStyle: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Colors.pink,
      surface: Color(0xFF212121),
      onSurface: Color(0xFFE0E0E0),
      surfaceContainer: Color(0xFF424242),
    ),
    tooltipTheme: const TooltipThemeData(
      textStyle: CustomStyle.textStyleLabelSmall,
      waitDuration: Duration(milliseconds: 600),
    ),
    listTileTheme: const ListTileThemeData(
      textColor: Color(0xFFE0E0E0),
      tileColor: Color(0xFF212121),
    ),
    dialogTheme: const DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ),
    navigationBarTheme: const NavigationBarThemeData(
      indicatorColor: Colors.white54,
      iconTheme:
          WidgetStateProperty.fromMap(<WidgetStatesConstraint, IconThemeData?>{
        WidgetState.selected: IconThemeData(color: Colors.black),
      }),
      indicatorShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      dayShape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      confirmButtonStyle: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
      ),
      cancelButtonStyle: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
      ),
    ),
  );
}
