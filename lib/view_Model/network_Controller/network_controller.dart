import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wilson_wings/utils/colors/colors.dart';
class NetworkController extends GetxController{

final Connectivity connectivity=Connectivity();

@override
void onInit() {

    super.onInit();
    connectivity.onConnectivityChanged.listen(updateConnectionStatus);
  }
   
   void updateConnectionStatus(ConnectivityResult connectivityResult){
      if (connectivityResult==ConnectivityResult.none) {
      //  Get.to(()=>);
       Get.rawSnackbar(
        messageText: const Text('PLEASE CONNECT TO THE INTERNET',
        style: TextStyle(color: textBlack,fontSize: 14),
        ),
        isDismissible: false,
        duration: const Duration(days: 1),
        backgroundColor: Colors.red,
        icon:const Icon(Icons.wifi_off,color: textBlack,),
        snackStyle: SnackStyle.GROUNDED
       );
      }else{
        if (Get.isSnackbarOpen) {
          Get.closeCurrentSnackbar();
        }
      }
   }

}