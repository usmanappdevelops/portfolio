# Muhammad Usman — Flutter Portfolio App

A complete, ready-to-run Flutter portfolio app built from your resume data,
showcasing your About, Technical Skills, Soft Skills, Education, Professional
Training, Certifications, and Contact info.

## How to run it

1. Make sure Flutter is installed: https://docs.flutter.dev/get-started/install
2. Unzip this project, then in a terminal:
   ```
   cd usman_portfolio
   flutter pub get
   flutter run
   ```
   To run it as a website instead of a mobile app:
   ```
   flutter run -d chrome
   ```

## Project structure

```
lib/
  main.dart                     -> App entry point
  models/portfolio_data.dart    -> ALL your resume content lives here
  theme/app_theme.dart          -> Colors, gradients, responsive breakpoints
  screens/home_screen.dart      -> Assembles all sections + nav bar
  widgets/
    hero_section.dart           -> Top banner: name, title, photo, socials
    about_section.dart          -> About Me + quick stats
    skills_section.dart         -> Technical + soft skills
    education_section.dart      -> Education + professional training timeline
    certifications_section.dart -> Certification cards
    contact_section.dart        -> Phone / email / GitHub / LinkedIn cards
    footer_section.dart         -> Footer
```

## Customizing your content

Everything you'd want to change (name, about text, skills, education,
certifications, contact links) is in **one file**:
`lib/models/portfolio_data.dart` — no need to touch any UI/widget code.

## Adding your profile photo

1. Create the folder `assets/images/` in the project root.
2. Add your photo there, named `profile.jpg` (or update the path).
3. In `lib/models/portfolio_data.dart`, set:
   ```dart
   static const bool hasProfileImage = true;
   ```

## Adding real projects

The resume mentioned "5+ personal projects." Once you're ready to showcase
them, I can add a dedicated Projects section (with images, tech tags, and
GitHub/live links) — just share the project details.

## Notes

- Built with Material 3 dark theme, a navy/blue/cyan gradient identity.
- Fully responsive: adapts layout for mobile, tablet, and desktop/web widths.
- Uses `url_launcher` to open email, phone, GitHub, and LinkedIn links.
- No paid or account-gated packages — everything is free and open source.
