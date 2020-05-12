import 'package:devsteam/services/custom_transition_route.dart';
import 'package:devsteam/ui/photo_details_screen.dart';
import 'package:flutter/material.dart';

class NavigationService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Navigator(
          onGenerateRoute: generateRoute,
        ));
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Route route;
    switch (settings.name) {
      case 'photo':
        route = CustomTransitionRoute(
            settings: settings,
            builder: (context) => PhotoDetailsScreen(settings.arguments));
        break;
    }
    return route;
  }
}
