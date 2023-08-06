

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wilson_wings/model/upcoming_movies.dart';
import 'package:http/http.dart'as http;
import 'package:wilson_wings/services/api_get_function.dart';
import 'package:wilson_wings/utils/apiconfiguaration/api_configuaration.dart';

class MovieSectionController extends GetxController{

RxList<Result> movies = (List<Result>.of([])).obs;

// @override
// void onInit() {
//     upcomingMovieGeting();
//     super.onInit();
//   }

Future upcomingMovieGeting(BuildContext context)async{
  final uri=ApiConfiguaration.upcomingMovies;

  final http.Response response;

try {
    response=await apiGet(uri);
  final data=jsonDecode(response.body)as Map<String,dynamic>;

  if (response.statusCode==200) {
    log('success');
    List<Result> temp=(data['results']as List).map((e) => Result.fromJson(e)).toList();
   
   movies.value=temp;
  //  log(movies.toString());
  }
} catch (e) {
  log(e.toString());
}

}


}