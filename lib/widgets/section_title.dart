import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// A consistent section heading used across the portfolio:
/// small accent label + big title + underline accent bar.
class SectionTitle extends StatelessWidget {
  final String label;
  final String title;
  final bool centered;

  const SectionTitle({
    super.key,
    required this.label,
    required this.title,
    this.centered = false,
  });

  @override
  Widget build(BuildContext context) {
    final crossAxis =
        centered ? CrossAxisAlignment.center : CrossAxisAlignment.start;

    return Column(
      crossAxisAlignment: crossAxis,
      children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            color: AppColors.accentCyan,
            fontWeight: FontWeight.w600,
            letterSpacing: 2,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          textAlign: centered ? TextAlign.center : TextAlign.start,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 14),
        Container(
          height: 4,
          width: 60,
          decoration: BoxDecoration(
            gradient: AppColors.heroGradient,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
