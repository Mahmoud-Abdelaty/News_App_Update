import 'package:flutter/material.dart';
import 'package:news_app/constant/variables.dart';
import 'package:news_app/widgets/categories_list_view.dart';
import 'package:news_app/widgets/loading_category_card.dart';

class CategoriesListviewBuilder extends StatelessWidget {
  const CategoriesListviewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: isLoaded
          ? const CategoriesListview()
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => const LoadingCategoryCard(),
            ),
    );
  }
}
