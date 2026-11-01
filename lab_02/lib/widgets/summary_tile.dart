import 'package:flutter/material.dart';
import 'package:lab_02/data/summary_item.dart';
import 'package:lab_02/theme/app_colors.dart';
import 'package:lab_02/theme/app_spacing.dart';
import 'package:lab_02/widgets/app_card.dart';

/// Плитка з коротким показником (іконка, значення, підпис).
class SummaryTile extends StatelessWidget {
  const SummaryTile({required this.item, super.key});

  final SummaryItem item;

  @override
  Widget build(BuildContext context) {
    final TextTheme text = Theme.of(context).textTheme;

    return AppCard(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.m),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(item.icon, color: AppColors.primary),
            const SizedBox(height: AppSpacing.s),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(item.value, style: text.titleLarge),
            ),
            Text(
              item.label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: text.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
