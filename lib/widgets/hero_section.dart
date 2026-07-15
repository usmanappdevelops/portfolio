import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'section_animator.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final avatarSize = isMobile ? (screenWidth < 360 ? 120.0 : 150.0) : 180.0;

    final infoBlock = Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          PersonalInfo.name,
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontSize: isMobile ? (screenWidth < 360 ? 28 : 34) : 48,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          PersonalInfo.title,
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          PersonalInfo.tagline,
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.white60,
          ),
        ),
        const SizedBox(height: 28),
        Wrap(
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          spacing: 14,
          runSpacing: 14,
          children: [
            _socialButton(
              icon: Icons.code,
              label: 'GitHub',
              onTap: () => _open(PersonalInfo.github),
            ),
            _socialButton(
              icon: Icons.business_center,
              label: 'LinkedIn',
              onTap: () => _open(PersonalInfo.linkedin),
            ),
            _socialButton(
              icon: Icons.email_outlined,
              label: 'Email Me',
              onTap: () => _open('mailto:${PersonalInfo.email}'),
              filled: true,
            ),
          ],
        ),
      ],
    );

    // On mobile we stack vertically (avatar on top, info below), with no
    // Expanded widgets, so the column can size itself naturally inside the
    // parent SingleChildScrollView (which has unbounded height).
    // On wider screens we lay the avatar and info block out in a Row and
    // it's safe to let the info block take the remaining width via Expanded,
    // since the Row's width is bounded by the surrounding ConstrainedBox.
    final content = isMobile
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildAvatar(avatarSize),
              const SizedBox(height: 32),
              infoBlock,
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildAvatar(avatarSize),
              const SizedBox(width: 48),
              Expanded(child: infoBlock),
            ],
          );

    return SectionAnimator(
      delay: const Duration(milliseconds: 100),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: isMobile ? 60 : 100,
        ),
        decoration: const BoxDecoration(gradient: AppColors.heroGradient),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: Responsive.contentMaxWidth(context),
            ),
            child: content,
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar(double size) {
    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.25 * 255).round()),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
        image: PersonalInfo.hasProfileImage
            ? const DecorationImage(
                image: AssetImage(PersonalInfo.profileImagePath),
                fit: BoxFit.cover,
              )
            : null,
        color: Colors.white24,
      ),
      child: PersonalInfo.hasProfileImage
          ? null
          : const Icon(Icons.person, size: 80, color: Colors.white),
    );
  }

  Widget _socialButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool filled = false,
  }) {
    return Material(
      color:
          filled ? Colors.white : Colors.white.withAlpha((0.12 * 255).round()),
      borderRadius: BorderRadius.circular(30),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 18,
                color: filled ? AppColors.primaryDark : Colors.white,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: filled ? AppColors.primaryDark : Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
