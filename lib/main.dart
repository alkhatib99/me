import 'package:DeveloperFolio/pages/homepage.dart';
import 'package:DeveloperFolio/pages/skillspage.dart';
import 'package:DeveloperFolio/pages/blogpage.dart';
import 'package:DeveloperFolio/pages/educationpage.dart';
import 'package:DeveloperFolio/pages/achievementspage.dart';
import 'package:DeveloperFolio/pages/contactpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'configure/navigation_service.dart';
import 'package:DeveloperFolio/bindings/skills_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  setupLocator();
  if (savedThemeMode == AdaptiveThemeMode.dark) {
    GoogleFonts.config.allowRuntimeFetching = false;
  } else {
    GoogleFonts.config.allowRuntimeFetching = true;
  }

  runApp(MyApp(savedThemeMode: savedThemeMode ?? AdaptiveThemeMode.light));
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode savedThemeMode;
  MyApp({required this.savedThemeMode});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        // brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
            .copyWith(secondary: Colors.amber),
      ),
      dark: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        // brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red)
            .copyWith(surface: Colors.black)
            .copyWith(secondary: Colors.amber),
      ),
      initial: savedThemeMode,
      builder: (theme, darkTheme) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DeveloperFolio',
        theme: theme,
        darkTheme: darkTheme,
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => HomePage()),
          GetPage(
              name: '/skills',
              page: () => SkillsPage(),
              binding: SkillsBinding()),
          GetPage(name: '/projects', page: () => BlogPage()),
          GetPage(name: '/education', page: () => EducationPage()),
          GetPage(name: '/achievements', page: () => AchievementsPage()),
          GetPage(name: '/contact', page: () => ContactPage()),
        ],
      ),
    );
  }
}
