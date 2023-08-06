import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wilson_wings/utils/colors/colors.dart';
import 'package:wilson_wings/utils/sized_Box/sized_box.dart';

import '../../view_Model/movies_Section.dart/movie_section_controller.dart';

class MovieInfo extends StatelessWidget {
   MovieInfo({super.key,required this.index});
  int index;

  @override
  Widget build(BuildContext context) {
    final sectionMovies=Get.put(MovieSectionController());
    return Scaffold(
      body: SafeArea(
        child: GetX<MovieSectionController>(
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: Adaptive.h(30),
                  
                width: Adaptive.w(90),
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                  borderRadius: BorderRadiusDirectional.circular(10)
                ),
                child: Image.network(
                 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2${controller.movies[index].posterPath}'
               ,fit: BoxFit.fill,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress==null) {
                    return child;
                  }else{
                    return const CircularProgressIndicator();
                  }
                },
                ),
                ),
                sizedH10,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Movie Name:",style: TextStyle(color: textBlack,fontSize: 20,fontWeight: FontWeight.bold),),
                      Text(controller.movies[index].originalTitle,style: TextStyle(color: textBlack,fontSize: 20,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    
                      Text("Released Date:",style: TextStyle(color: textBlack,fontSize: 20,fontWeight: FontWeight.bold),),
                      Text(controller.movies[index].releaseDate.toString().substring(0,10),style: TextStyle(color: textBlack,fontSize: 20,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                   const   Text("Original Languege:",style: TextStyle(color: textBlack,fontSize: 20,fontWeight: FontWeight.bold),),
                      Text(controller.movies[index].originalLanguage,style: TextStyle(color: textBlack,fontSize: 20,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              const  Text("Overview",style: TextStyle(color: textBlack,fontWeight: FontWeight.w900),)
               ,
                SizedBox(
                   width:Adaptive.w(90),
                  // height: Adaptive.h(60),
                 //  height: Adaptive.h(50),
                  child: Text(controller.movies[index].overview,)),
            
              ],
            );
          }
        ),
      ),
            floatingActionButton: SizedBox(
        width: Adaptive.w(90),
        child: FloatingActionButton(
          isExtended: true,
          backgroundColor: buttonColor,
          onPressed: () async {
         //  log(movieSectionController.movies[0].id.toString());
        const Center(child: CircularProgressIndicator());
        await sectionMovies.addToFavorite(context);
         Get.back();
         
          },

          //  backgroundColor:buttonColor ,
          child: const Text(
            "Add to Favorite",
            style: TextStyle(color: textwhite),
          ),
        ),
      ),
    );
  }
}