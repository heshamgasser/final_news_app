import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/model/category_item.dart';
import 'package:news_app/views/news_screen.dart';
import 'package:news_app/views/widgets/category_item_widget.dart';
import 'package:news_app/views/widgets/drawer_widget.dart';

class CategoryScreen extends StatelessWidget {
  static const String routeName = 'Category Screen';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'News Cloud',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 35.h),
          child: Column(
            children: [
              Text(
                'Pick Your Category of Interest',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(height: 30.h),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 25.w,
                      mainAxisSpacing: 20.h,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return CategoryItem(
                      categoryItemModel:
                          CategoryItemModel.getCategoryItems()[index],
                      index: index,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          NewsScreen.routeName,
                          arguments:
                              CategoryItemModel.getCategoryItems()[index],
                        );
                      },
                    );
                  },
                  itemCount: CategoryItemModel.getCategoryItems().length,
                ),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: DrawerWidget(),
        ),
      ),
    );
  }
}
