import 'package:flutter/material.dart';

/// Короткий показник для плитки на головному екрані.
class SummaryItem {
  const SummaryItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;
}
