import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:core/core.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // Di.locator.addLazySingleton<UserRepository>(()=>UserRepositoryMobile.create());
  await Di.initLocator();
  FlutterNativeSplash.remove();
  runApp(DevicePreview(enabled: true, builder: (context) => const App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final isPlatformDark = WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
    final isWebOnMobileSize = _isWebOnMobileSize(context);
    Di.statusBarHeight = 30;
    return ThemeProvider(
      initTheme: lightTheme, //isPlatformDark ? darkTheme : lightTheme,
      builder: (context, theme) {
        return MaterialApp.router(
          locale: isWebOnMobileSize ? null : DevicePreview.locale(context),
          builder: isWebOnMobileSize ? null : DevicePreview.appBuilder,
          theme: theme,
          routeInformationProvider: Di.routeMediator.getProvider(),
          routeInformationParser: Di.routeMediator.getParser(),
          routerDelegate: Di.routeMediator.getDelegate(),
          title: 'Flutter interview part1',
          // localizationsDelegates: const [
          //   AppLocalizations.delegate,
          //   GlobalMaterialLocalizations.delegate,
          //   GlobalWidgetsLocalizations.delegate,
          //   GlobalCupertinoLocalizations.delegate,
          // ],
          // supportedLocales: const [
          //   Locale('en'), // English
          // ]
        );
      },
    );
  }

  bool _isWebOnMobileSize(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const mobileBreakpoint = 725; // Example: typical max width for mobile devices
    return screenWidth < mobileBreakpoint;
  }
}
