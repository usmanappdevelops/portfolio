/// All portfolio content lives here in one place.
/// Update this file whenever resume details change — no need to touch UI code.
library portfolio_data;

class PersonalInfo {
  static const String name = 'Muhammad Usman';
  static const String title = 'Flutter Developer | UI/UX Focused Mobile Engineer';
  static const String tagline =
      'Turning UI/UX designs into smooth, cross-platform Flutter apps.';
  static const String aboutMe =
      'Flutter Developer skilled in Dart, REST APIs, and state management '
      'with Provider. Built 5+ personal projects including e-commerce and '
      'music apps with Firebase backend. Strong in translating UI/UX designs '
      'into functional, cross-platform mobile apps. Eager to contribute to a '
      'collaborative team and grow as a full-stack mobile engineer.';

  static const String phone = '+923498373199';
  static const String email = 'usmanappdevelops@gmail.com';
  static const String address = 'AwanTown Khichiwala, Fortabbas';
  static const String github = 'https://github.com/usmanappdevelops';
  static const String linkedin = 'https://www.linkedin.com/in/muhammadusman1168';
  // Profile photo is now bundled locally in the app assets.
  static const bool hasProfileImage = true;
  static const String profileImagePath = 'assets/images/profile.png';
}

class EducationItem {
  final String degree;
  final String institute;
  final String duration;
  final String? note;
  const EducationItem({
    required this.degree,
    required this.institute,
    required this.duration,
    this.note,
  });
}

class Education {
  static const List<EducationItem> items = [
    EducationItem(
      degree: 'BS Information Technology',
      institute: 'The Islamia University, BWP',
      duration: '2023 - Present',
    ),
    EducationItem(
      degree: 'Intermediate',
      institute: 'Govt. Graduate College, FTA',
      duration: '2021 - 2023',
    ),
    EducationItem(
      degree: 'Matric',
      institute: 'Govt. High School 185/7.R',
      duration: '2019 - 2021',
    ),
  ];
}

class TrainingItem {
  final String title;
  final String duration;
  final String description;
  const TrainingItem({
    required this.title,
    required this.duration,
    required this.description,
  });
}

class Training {
  static const List<TrainingItem> items = [
    TrainingItem(
      title: 'Dev Castle – NAVTTC Program',
      duration: '2025 - 2026',
      description:
          'Currently learning Flutter and Dart through project-based '
          'mobile app development training.',
    ),
  ];
}

class CertificationItem {
  final String title;
  final String issuer;
  final String year;
  const CertificationItem({
    required this.title,
    required this.issuer,
    required this.year,
  });
}

class Certifications {
  static const List<CertificationItem> items = [
    CertificationItem(
      title: 'First Aid Training',
      issuer: 'Red Crescent Pakistan',
      year: '2018',
    ),
    CertificationItem(
      title: 'Google AI Essential',
      issuer: 'Coursera',
      year: '2025',
    ),
    CertificationItem(
      title: 'Flutter, Dart & Firebase',
      issuer: 'Dev Castle BWP',
      year: '2026',
    ),
  ];
}

class SkillCategory {
  final String category;
  final List<String> skills;
  const SkillCategory({required this.category, required this.skills});
}

class TechnicalSkills {
  static const List<SkillCategory> categories = [
    SkillCategory(category: 'Mobile', skills: ['Flutter', 'Dart']),
    SkillCategory(category: 'State Management', skills: ['Provider']),
    SkillCategory(
      category: 'Backend & APIs',
      skills: ['Firebase', 'JSON', 'Firestore'],
    ),
    SkillCategory(
      category: 'Tools',
      skills: ['Git', 'VS Code', 'Android Studio', 'Figma'],
    ),
    SkillCategory(
      category: 'Other',
      skills: ['App/Play Store Deployment', 'Push Notifications', 'Google Maps'],
    ),
  ];
}

class SoftSkills {
  static const List<String> items = [
    'Management Skills',
    'Creativity',
    'Negotiation',
    'Critical Thinking',
    'Leadership',
  ];
}
