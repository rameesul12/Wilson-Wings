import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wilson_wings/utils/get_error.dart';
import 'package:wilson_wings/view/home_Page/home_page.dart';

class LoginController extends GetxController{
 
  RxBool obscureValue = true.obs;
   RxBool isLoading=false.obs;

  void changeObscure() {
    if (obscureValue.value == true) {
      obscureValue.value = false;
    } else {
      obscureValue.value = true;
    }
  }

  signInWithEmailAndPassword(String email,String password,BuildContext context) async{
    try {
 await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password,
  );
  isLoading=true.obs;
  Get.to(()=>const HomePage());
  
} on FirebaseAuthException catch (e) {
  isLoading=false.obs;
  if (e.code == 'user-not-found') {
   getMessage('No user found for that email.', context);
  } else if (e.code == 'wrong-password') {
    
    getMessage('Wrong password provided for that user.', context);

  }else{
    log(e.toString());
    getMessage(e.toString(), context);
  }
}
  }

}