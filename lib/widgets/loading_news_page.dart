// cached network image
import 'package:flutter/material.dart';
import 'package:news_app/widgets/shimmer.dart';

class LoadingPage extends StatelessWidget {
  LoadingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Shimmer(
            height: 200,
            width: double.infinity,
          ),
          const SizedBox(height: 12),
          Shimmer(
            height: 13,
            width: double.infinity,
          ),
          const SizedBox(height: 8),
          Shimmer(
            height: 8,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
