import 'package:flutter/material.dart';

class Shimmer extends StatelessWidget {
  Shimmer({
    super.key,
    required this.height,
    required this.width,
  });

  double height;
  double width;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Container(
        height: height,
        // color: Colors.black.withAlpha(25),
        width: width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.grey,
                Colors.orangeAccent,
              ],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
              tileMode: TileMode.repeated),
        ),
      ),
    );
  }
}
