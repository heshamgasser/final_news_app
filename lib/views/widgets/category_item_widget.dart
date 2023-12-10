import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/model/category_item.dart';

class CategoryItem extends StatelessWidget {
  CategoryItemModel categoryItemModel;
  int index;
  Function onTap;

  CategoryItem({required this.categoryItemModel,required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 200.h,
        width: 148.w,
        decoration: BoxDecoration(
          color: categoryItemModel.categoryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.r),
            topRight: Radius.circular(25.r),
            bottomLeft:
                index.isEven ? Radius.circular(25.r) : Radius.circular(0.r),
            bottomRight:
                index.isOdd ? Radius.circular(25.r) : Radius.circular(0.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          child: Column(
            children: [
              SizedBox(
                height: 100.h,
                width: 132.w,
                child: Image(
                  image: AssetImage(categoryItemModel.categoryImage),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  categoryItemModel.categoryTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
