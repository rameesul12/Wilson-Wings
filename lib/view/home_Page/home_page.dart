import 'package:flutter/material.dart';
import 'package:wilson_wings/utils/colors/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Home Page",style: TextStyle(color: textBlack)),),
    );
  }
}