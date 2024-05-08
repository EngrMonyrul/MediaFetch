import 'package:flutter/material.dart';
import 'package:mediafetch/common/extension/context/context_ext.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.buttonName,
    this.padding,
    this.buttonColor,
    this.onPressed,
    this.borderRadius,
    this.textColor,
  });

  final String? buttonName;
  final EdgeInsetsGeometry? padding;
  final Color? buttonColor;
  final VoidCallback? onPressed;
  final BorderRadiusGeometry? borderRadius;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return GestureDetector(
      onTap: onPressed ?? () {},
      child: Container(
        alignment: Alignment.center,
        padding: padding ??
            const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
        decoration: BoxDecoration(
          color: textColor ?? theme.colorScheme.primary,
          borderRadius: borderRadius ?? BorderRadius.circular(20),
        ),
        child: Text(
          buttonName ?? "Button Name",
          style: theme.textTheme.bodyMedium?.copyWith(
            color: buttonColor ?? Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
