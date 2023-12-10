

import 'package:flutter/material.dart';
import 'package:news_app/shared/styles/app_color.dart';

class CategoryItemModel {
  String category;
  String categoryTitle;
  Color categoryColor;
  String categoryImage;

  CategoryItemModel(
      {required this.category,
      required this.categoryTitle,
      required this.categoryColor,
      required this.categoryImage});

  static List<CategoryItemModel> getCategoryItems() {
    return [
      CategoryItemModel(
          category: 'sports',
          categoryTitle: 'Sports',
          categoryColor: AppColor.redColor,
          categoryImage: 'assets/images/sports.png'),
      CategoryItemModel(
          category: 'general',
          categoryTitle: 'General',
          categoryColor: AppColor.darkBlueColor,
          categoryImage: 'assets/images/Politics.png'),
      CategoryItemModel(
          category: 'health',
          categoryTitle: 'Health',
          categoryColor: AppColor.lightRedColor,
          categoryImage: 'assets/images/health.png'),
      CategoryItemModel(
          category: 'business',
          categoryTitle: 'Business',
          categoryColor: AppColor.orangeColor,
          categoryImage: 'assets/images/business.png'),
      CategoryItemModel(
          category: 'entertainment',
          categoryTitle: 'Entertainment',
          categoryColor: AppColor.lightBlueColor,
          categoryImage: 'assets/images/environment.png'),
      CategoryItemModel(
          category: 'science',
          categoryTitle: 'Science',
          categoryColor: AppColor.yellowColor,
          categoryImage: 'assets/images/science.png'),
      CategoryItemModel(
          category: 'technology',
          categoryTitle: 'Technology',
          categoryColor: AppColor.redColor,
          categoryImage: 'assets/images/Politics.png'),
    ];
  }
}
