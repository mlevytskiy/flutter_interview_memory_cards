import 'package:auto_injector/auto_injector.dart';

import 'app.router.dart';
import 'long_running_isolate.dart';
// late AppLocalizations s;

class Di {
  static final AutoInjector locator = AutoInjector();

  static RouterMediator get routeMediator => locator.get<RouterMediator>();
  static YAJsonIsolate get readAssetsIsolate => locator.get<YAJsonIsolate>();

  static double statusBarHeight = 0;

  static Future<void> initLocator() async {
    // locator.addLazySingleton<UserRepository>(MemoryUserRepository.new);
    locator.addLazySingleton<RouterMediator>(RouterMediator.new);
    locator.addLazySingleton<YAJsonIsolate>(YAJsonIsolate.new);
    // locator.addInstance<BuildContext?>(null); //will be replaced later
    // locator.addLazySingleton<AppLocalizations>(
    //   () => AppLocalizations.of(locator.get<BuildContext?>()!),
    // );
    locator.commit();
    await routeMediator.init();
    await readAssetsIsolate.initialize();
  }

  // static void initAppLocalization(BuildContext context) {
  //   locator.replaceInstance<BuildContext?>(context);
  //   s = locator.get<AppLocalizations>();
  // }
}
