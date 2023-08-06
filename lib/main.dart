import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wilson_wings/view/splash_Screen/splash_screen.dart';
import 'package:wilson_wings/view_model/network_Controller/dipendency_injection.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      // ignore: non_constant_identifier_names
      builder: (context,Orientation,ScreenType) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
          
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home:const SplashScreen(),
   //   home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      }
    );
  }
}
