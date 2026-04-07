// Updated by Ouchi Nao on 2026/04/01.

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ouchi’ Portfolio',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A192F),
        primaryColor: const Color(0xFF64FFDA),
        textTheme: GoogleFonts.notoSansTextTheme(ThemeData.dark().textTheme),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF0A192F),
                  Color(0xFF112240),
                  Color(0xFF020C1B),
                ],
              ),
            ),
          ),
          
          // Main Content
          SingleChildScrollView(
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 800),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Hero Section
                    const HeroSection().animate().fadeIn(duration: 800.ms).slideY(begin: 0.2, end: 0),
                    
                    const SizedBox(height: 80),
                    
                    // About Section
                    const GlassSection(
                      title: 'whoami',
                      content: Text(
                        'I work as a web engineer at freee. I have a master’s degree, and my research focused on communication robotics.',
                        style: TextStyle(fontSize: 18, height: 1.6),
                      ),
                    ).animate().fadeIn(delay: 400.ms).slideX(),

                    const SizedBox(height: 40),

                    // Skills Section
                    const GlassSection(
                      title: 'ls skills/',
                      content: Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          SkillChip(label: 'Python'),
                          SkillChip(label: 'C++'),
                          SkillChip(label: 'TypeScript'),
                          SkillChip(label: 'golang'),
                          SkillChip(label: 'Dart'),
                          SkillChip(label: 'ROS2'),
                          SkillChip(label: 'React'),
                          SkillChip(label: 'Flutter'),
                          SkillChip(label: 'Ruby on Rails'),
                        ],
                      ),
                    ).animate().fadeIn(delay: 800.ms).slideX(),

                    const SizedBox(height: 40),

                    // Hobby & Study
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: const GlassSection(
                            title: 'cat hobby.txt',
                            content: Text('Coffee, Sake, Eating, etc...'),
                          ).animate().fadeIn(delay: 800.ms),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: const GlassSection(
                            title: 'grep -i "study"',
                            content: Text('Communication Robotics'),
                          ).animate().fadeIn(delay: 1200.ms),
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),

                    // Qualification & Contact
                    const GlassSection(
                      title: 'sudo systemctl status qualification',
                      content: Text('Applied Information Technology Engineer Examination'),
                    ).animate().fadeIn(delay: 1600.ms),

                    const SizedBox(height: 40),

                    const GlassSection(
                      title: 'mail -s "Contact"',
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '7040nao@gmail.com',
                            style: TextStyle(
                              color: Color(0xFF64FFDA),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 24),
                          GitHubButton(),
                        ],
                      ),
                    ).animate().fadeIn(delay: 2000.ms),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hi, my name is',
          style: GoogleFonts.firaCode(
            color: const Color(0xFF64FFDA),
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Ouchi Nao',
          style: GoogleFonts.inter(
            fontSize: 64,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Engineering the future of robotics and web.',
          style: GoogleFonts.inter(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.grey[400],
          ),
        ),
      ],
    );
  }
}

class GlassSection extends StatelessWidget {
  final String title;
  final Widget content;

  const GlassSection({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '> ',
                      style: GoogleFonts.firaCode(
                        color: const Color(0xFF64FFDA),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      title,
                      style: GoogleFonts.firaCode(
                        fontSize: 16,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Divider(color: Colors.white12, height: 32),
                content,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SkillChip extends StatelessWidget {
  final String label;
  const SkillChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF64FFDA).withOpacity(0.5)),
        color: const Color(0xFF64FFDA).withOpacity(0.1),
      ),
      child: Text(
        label,
        style: GoogleFonts.firaCode(
          color: const Color(0xFF64FFDA),
          fontSize: 14,
        ),
      ),
    );
  }
}

class GitHubButton extends StatelessWidget {
  const GitHubButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => launchUrl(Uri.parse('https://github.com/ouchinao')),
        child: Container(
          width: 80,
          height: 80,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF64FFDA), width: 2),
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFF64FFDA).withOpacity(0.05),
          ),
          child: Image.asset(
            'assets/GitHub-Logo.png',
            fit: BoxFit.contain,
            color: const Color(0xFF64FFDA),
          ),
        ),
      ),
    );
  }
}
