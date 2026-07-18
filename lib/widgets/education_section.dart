import 'package:flutter/material.dart';
import '../models/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'section_title.dart';
import 'section_animator.dart';

class EducationSection extends StatefulWidget {
  const EducationSection({super.key});

  @override
  State<EducationSection> createState() => _EducationSectionState();
}

class _EducationSectionState extends State<EducationSection> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    const educations = Education.items;
    final selected = educations[_selectedIndex];

    return SectionAnimator(
      delay: const Duration(milliseconds: 460),
      child: Container(
        width: double.infinity,
        color: AppColors.background,
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: isMobile ? 50 : 80,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: Responsive.contentMaxWidth(context),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionTitle(
                  label: 'My academic path',
                  title: 'Education & Training',
                ),
                const SizedBox(height: 12),
                ...List.generate(educations.length, (i) {
                  final e = educations[i];
                  return _TimelineTile(
                    title: e.degree,
                    subtitle: e.institute,
                    duration: e.duration,
                    icon: Icons.school_outlined,
                    highlight: _selectedIndex == i,
                    onTap: () => setState(() => _selectedIndex = i),
                  );
                }),
                const SizedBox(height: 20),
                _EducationDetail(
                  title: selected.degree,
                  subtitle: selected.institute,
                  duration: selected.duration,
                  icon: Icons.school_outlined,
                ),
                // const SizedBox(height: 12),
                // ...Training.items.map(
                //   (t) => _TimelineTile(
                //     title: t.title,
                //     subtitle: t.description,
                //     duration: t.duration,
                //     icon: Icons.rocket_launch_outlined,
                //     highlight: true,
                //   ),
                //),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EducationDetail extends StatelessWidget {
  final String title;
  final String subtitle;
  final String duration;
  final IconData icon;

  const _EducationDetail({
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.accentCyan,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: AppColors.heroGradient,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white, size: 22),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                        color: AppColors.accentCyan
                            .withAlpha((0.15 * 255).round()),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        duration,
                        style: const TextStyle(
                          color: AppColors.accentCyan,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class _TimelineTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String duration;
  final IconData icon;
  final bool highlight;
  final VoidCallback? onTap;

  const _TimelineTile({
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.icon,
    this.highlight = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Material(
        color: highlight ? AppColors.surfaceLight : AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          child: Container(
        padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: highlight
                  ? AppColors.accentCyan.withAlpha((0.4 * 255).round())
                  : AppColors.divider,
            ),
          ),
          child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: AppColors.heroGradient,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: Colors.white, size: 22),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 10,
                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 3),
                        decoration: BoxDecoration(
                          color: AppColors.accentCyan
                              .withAlpha((0.15 * 255).round()),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          duration,
                          style: const TextStyle(
                            color: AppColors.accentCyan,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    subtitle,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  ),
); 
  }
}
