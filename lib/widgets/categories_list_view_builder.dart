import 'package:flutter/material.dart';
import 'package:news_app/widgets/categories_list_view.dart';

class CategoriesListviewBuilder extends StatelessWidget {
  const CategoriesListviewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 100,
      child: CategoriesListview(),
    );
  }
}
