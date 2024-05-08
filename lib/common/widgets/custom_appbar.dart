import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    this.bottomHeight,
    this.useLeadingButton,
    this.title,
    this.actions,
    this.bottom,
  });

  final int? bottomHeight;
  final bool? useLeadingButton;
  final Widget? title;
  final List<Widget>? actions;
  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    return AppBar();
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight + bottomHeight!);
}
