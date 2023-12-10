import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/model/category_item.dart';
import 'package:news_app/views/widgets/drawer_widget.dart';

class NewsScreen extends StatelessWidget {
  static const String routeName = 'News Screen';

  @override
  Widget build(BuildContext context) {

    var args = ModalRoute.of(context)!.settings.arguments as CategoryItemModel;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            args.categoryTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 35.h),
          child: Column(
            children: [

            ],
          ),
        ),
        drawer: Drawer(
          child: DrawerWidget(),
        ),
      ),
    );;
  }
}
