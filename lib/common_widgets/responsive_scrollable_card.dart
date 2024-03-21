import '../constants/app_sizes.dart';
import 'package:flutter/material.dart';
import '../constants/breakpoints.dart';
import 'package:ecomflutter/common_widgets/responsive_center.dart';

class ResponsiveScrollableCard extends StatelessWidget {
  /// Scrollable widget that shows a responsive card with a given child widget.
  /// Useful for displaying forms and other widgets that need to be scrollable.

  const ResponsiveScrollableCard({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: ResponsiveCenter(
        maxContentWidth: Breakpoint.tablet,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p4),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(Sizes.p4),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
