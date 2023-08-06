import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:wilson_wings/utils/colors/colors.dart';

import '../login_page/login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    navigatehome(context);
    return Scaffold(
     // backgroundColor: const Color.fromARGB(255, 4, 24, 41),
    body: Center(
      child:SafeArea(child: 
      SizedBox(
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        height: 200,
        width: 200,
        child: Center(
          child: AnimatedTextKit(animatedTexts: [
            TyperAnimatedText('Wilson ',textStyle:const TextStyle(color: textBlack,fontSize: 35,fontWeight: FontWeight.bold)),
           TyperAnimatedText('Wings',textStyle:const TextStyle(color: Colors.black,fontSize: 35,fontWeight: FontWeight.bold))
          ]),
        ),
        ),
      )
      ) ,
    );
  
    }

    navigatehome(BuildContext context)async{
      await Future.delayed (const Duration(seconds: 3));
     // ignore: use_build_context_synchronously
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const LoginPage()));
    
    }
  
}