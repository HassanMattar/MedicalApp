
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating/flutter_rating.dart';

class StarsRating extends StatelessWidget {
  const StarsRating({
    super.key,
    required this.doctorRating,
    required this.onRating,
  });

  final double doctorRating;
  final void Function(double rating) onRating;

  @override
  Widget build(BuildContext context) {
    return StarRating(
      size: 20,
      rating: doctorRating * 1.0,
      color: Colors.orange,
      borderColor: Colors.grey,
      allowHalfRating: false,
      starCount: 5,
      onRatingChanged: onRating,
    );
  }
}
