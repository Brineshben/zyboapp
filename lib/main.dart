import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Service/controller_handling.dart';
import 'Service/sharedpreference.dart';
import 'View/LoginScreen/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ));
  SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
      ]
  );
  final sharedPrefs = SharedPrefs();
  await sharedPrefs.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HandleControllers.createGetControllers();

    return  const ScreenUtilInit(
      designSize: Size(430, 930),
      minTextAdapt: true,
      splitScreenMode: true,

      child: GetMaterialApp(
        title: 'ProductListing App',
        debugShowCheckedModeBanner: false,

        home: SplashScreen(),
      
      
      ),
    );
  }
}

