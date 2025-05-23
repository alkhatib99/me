// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CenteredView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: CenteredViewDesk(child: Container()),
      tablet: CenteredViewTab(child: Container()),
      mobile: CenteredViewMob(child: Container()),
    );
  }
}

class CenteredViewDesk extends StatelessWidget {
  final Widget child;
  const CenteredViewDesk({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 2000),
        child: child,
      ),
    );
  }
}

class CenteredViewMob extends StatelessWidget {
  final Widget child;
  const CenteredViewMob({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1200),
        child: child,
      ),
    );
  }
}

class CenteredViewTab extends StatelessWidget {
  final Widget child;
  const CenteredViewTab({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1200),
        child: child,
      ),
    );
  }
}
