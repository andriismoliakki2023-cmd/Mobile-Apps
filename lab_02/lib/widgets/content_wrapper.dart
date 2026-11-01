import 'package:flutter/material.dart';
import 'package:lab_02/theme/app_spacing.dart';

/// Центрує вміст, обмежує його ширину та адаптує відступи до розміру екрана.
class ContentWrapper extends StatelessWidget {
  const ContentWrapper({
    required this.child,
    this.maxWidth = AppSpacing.maxContentWidth,
    super.key,
  });

  final Widget child;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double padding = width >= AppSpacing.tabletBreakpoint
        ? AppSpacing.l
        : AppSpacing.m;

    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Padding(padding: EdgeInsets.all(padding), child: child),
      ),
    );
  }
}
