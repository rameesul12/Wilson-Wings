
// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wilson_wings/utils/colors/colors.dart';
import 'package:wilson_wings/utils/common_Function/common_function.dart';
import 'package:wilson_wings/utils/get_error.dart';
import 'package:wilson_wings/utils/text_Form_Field/text_form_field.dart';
import 'package:wilson_wings/view/login_page/login_page.dart';
import 'package:wilson_wings/view_Model/login_And_Password/login_view_controller.dart';
import 'package:wilson_wings/view_Model/login_And_Password/sign_up_controller.dart';

import '../../utils/sized_Box/sized_box.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
 
 final signUpController=Get.put(SignUpController());

  final TextEditingController email=TextEditingController();
  final TextEditingController password=TextEditingController();
  final key=GlobalKey<FormState>();
  
      return Scaffold(
        appBar: AppBar(title: const Center(
          child: Text(
                  'Sign Up',
                  style: TextStyle(color: textBlack, fontSize: 30),
                ),
        ),
        ),
              
       body: SingleChildScrollView(
        child: Form(
        key: key,
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
            //  crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             //sizedH10,
              // const Center(
              //     child: Text(
              //   'Login Page',
              //   style: TextStyle(color: textBlack, fontSize: 30),
              // )),
            sizedH60,
            //  sizedH60,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextformField1(
                  hintText:  'Enter Email',
                  textController:email,
                  textIcon: Icons.email,
                ),
              ),
              sizedH10,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextformField1(
                  hintText: 'Enter password',
                  textController:password,
                  textIcon: Icons.lock,
                ),
              ),
              sizedH60,
              SizedBox(
                height: 50,
                width: Adaptive.w(90),
                child: ElevatedButton(
                  onPressed: () async {
                    if (key.currentState!.validate()) {
                      if (validPassword(password.text)==true) {
                        getMessage("please enter atleast 6 Characters", context);
                      }
                     signUpController.createUserWithEmailAndPassword(email.text, password.text, context);
                   // await provider.loginFunction(provider.userNameController.text.trim(),provider.passWordController.text.trim(), context);
                    }else{
                    getMessage("please fill the Fields", context);
                    }
                  
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: buttonColor,
                  ),
                  // ignore: unrelated_type_equality_checks
                  child: const Text(
                   
                    'Sign Up',
                    style:
                        TextStyle(color: textwhite, fontWeight: FontWeight.bold),
                  )
                ),
              ),
                TextButton(
                  onPressed: () {
                  Get.offAll(()=>const LoginPage());
                   
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(color: textBlack),
                  ))
             
            
            ],
          ),
        ),
      ),
    );
  }
}