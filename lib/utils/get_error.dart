

import 'package:flutter/material.dart';

getMessage(String text,BuildContext context){

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text),duration:const Duration(seconds: 4),));
}