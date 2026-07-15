import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'section_title.dart';
import 'section_animator.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isDesktop = Responsive.isDesktop(context);
    final columns = isDesktop ? 4 : (isMobile ? 1 : 2);

    return SectionAnimator(
      delay: const Duration(milliseconds: 700),
      child: Container(
        width: double.infinity,
        color: AppColors.background,
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: isMobile ? 60 : 90,
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
                  label: "Let's connect",
                  title: 'Get In Touch',
                ),
                LayoutBuilder(builder: (context, constraints) {
                  const spacing = 16.0;
                  final itemWidth =
                      (constraints.maxWidth - (columns - 1) * spacing) / columns;
                  final itemHeight = isMobile ? 120.0 : 130.0;
                  final childAspectRatio = itemWidth / itemHeight;

                  return GridView.count(
                    crossAxisCount: columns,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: spacing,
                    mainAxisSpacing: spacing,
                    childAspectRatio: childAspectRatio,
                    children: [
                      _ContactCard(
                        icon: Icons.phone_outlined,
                        label: 'Phone',
                        value: PersonalInfo.phone,
                        onTap: () => _open('tel:${PersonalInfo.phone}'),
                      ),
                      _ContactCard(
                        icon: Icons.email_outlined,
                        label: 'Email',
                        value: PersonalInfo.email,
                        onTap: () => _open('mailto:${PersonalInfo.email}'),
                      ),
                      _ContactCard(
                        icon: Icons.code,
                        label: 'GitHub',
                        value: '@usmanappdevelops',
                        onTap: () => _open(PersonalInfo.github),
                      ),
                      _ContactCard(
                        icon: Icons.business_center_outlined,
                        label: 'LinkedIn',
                        value: 'muhammadusman1168',
                        onTap: () => _open(PersonalInfo.linkedin),
                      ),
                    ],
                  );
                }),
                const SizedBox(height: 16),
                const Row(
                  children: [
                    Icon(Icons.location_on_outlined,
                        color: AppColors.accentCyan, size: 20),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        PersonalInfo.address,
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onTap;

  const _ContactCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.divider),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: AppColors.accentCyan, size: 24),
              const SizedBox(height: 10),
              Text(
                label,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
