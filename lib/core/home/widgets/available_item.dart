import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mediafetch/common/extension/context/context_ext.dart';

class AvailableItem extends StatelessWidget {
  const AvailableItem({
    super.key,
    this.item,
    this.label,
  });

  final int? item;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "${NumberFormat.compactCurrency(decimalDigits: 2, symbol: "").format(item)}+",
          style: theme.textTheme.titleLarge?.copyWith(
            color: Colors.white,
          ),
        ),
        Text(
          label ?? "",
          style: theme.textTheme.bodyLarge?.copyWith(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
