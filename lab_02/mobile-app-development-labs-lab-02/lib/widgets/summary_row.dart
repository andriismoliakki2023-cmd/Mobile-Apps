import 'package:flutter/material.dart';
import 'package:lab_02/data/summary_item.dart';
import 'package:lab_02/theme/app_spacing.dart';
import 'package:lab_02/widgets/summary_tile.dart';

/// Ряд рівних за шириною плиток із показниками.
class SummaryRow extends StatelessWidget {
  const SummaryRow({required this.items, super.key});

  final List<SummaryItem> items;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        for (int i = 0; i < items.length; i++) ...<Widget>[
          if (i > 0) const SizedBox(width: AppSpacing.s),
          Expanded(child: SummaryTile(item: items[i])),
        ],
      ],
    );
  }
}
