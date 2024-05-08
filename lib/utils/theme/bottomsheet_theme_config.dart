import 'package:flutter/material.dart';
import 'package:mediafetch/utils/theme/colorscheme_theme_config.dart';

class BottomsheetThemeConfig {
  BottomsheetThemeConfig._();

  /*----------------> Light Theme <----------------*/
  static final BottomSheetThemeData lightBottomSheetThemeData =
      BottomSheetThemeData(
    showDragHandle: false,
    backgroundColor: ColorSchemeThemeConfig.lightColorScheme.secondary,
    modalBackgroundColor: ColorSchemeThemeConfig.lightColorScheme.secondary,
    constraints: const BoxConstraints(maxWidth: double.infinity),
    shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );

  /*----------------> Dark Theme <----------------*/
  static final BottomSheetThemeData darkBottomSheetThemeData =
      BottomSheetThemeData(
    showDragHandle: false,
    backgroundColor: ColorSchemeThemeConfig.darkColorScheme.secondary,
    modalBackgroundColor: ColorSchemeThemeConfig.darkColorScheme.secondary,
    constraints: const BoxConstraints(maxWidth: double.infinity),
    shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );
}
