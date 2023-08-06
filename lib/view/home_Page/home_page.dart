import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wilson_wings/utils/colors/colors.dart';
import 'package:wilson_wings/utils/sized_Box/sized_box.dart';
import 'package:wilson_wings/view_Model/movies_Section.dart/movie_section_controller.dart';

import 'movie_details.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final movieSectionController = Get.put(MovieSectionController());

    return Scaffold(
      appBar: AppBar(
        //   backgroundColor: ,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: textwhite,
            )),
        title: const Text(
          "Banner Page",
          style: TextStyle(color: textwhite, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
             children: [
            Expanded(
              child: GetX<MovieSectionController>(
                builder: (controller) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        return  FilimBanner(
                         
                          movieImage:controller.movies[index].backdropPath ,
                          movieName: controller.movies[index].title,
                           release_date: "${controller.movies[index].releaseDate}",
                         
                        );
                      },
                      separatorBuilder: (context, index) =>  SizedBox(height: Adaptive.h(4),),
                      itemCount: controller.movies.length);
                }
              ),
            ),
            sizedH40
          ])),
      floatingActionButton: SizedBox(
        width: Adaptive.w(90),
        child: FloatingActionButton(
          backgroundColor: buttonColor,
          onPressed: () {
           log(movieSectionController.movies[0].id.toString());
          },

          //  backgroundColor:buttonColor ,
          child: const Text(
            "Favorite Page",
            style: TextStyle(color: textwhite),
          ),
        ),
      ),
    );
  }
}
