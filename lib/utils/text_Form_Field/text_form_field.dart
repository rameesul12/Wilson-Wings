import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors/colors.dart';

class TextformField1 extends StatelessWidget {
  final String hintText;
  final TextEditingController textController;
  final IconData textIcon;
 
   

    TextformField1({super.key, required this.hintText, required this.textController, required this.textIcon});

  @override
  Widget build(BuildContext context) {
   
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        

         validator: (hintText) => hintText!.isEmpty ? "$hintText not filled ":null,
       
        controller: textController,
     
        textAlign: TextAlign.left,
      
        style:const  TextStyle(fontSize: 11,color: textBlack),
        
        decoration: InputDecoration(
          filled: true,
        // fillColor:Colors.black ,
          // contentPadding: new EdgeInsets.symmetric(vertical: 0.0),
        // icon: Icon(textIcon,color: Colors.white,),
          prefixIcon:Icon(textIcon,color:textBlack,),
          hintText: hintText,hintStyle:const TextStyle(color: Colors.grey),
          border:
          OutlineInputBorder(    
            borderRadius:
             BorderRadius.circular(13)
          )
        
            
        ),
      ),
    );
  }
}