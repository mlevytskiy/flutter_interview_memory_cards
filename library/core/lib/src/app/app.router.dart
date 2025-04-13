import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_paths/go_router_paths.dart';

import '../screen/screen0_home/home_screen.dart';

// import 'app.locator.dart';

class RouterMediator {
  late GoRouter _router;

  RouterMediator();

  Future<void> init() async {
    _router = GoRouter(
      initialLocation: AppPaths.home.path,
      routes: [
        GoRoute(
          path: AppPaths.home.goRoute,
          builder: (context, state) {
            // Di.initAppLocalization(context);
            return const HomeScreen();
          },
          routes: const [],
        ),
      ],
    );
  }

  GoRouteInformationProvider getProvider() => _router.routeInformationProvider;

  GoRouteInformationParser getParser() => _router.routeInformationParser;

  GoRouterDelegate getDelegate() => _router.routerDelegate;

  void goHome() {
    _go(AppPaths.home.path);
  }

  void goBack(bool result) {
    _router.pop(result);
  }

  void _go(String path, {Object? extra}) {
    _router.go(path, extra: extra);
  }

  Future<T?> _push<T extends Object?>(String path, {Object? extra}) async {
    return await _router.push<T>(path, extra: extra);
  }
}

class AppPaths {
  static final HomePath home = HomePath();
}

class HomePath extends Path<HomePath> {
  HomePath() : super('home');
}

class CustomTransitionPageBuilder {
  final Duration duration;
  final Widget child;
  final Curve curve;
  CustomTransitionPageBuilder(
      {this.duration = const Duration(seconds: 2), this.curve = Curves.ease, required this.child});

  CustomTransitionPage build() {
    return CustomTransitionPage(
      fullscreenDialog: false,
      opaque: false,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      child: child,
      transitionDuration: duration,
    );
  }
}
