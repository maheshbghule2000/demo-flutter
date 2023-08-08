import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pagination_demo/utils/initial_binding.dart';
import 'package:pagination_demo/utils/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_storage/get_storage.dart';
// void main() {
//   runApp(const MyApp());
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  // setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  await GetStorage.init();
  initialBinding();
  runApp(MyApp(
    prefs: sharedPreferences,
  ));
}

class MyApp extends StatefulWidget {
  final SharedPreferences? prefs;
  const MyApp({
    Key? key,
    this.prefs,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Routes _routes = Routes();

  @override
  void initState();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(360, 690),
        builder: (BuildContext context, child) {
          return GetMaterialApp.router(
            title: 'Demo',
            theme: ThemeData(fontFamily: 'Kumbh Sans'),
            themeMode: ThemeMode.system,
            debugShowCheckedModeBanner: false,
            routeInformationProvider: _routes.router.routeInformationProvider,
            routeInformationParser: _routes.router.routeInformationParser,
            routerDelegate: _routes.router.routerDelegate,
          );
        });
  }
}
