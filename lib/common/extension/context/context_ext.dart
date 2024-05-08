import 'package:flutter/material.dart';

extension ContextX on BuildContext {
  ThemeData get theme => Theme.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get topBarHeight => MediaQuery.of(this).padding.top;

  Size get screenSize => MediaQuery.of(this).size;
}
