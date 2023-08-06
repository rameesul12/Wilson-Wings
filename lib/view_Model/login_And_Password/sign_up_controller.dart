import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wilson_wings/utils/common_Function/get_error.dart';
import 'package:wilson_wings/view/home_page/home_page.dart';

class SignUpController extends GetxController{


createUserWithEmailAndPassword(String email,String password,BuildContext context)async{

try {
  await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
  Get.offAll(()=>const HomePage());
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    
    getMessage("The password provided is too weak.", context);
  } else if (e.code == 'email-already-in-use') {
  
    getMessage("The account already exists for that email.", context);
  }
} catch (e) {
  log(e.toString());
  getMessage(e.toString(), context);
}

}

}