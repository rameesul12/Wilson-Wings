
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wilson_wings/utils/colors/colors.dart';
import 'package:wilson_wings/utils/common_Function/get_error.dart';
import 'package:wilson_wings/utils/text_Form_Field/text_form_field.dart';
import 'package:wilson_wings/view/sign_up/sign_up_page.dart';
import 'package:wilson_wings/view_Model/login_And_Password/login_view_controller.dart';
import 'package:wilson_wings/view_Model/movies_Section.dart/movie_section_controller.dart';

import '../../utils/sized_Box/sized_box.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
 
 final loginController=Get.put(LoginController());
 final movieController=Get.put(MovieSectionController());

  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  final key=GlobalKey<FormState>();
  
      return Scaffold(
        appBar: AppBar(title:const Center(
          child: Text(
                  'Login',
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
                  hintText: 'Email',
                  textController:emailController,
                  textIcon: Icons.email,
                ),
              ),
              sizedH10,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextformField1(
                  hintText: 'password',
                  textController:passwordController,
                  textIcon: Icons.lock,
                ),
              ),
              sizedH60,
              SizedBox(
                height: 50,
                width: Adaptive.w(90),
                child: GetX<LoginController>(
                  builder: (controller) {
                    return ElevatedButton(
                      onPressed: () async {
                        if (key.currentState!.validate()) {
                          
                         loginController.signInWithEmailAndPassword(emailController.text, passwordController.text, context);
                       // await provider.loginFunction(provider.userNameController.text.trim(),provider.passWordController.text.trim(), context);
                       movieController.upcomingMovieGeting(context);
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
                      child: controller.isLoading==false? const Text(
                       
                        'Login',
                        style:
                            TextStyle(color: textwhite, fontWeight: FontWeight.bold),
                      ): const Center(child: CircularProgressIndicator(),)
                    );
                  }
                ),
              ),
             
                 TextButton(
                  onPressed: () {
                  Get.offAll(()=>const SignUp());
                   
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(color: textBlack),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}