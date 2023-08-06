

import 'package:get/get.dart';
import 'package:wilson_wings/view_Model/network_Controller/network_controller.dart';

class DependencyInjection{

  static void init(){
  
   Get.put<NetworkController>(NetworkController(),permanent: true);
   }
}