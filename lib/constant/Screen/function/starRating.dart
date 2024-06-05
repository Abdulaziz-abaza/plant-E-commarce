import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            Icons.star,
            color: index < _rating ? Colors.amber : Colors.grey,
            size: 30,
          ),
          onPressed: () {
            setState(() {
              _rating = index + 1;
            });
          },
          padding: EdgeInsets.zero, // إزالة المسافة بين النجوم
          constraints: BoxConstraints(minWidth: 0), // إزالة القيود الافتراضية
        );
      }),
    );
  }
}
