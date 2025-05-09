import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:DeveloperFolio/configure/centeredview.dart';
import 'package:DeveloperFolio/pages/achievementspage.dart';
import 'package:DeveloperFolio/pages/blogpage.dart';
import 'package:DeveloperFolio/pages/contactpage.dart';
import 'package:DeveloperFolio/pages/homepage.dart';
import 'package:DeveloperFolio/pages/skillspage.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:DeveloperFolio/include/CenteringOfPages/Education.dart';
import 'package:DeveloperFolio/include/Rows/contactpagemain.dart';

const String SkillsRoute = 'skills';
const String ProjectsRoute = 'projects';
const String EducationRoute = 'education';
const String AchievementsRoute = 'achievements';
const String ContactRoute = 'contact';
const String BlogRoute = 'blogs';
const String HomeRoute = 'Home';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(HomePage(), settings.name ?? '');
    case SkillsRoute:
      return _getScreenTypeRoute(SkillsPage(), settings);
    case ProjectsRoute:
      return _getScreenTypeRoute(BlogPage(), settings);
    case EducationRoute:
      return _getScreenTypeRoute(
          EducationDesk(), settings, EducationTab(), EducationMob());
    case AchievementsRoute:
      return _getScreenTypeRoute(AchievementsPage(), settings);
    case ContactRoute:
      return _getScreenTypeRoute(
          ContactPageDesk(), settings, ContactPage(), ContactPage());
    case BlogRoute:
      return _getScreenTypeRoute(BlogPage(), settings);
    default:
      return _getPageRoute(HomePage(), settings.name ?? '');
  }
}

Route<dynamic> _getScreenTypeRoute(Widget desktop, RouteSettings settings,
    [Widget? tablet, Widget? mobile]) {
  return _getPageRoute(
    ScreenTypeLayout.builder(
      desktop: (context) => CenteredViewDesk(child: desktop),
      tablet: (context) => CenteredViewTab(child: tablet ?? desktop),
      mobile: (context) => CenteredViewMob(child: mobile ?? desktop),
    ),
    settings.name ?? '',
  );
}

PageRoute _getPageRoute(Widget child, String routeName) {
  return _FadeRoute(child: child, routeName: routeName);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;

  _FadeRoute({required this.child, required this.routeName})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return child;
          },
          settings: RouteSettings(name: routeName),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
}
