import 'package:flutter/material.dart';
import '../models/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'section_title.dart';
import 'section_animator.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isDesktop = Responsive.isDesktop(context);
    final columns = isDesktop ? 3 : (isMobile ? 1 : 2);
    final selectedCategory = TechnicalSkills.categories[_selectedIndex];

    return SectionAnimator(
      delay: const Duration(milliseconds: 340),
      child: Container(
        width: double.infinity,
        color: AppColors.surface,
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
                  label: 'What I bring',
                  title: 'Technical Skills',
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: TechnicalSkills.categories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: isMobile ? 2.6 : 1.7,
                  ),
                  itemBuilder: (context, index) {
                    final cat = TechnicalSkills.categories[index];
                    return _SkillCard(
                      category: cat.category,
                      skills: cat.skills,
                      selected: index == _selectedIndex,
                      onTap: () => setState(() => _selectedIndex = index),
                    );
                  },
                ),
                const SizedBox(height: 32),
                _DetailTile(
                  title: selectedCategory.category,
                  subtitle: selectedCategory.skills.join(' • '),
                  duration: '${selectedCategory.skills.length} skill(s)',
                  icon: _iconForCategory(selectedCategory.category),
                  highlight: true,
                ),
                const SizedBox(height: 48),
                const Text(
                  'SOFT SKILLS',
                  style: TextStyle(
                    color: AppColors.accentCyan,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: SoftSkills.items
                      .map((skill) => _SoftSkillPill(label: skill))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData _iconForCategory(String category) {
    switch (category) {
      case 'Mobile':
        return Icons.phone_iphone;
      case 'State Management':
        return Icons.hub_outlined;
      case 'Backend & APIs':
        return Icons.cloud_outlined;
      case 'Tools':
        return Icons.build_outlined;
      default:
        return Icons.star_outline;
    }
  }
}

class _SkillCard extends StatelessWidget {
  final String category;
  final List<String> skills;
  final bool selected;
  final VoidCallback onTap;

  const _SkillCard({
    required this.category,
    required this.skills,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? AppColors.surfaceLight : AppColors.surface,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: selected ? AppColors.accentCyan : AppColors.divider,
              width: selected ? 1.8 : 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(_iconForCategory(category),
                      color: AppColors.accentCyan, size: 22),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      category,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: skills
                    .map((s) => Text(
                          '• $s',
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 13.5,
                          ),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _iconForCategory(String category) {
    switch (category) {
      case 'Mobile':
        return Icons.phone_iphone;
      case 'State Management':
        return Icons.hub_outlined;
      case 'Backend & APIs':
        return Icons.cloud_outlined;
      case 'Tools':
        return Icons.build_outlined;
      default:
        return Icons.star_outline;
    }
  }
}

class _DetailTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String duration;
  final IconData icon;
  final bool highlight;

  const _DetailTile({
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.icon,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: highlight ? AppColors.surfaceLight : AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: highlight ? AppColors.accentCyan : AppColors.divider,
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

class _SoftSkillPill extends StatelessWidget {
  final String label;
  const _SoftSkillPill({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        gradient: AppColors.heroGradient,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 13.5,
        ),
      ),
    );
  }
}
