

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/colors/colors.dart';

class FilimBanner extends StatelessWidget {
  const FilimBanner({
    super.key,
    required this.movieImage,
    required this.movieName,
    required this.release_date
   
  });

  final String movieImage;
  final String movieName;
  final String release_date;
  

  @override
  Widget build(BuildContext context) {
  //  final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: Adaptive.h(60),
        width: Adaptive.w(40),
        decoration: BoxDecoration(
          border: Border.all(color:textBlack ),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                // width: Adaptive.w(width),
                 height:Adaptive.h(50),
                child: Image.network(
                 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2$movieImage',
                  fit: BoxFit.fill,
                 errorBuilder: (context, error, stackTrace) {
                   return const Text("error occud");
                 },
                    
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return Center(child: child);
                    } else {
                      return Center(child: const CircularProgressIndicator());
                    }
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Adaptive.w(60),
                    child: Text(
                      movieName,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: textBlack,
                          fontSize: 25,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                 
                ],
              ),
              Text(
                release_date.substring(0,10),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: textBlack),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
