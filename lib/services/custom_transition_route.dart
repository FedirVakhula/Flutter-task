import 'package:flutter/widgets.dart';

class CustomTransitionRoute extends PageRouteBuilder {
  final RouteSettings settings;
  final WidgetBuilder builder;
  CustomTransitionRoute({this.settings, this.builder})
      : super(
          settings: settings,
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              builder(context),
          transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) =>
              SlideTransition(
            position: animation.drive(
              Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ),
            ),
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          ),
        );
}
