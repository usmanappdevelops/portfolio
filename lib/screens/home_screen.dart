import 'package:flutter/material.dart';
import '../models/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/education_section.dart';
import '../widgets/certifications_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/footer_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _certKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryDark,
        elevation: 0,
        title: Text(
          isMobile ? 'Muhammad Usman' : PersonalInfo.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: isMobile
            ? [
                PopupMenuButton<GlobalKey>(
                  icon: const Icon(Icons.menu),
                  onSelected: _scrollTo,
                  itemBuilder: (context) => [
                    PopupMenuItem(value: _aboutKey, child: const Text('About')),
                    PopupMenuItem(
                        value: _skillsKey, child: const Text('Skills')),
                    PopupMenuItem(
                        value: _educationKey, child: const Text('Education')),
                    PopupMenuItem(
                        value: _certKey, child: const Text('Certifications')),
                    PopupMenuItem(
                        value: _contactKey, child: const Text('Contact')),
                  ],
                ),
              ]
            : [
                _navButton('About', _aboutKey),
                _navButton('Skills', _skillsKey),
                _navButton('Education', _educationKey),
                _navButton('Certifications', _certKey),
                _navButton('Contact', _contactKey),
                const SizedBox(width: 12),
              ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              const HeroSection(),
              KeyedSubtree(key: _aboutKey, child: const AboutSection()),
              KeyedSubtree(key: _skillsKey, child: const SkillsSection()),
              KeyedSubtree(key: _educationKey, child: const EducationSection()),
              KeyedSubtree(key: _certKey, child: const CertificationsSection()),
              KeyedSubtree(key: _contactKey, child: const ContactSection()),
              const FooterSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navButton(String label, GlobalKey key) {
    return TextButton(
      onPressed: () => _scrollTo(key),
      child: Text(
        label,
        style:
            const TextStyle(color: Colors.white70, fontWeight: FontWeight.w600),
      ),
    );
  }
}
