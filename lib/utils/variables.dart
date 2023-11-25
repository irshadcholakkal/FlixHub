
import 'package:flutter/material.dart';
import 'package:quadb_test/model/model-class.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Forecast ?forecast;
double?height;
double?width;
 bool isLoading=true;
 num ?lengths;
 List<Forecast>? datas;

Widget buildShimmerEffect() {
  return Shimmer.fromColors(
    baseColor: Colors.black,
    highlightColor: Colors.grey[900]!,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
  );
}
Widget ratingBar({required  rating,required double minirating,required double size}){
  
  return  RatingBar.builder(
    itemSize: size,
      initialRating: rating/2??0,
      minRating: minirating,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      //itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber[700]),
      onRatingUpdate: (rating) {
      },
    );
}
