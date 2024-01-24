import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/model/category_item.dart';
import 'package:news_app/providers/app_provider.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/shared/network/api_manager.dart';
import 'package:news_app/views/widgets/drawer_widget.dart';
import 'package:news_app/views/widgets/get_sources_widget.dart';
import 'package:news_app/views/widgets/news_widget.dart';
import 'package:provider/provider.dart';
import '../shared/styles/app_color.dart';
import 'category_screen.dart';

class NewsScreen extends StatelessWidget {
  static const String routeName = 'News Screen';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as CategoryItemModel;

    return ChangeNotifierProvider(
      create: (context) => NewsProvider(),
      builder: (context, child) {
        var newsProvider = Provider.of<NewsProvider>(context);
        var appProvider = Provider.of<AppProvider>(context);

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
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(
                        context, CategoryScreen.routeName);
                  },
                  icon: Icon(
                    Icons.home,
                    size: 30.sp,
                  ),
                )
              ],
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: FutureBuilder(
                future: ApiManager.getSources(category: args.category),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColor.primaryColor,
                      ),
                    );
                  }

                  var sources = snapshot.data?.sources ?? [];
                  return GetSourcesWidget(sources: sources);
                },
              ),
            ),
            drawer: Drawer(
              child: DrawerWidget(),
            ),
          ),
        );
      },
    );
  }
}
