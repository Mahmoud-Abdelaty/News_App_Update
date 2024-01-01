import 'package:flutter/material.dart';
import 'package:news_app/widgets/shimmer.dart';

class LoadingCategoryCard extends StatelessWidget {
  const LoadingCategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Shimmer(
          height: 100,
          width: 200,
        ));
  }
}
